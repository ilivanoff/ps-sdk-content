<div id="ap-test-methods-types" class="ps-tabs">
    {foreach $classesStore as $type=>$classes}
        <div title="{$type|strtoupper}">
            <div id="ap-test-methods-{$type}" class="ps-tabs">
                {foreach $classes as $className=>$methods}
                    <div title="{$className}">
                        <ol class="testmethods">
                            {foreach $methods as $name=>$method}
                                <li data-type="{$type}" data-class="{$className}" data-method="{$name}">
                                    <h4>{$name}</h4>
                                    {text}
                                    {$method.descr}
                                    {/text}
                                    {if not empty($method.params)}
                                        <table class="method-names colored">
                                            {foreach $method.params as $param}
                                                <tr>
                                                    <td class="col1">{$param.name}</td>
                                                    <td class="col2"><input type="text" name="{$param.name}"/>{if !is_null($param.dflt)} {gray}({$param.dflt}){/gray}{/if}</td>
                                                    <td class="col3">{$param.descr}</td>
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
        </div>
    {/foreach}
</div>