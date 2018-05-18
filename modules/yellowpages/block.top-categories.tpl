{if !empty($ypTopCategories)}
    <ul class="tags-list">
        {foreach $ypTopCategories as $category}
            <li><a href="{$category.link}">{$category.title}
            {if !($core.config.yp_obtain_location && $core.config.yp_location_filter)}
                {$category.num|default:0}
            {/if}</a></li>
        {/foreach}
    </ul>
{/if}