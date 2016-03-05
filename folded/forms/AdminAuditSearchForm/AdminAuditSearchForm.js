$(function() {
    FormHelper.registerOnce({
        form: '#AdminAuditSearchForm',
        onInit: function($form) {
            var $process = $form.find('select[name="process"]');
            $form.find('select[name="action"]').childCombo($process, function(process, $childOptions) {
                return $childOptions.filter('[data-process='+process+'], [value=""]');
            });
        },
        onOk: function() {
        },
        validator: {
            rules: {
                id_inst: {
                    digits: true
                },
                id_type: {
                    digits: true
                }
            },
            messages: {
                id_inst: {
                    digits: 'Требуется целое число'
                },
                id_type: {
                    digits: 'Требуется целое число'
                }
            }
        }
    });
});