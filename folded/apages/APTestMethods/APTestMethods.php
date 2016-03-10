<?php

class AP_APTestMethods extends BaseAdminPage {

    public function title() {
        return 'Методы быстрого доступа';
    }

    public function buildContent() {
        $navigation = AdminPageNavigation::inst();
        $navigation->setCurrent('Тестовые методы');

        $params['classesStore'] = PsAdminAccessClasses::getMethodsList();
        echo $this->getFoldedEntity()->fetchTpl($params);
    }

    public function getSmartyParams4Resources() {
        
    }

}

?>