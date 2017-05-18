{if !empty($categories)}
    {$num_columns = ((isset($num_columns)) ? $num_columns : 2)}
    {$class_names = ['col-md-12', 'col-md-6', 'col-md-4', 'col-md-3']}

    <div class="row ia-cats">
        {foreach $categories as $category}
            <div class="{$class_names[$num_columns - 1]}">
                <div class="ia-cat">
                    {if !empty($icons)}
                        {if !empty($category.icon)}
                            <img src="{$core.page.nonProtocolUrl}uploads/{$category.icon.path}" alt="{$category.title}">
                        {else}
                            <span class="fa fa-{if isset($category.category_icon_class) && $category.category_icon_class}{$category.category_icon_class}{else}folder{/if}"></span>
                        {/if}
                    {/if}

                    {if isset($islocation)}
                        <span class="fa fa-map-marker"></span>
                    {/if}

                    {if !empty($category.crossed)}@&nbsp;{/if}<a href="{ia_url type='url' item=$item data=$category}">{$category.title|escape}</a>
                    {if !empty($show_amount)}
                        &mdash; {$category.num|default:0}
                    {/if}

                    {if !empty($category.subcategories)}
                        <div class="ia-cat__sub">
                            {foreach $category.subcategories as $subcategory}
                                <a href="{ia_url type='url' item=$item data=$subcategory}">{$subcategory.title}</a>{if !$subcategory@last}, {/if}
                            {/foreach}
                        </div>
                    {/if}
                </div>
            </div>

            {if $category@iteration % $num_columns == 0 && !$category@last}
                </div>
                <div class="row ia-cats">
            {/if}
        {/foreach}
    </div>
{/if}