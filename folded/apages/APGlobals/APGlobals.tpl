{if $exists}
    <h4>Глобальные настройки системы:</h4>

    <table id="globals" class="colored editable highlighted">
        {foreach $props as $name=>$prop}
            <tr>
                <td>{$prop->getComment()}</td>
                <td>{$name}</td>
                <td class="fetched">{$prop->getTypeDescr()}</td>
                <td data-tdid="{$name}" class="editable fetched {$prop->getEditType()}">
                    {$prop->getValue()}
                </td>
            </tr>
        {/foreach}
    </table>

    <div class="ctrl">
        <button class="save">Сохранить</button>
        <button class="reload">Перезагрузить</button>
    </div>
{else}
    <div class="info_box warn">
        {if $sdk}
            В режиме <b>SDK</b> работа с файлом глобальных настроек недоступна
        {else}
            Файл глобальных настроек не существует:<br/>
            <b>{$path}</b>
        {/if}
    </div>
{/if}