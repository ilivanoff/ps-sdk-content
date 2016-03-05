<form id="{$form_id}" action="{$ajax_url}" method="post">
    {$html_hiddens}
    <fieldset>
        {html_input type="select" label="Тип аудита" id="process" options=$types}
        {html_input type="select" label="Тип Действия" id="action" options=$actions hasEmpty=true}
        {html_input type="text" label="Экземпляр" id="id_inst"}
        {html_input type="text" label="Тип" id="id_type"}
        {html_input type="datetime" label="Дата с" id="date_from"}
        {html_input type="datetime" label="Дата по" id="date_to"}
        {$html_buttons}
    </fieldset>
</form>