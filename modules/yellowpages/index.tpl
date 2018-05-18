<div class="page-content">
    {if isset($category.title)}
        <div class="lead">{$category.description}</div>

        {if !empty($categories)}
            <div class="ia-categories js-categories">
                {include 'ia-categories.tpl' categories=$categories item='ycateg'
                    show_amount={!($core.config.yp_obtain_location && $core.config.yp_location_filter)}
                    num_columns=$core.config.yp_categories_columns icons=true}

                {if count($categories) > 12}
                    <div class="ia-categories-more"><a class="js-more-cats" href="#" data-less-cats-text="<span class='fa fa-angle-up'></span> {lang key='less_cats'}" data-more-cats-text="<span class='fa fa-angle-down'></span> {lang key='more_cats'}"><span class="fa fa-angle-down"></span> {lang key='more_cats'}</a></div>
                {/if}
            </div>
        {/if}
    {/if}

    {if !isset($locations)}
        {ia_hooker name='smartyFrontYpBeforeListingsDisplay'}

        {if !empty($listings)}
            {include 'module:yellowpages/_sorting.tpl'}

            <div class="ia-items">
                <div class="row">
                    {foreach $listings as $venue}
                        <div class="col-md-4">
                            {include 'module:yellowpages/list-venues.tpl' iteration=$venue@iteration}
                        </div>

                        {if ($venue@iteration % 3 == 0) && !$venue@last}
                            </div>
                            <div class="row">
                        {/if}
                    {/foreach}
                </div>

                {navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aNumPageItems=5 aTruncateParam=0}
            </div>
        {/if}
    {/if}
</div>
{if isset($smarty.get.search) && $smarty.get.search}
    {ia_add_js}
$(function() {
    var search = '{$smarty.get.search|escape}';
    var patt = new RegExp('('+search+')', 'mgi');

    $('td.center-column div.company').find('h4 a,div.description').each(function() {
        var text = $(this).html();
        if (patt.exec(text)) {
            text = text.replace(patt, '<span class="search-find">$1</span>');
            $(this).html(text);
        }
    });
});
    {/ia_add_js}
{/if}