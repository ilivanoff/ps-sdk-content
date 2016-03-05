<input type="input" class="ip"/>
<button class="ip-ban">Забанить</button>
<button class="reload">Перезагрузить</button>

<h4>Список забаненных IP адресов (<span class="count">{count($banned)}</span>):</h4>
<table class="colored ips">
    <tbody>
        {foreach $banned as $ban}
            <tr>
                <td>
                    {$ban}
                </td>
            </tr>
        {/foreach}
    </tbody>
</table>