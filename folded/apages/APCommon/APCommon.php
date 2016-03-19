<?php

/**
 * Базовая админская страница, доступна всем пользователям.
 *
 * @author Admin
 */
class AP_APCommon extends BaseAdminPage {

    public function title() {
        return 'Базовая страница';
    }

    public function buildContent() {
        return '<strong>Товарищи админы, будьте ооочен аккуратны с админкой</strong>';
    }

}

?>