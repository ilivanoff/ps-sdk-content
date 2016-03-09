<?php

class AP_APTestMethods extends BaseAdminPage {

    public function title() {
        return 'Тестовые методы';
    }

    public function buildContent() {
        $navigation = AdminPageNavigation::inst();
        $navigation->setCurrent('Тестовые методы');

        $params['classesStore'] = PsDevClasses::getMethodsList();
        echo $this->getFoldedEntity()->fetchTpl($params);
    }

    public function getSmartyParams4Resources() {
        
    }

}

?>