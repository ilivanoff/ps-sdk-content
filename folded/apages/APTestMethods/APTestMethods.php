<?php

class AP_APTestMethods extends BaseAdminPage {

    public function title() {
        return 'Тестовые методы';
    }

    public function buildContent() {
        $navigation = AdminPageNavigation::inst();
        $navigation->setCurrent('Тестовые методы');

        $production = PsDefines::isProduction();
        $params['production'] = $production;
        if (!$production) {
            $params['methods'] = TestManagerCaller::getMethodsList();
        }
        echo $this->getFoldedEntity()->fetchTpl($params);
    }

    public function getSmartyParams4Resources() {
        
    }

}

?>