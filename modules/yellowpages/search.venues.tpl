{if !empty($listings)}
    <div class="ia-items">
        <div class="row">
            {foreach $listings as $venue}
                <div class="col-md-4">
                    {include 'module:yellowpages/list-venues.tpl'}
                </div>

                {if ($venue@iteration % 3 == 0) && !$venue@last}
                    </div>
                    <div class="row">
                {/if}
            {/foreach}
        </div>
    </div>
{else}
    <div class="alert alert-info">{lang key='no_items'}</div>
{/if}