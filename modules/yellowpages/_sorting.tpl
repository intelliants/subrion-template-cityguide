{if !isset($no_sorting)}
    <div class="ia-sorting m-t">
        {lang key='sort_by'}:
        <div class="btn-group">
            <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
                {if $sorting.field == 'venue_title'}
                    {lang key='title'}
                {elseif $sorting.field == 'views_num'}
                    {lang key='popularity'}
                {elseif $sorting.field == 'date_modified'}
                    {lang key='date'}
                {/if}
                <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="{$smarty.const.IA_SELF}?sort=title{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-font"></span> {lang key='title'}</a></li>
                <li><a href="{$smarty.const.IA_SELF}?sort=popularity{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-signal"></span> {lang key='popularity'}</a></li>
                <li><a href="{$smarty.const.IA_SELF}?sort=date{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-clock-o"></span> {lang key='date'}</a></li>
            </ul>
        </div>
        <div class="btn-group pull-right">
            <a href="{$smarty.const.IA_SELF}?order=asc{if $query_params}&{$query_params}{/if}" class="btn btn-default{if $sorting.direction == 'asc'} active{/if}" data-toggle="tooltip" title="{lang key='asc'}"><span class="fa fa-long-arrow-down"></span></a>
            <a href="{$smarty.const.IA_SELF}?order=desc{if $query_params}&{$query_params}{/if}" class="btn btn-default{if $sorting.direction == 'desc'} active{/if}" data-toggle="tooltip" title="{lang key='desc'}"><span class="fa fa-long-arrow-up"></span></a>
        </div>
    </div>
{/if}