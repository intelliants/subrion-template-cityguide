{if !empty($ypTopCategories)}
    <ul class="tags-list">
        {foreach $ypTopCategories as $category}
            <li><a href="{$category.link}">{$category.title} {$category.num|default:0}</a></li>
        {/foreach}
    </ul>
{/if}