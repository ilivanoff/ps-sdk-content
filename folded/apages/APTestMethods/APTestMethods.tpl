{if $production}
    <div class="info_box warn">Тестовые методы недоступны в продуктивном режиме</div>
{else}
    <div id="ap-test-methods" class="ps-tabs">
        {foreach $classes as $className=>$methods}
            <div title="{$className}">
                <ol class="testmethods">
                    {foreach $methods as $name=>$method}
                        <li data-class="{$className}" data-method="{$name}">
                            <h4>{$name}</h4>
                            {text}
                            {$method.descr}
                            {/text}
                            {if not empty($method.params)}
                                <table class="method-names colored">
                                    {foreach $method.params as $param}
                                        <tr>
                                            <td class="col1">{$param.name}</td>
                                            <td><input type="text" name="{$param.name}"/>{if !is_null($param.dflt)} {gray}({$param.dflt}){/gray}{/if}</td>
                                        </tr>
                                    {/foreach}
                                </table>
                            {/if}
                            <button class="do">Выполнить</button>
                            {if not empty($method.params)}
                                <button class="clear">Очистить</button>
                            {/if}
                        </li>
                    {/foreach}
                </ol>

            </div>
        {/foreach}
    </div>
{/if}