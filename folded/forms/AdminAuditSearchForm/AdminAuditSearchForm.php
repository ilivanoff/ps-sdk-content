<?php

/**
 * Форма AdminAuditSearchForm
 *
 * @author Admin
 */
class FORM_AdminAuditSearchForm extends BaseSearchForm {

    public function getAuthType() {
        return AuthManager::AUTH_TYPE_AUTHORIZED_AS_ADMIN;
    }

    protected function _construct() {
        parent::_construct();
        $this->setSmartyParam('types', AdminAuditTools::getAuditTypeCombo());
        $this->setSmartyParam('actions', AdminAuditTools::getAuditActionsCombo());
    }

    protected function doSearch(PostArrayAdapter $params) {
        /*
         * Параметры
         */
        $process = $params->int('process');
        $action = $params->int('action');
        $idInst = $params->int('id_inst');
        $idType = $params->int('id_type');
        $dateFrom = $params->int('date_from');
        $dateTo = $params->int('date_to');

        /*
         * Запрос
         */
        $what[] = 'id_rec';
        $what[] = 'concat(ifnull(id_user, ""), concat("/", id_user_authed)) as user';
        $what[] = 'n_action';
        $what[] = 'id_inst';
        $what[] = 'id_type';
        $what[] = 'v_data';
        $what[] = 'b_encoded';
        $what[] = 'v_remote_addr';
        $what[] = 'v_user_agent';
        $what[] = 'dt_event';

        $where['id_process'] = $process;
        if ($action) {
            $where['n_action'] = $action;
        }
        if ($idInst) {
            $where['id_inst'] = $idInst;
        }
        if ($idType) {
            $where['id_type'] = $idType;
        }
        if ($dateFrom) {
            $where[] = Query::assocParam('dt_event', $dateFrom, true, '>=');
        }
        if ($dateTo) {
            $where[] = Query::assocParam('dt_event', $dateTo, true, '<=');
        }

        $order = 'dt_event desc, id_rec desc';

        $limit = 500;
        /*
         * Работа с данными
         */
        $query = Query::select($what, 'ps_audit', $where, null, $order, $limit);
        $result = PSDB::getArray($query);
        foreach ($result as &$row) {
            //Декодируем действие
            $row['n_action'] = PsAuditController::inst($process)->decodeAction($row['n_action']);
            //Удалим слеш в начале пользователя, если он там есть
            $row['user'] = cut_string_start($row['user'], '/');
            //Декодируем данные
            $encoded = 1 * $row['b_encoded'];
            if ($encoded) {
                $row['v_data'] = print_r(PsAuditController::decodeData($row['v_data']), true);
            }
            unset($row['b_encoded']);
        }

        $results = new SearchResults($result, $query);
        $results->addSetting('v_data', SearchResults::COL_PRE);
        $results->addSetting('n_action', SearchResults::COL_NOWRAP);
        return $results;
    }

}

?>