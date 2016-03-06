$(function() {
    var $BOX = $('#ap-APTestMethods');

    $('.testmethods', $BOX).each(function () {
        var $BODY = $(this);

        function disableAll() {
            $BODY.find('input').disable();
            $BODY.find('button').uiButtonDisable();
        }

        function enableAll() {
            $BODY.find('input').enable();
            $BODY.find('button').uiButtonEnable();
        }

        $BODY.children('li').each(function () {
            var $li = $(this);
            $li.find('button').button().click(function () {
                var $btn = $(this);

                if ($btn.is('.do')) {
                    disableAll();

                    var data = {
                        method: $li.data('name'),
                        params: []
                    };
                    var br = false;
                    $li.find('input, select').each(function () {
                        var $input = $(this);
                        var val = $input.val();
                        br = br || $.trim(val) == '';
                        if (br)
                            return; //---
                        data.params.push(val);
                    });

                    AdminAjaxExecutor.execute('TestAction', data, function (res) {
                        InfoBox.popupSuccess(res);
                    }, data.method, function () {
                        enableAll();
                    });
                }

                if ($btn.is('.clear')) {
                    $li.find('input, select').val('');
                }
            });
        });
    });

});