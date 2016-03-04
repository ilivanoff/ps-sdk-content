$(function () {
    var FMANAGER = PsFoldingManager.FOLDING('ap', 'ips');

    var $BOX = $('#ap-ips');
    var $BUNNONS = $BOX.find('button');
    var $IP_INPUT = $BOX.find('input.ip');
    var $TABLE = $BOX.find('table.ips tbody');

    var um = new PsUpdateModel(null, function () {
        $BUNNONS.uiButtonDisable();
        $IP_INPUT.disable();
    }, function () {
        $BUNNONS.uiButtonEnable();
        $IP_INPUT.enable();
    });

    var doAction = function (ip, action, onOk) {
        if (um.isStarted()) {
            return;//---
        }
        um.start();
        AdminAjaxExecutor.execute('IpBanAction', {
            ip: ip,
            action: action
        },
                function (res) {
                    if (PsIs.func(onOk)) {
                        onOk(res);
                    }
                }, function (error) {
            InfoBox.popupError(error);
        }, function () {
            um.stop();
        });
    }

    $BOX.find('button.ip-ban').button().click(function () {
        var ip = $IP_INPUT.val();
        doAction(ip, 'ban', function (data) {
            if (data.done) {
                $TABLE.prepend($('<tr>').addClass('new').append($('<td>').text(ip)));
            } else {
                InfoBox.popupWarning('IP адрес <b>' + ip + '</b> небыл забанен');
            }
        });
    });

    $BOX.find('button.reload').button({
        text: false,
        icons: {
            primary: 'ui-icon-refresh'
        }
    }).click(function () {
        location.reload();
    });


    var $hovered;
    PsJquery.on({
        ctxt: null,
        parent: 'table.ips',
        item: 'td',
        mouseenter: function (e, $td) {
            if (um.isStarted()) {
                return;//---
            }
            if ($hovered) {
                $hovered.remove();
                $hovered = null;
            }
            var ip = $.trim($td.text());
            $hovered = $('<a>').addClass('del').text('уд').appendTo($td).clickClbck(function () {
                PsDialogs.confirm('Разбанить ip-адрес <b>' + ip + '</b>?', function () {
                    doAction(ip, 'unban', function (data) {
                        if (data.done) {
                            $td.parent().remove();
                        } else {
                            InfoBox.popupWarning('IP адрес <b>' + ip + '</b> небыл разабанен');
                        }
                    });
                });
            });
        },
        mouseleave: function () {
            if ($hovered) {
                $hovered.remove();
                $hovered = null;
            }
        }
    });

//alert(FMANAGER.src('img.png'));
//alert(FMANAGER.store().get('my param', 'my dflt value'));
//FMANAGER.store().set('my param', 'my value');
});