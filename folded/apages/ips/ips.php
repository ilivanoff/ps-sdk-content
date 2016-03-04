<?php

class AP_ips extends BaseAdminPage {

    const MODE_SPRITES_LIST = 'sprites_list';
    const MODE_SPRITE = 'sprite';

    private static function getUrl($mode, array $params = array()) {
        $params['mode'] = $mode;
        return self::pageUrl($params);
    }

    public static function urlSpritesList() {
        return self::getUrl(self::MODE_SPRITES_LIST);
    }

    public static function urlSprite($name) {
        return self::getUrl(self::MODE_SPRITE, array('name' => $name));
    }

    public function title() {
        return 'IP адреса';
    }

    public function buildContent() {
        $navigation = AdminPageNavigation::inst();

        $navigation->setCurrent('IP адреса');

        $banned = PsIp::listBanned();
        sort($banned);
        $smartyParams['banned'] = $banned;

        return $this->getFoldedEntity()->fetchTpl($smartyParams);
    }

}

?>