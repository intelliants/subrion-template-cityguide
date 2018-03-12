{if !empty($popularVenues)}
    <div class="row">
        {foreach $popularVenues as $entry}
            <div class="col-md-3">
                <div class="b-card b-card--border">
                    <div class="b-card__image">
                        <a href="{$entry.link}">
                            {ia_image file=$entry.image title=$entry.venue_title class='img-responsive' type='thumbnail'}
                        </a>

                        {printFavorites item=$entry itemtype=$entry.item guests=true tpl='no-text' classname='b-card__fav'}
                        {if 'yellowpages_home' != $core.page.name && isset($entry.category_title) && '' != $entry.category_title}
                            <a class="b-card__cat" href="{ia_url item='ycateg' type='url' data=$entry action='view'}" data-toggle="tooltip" title="{$entry.category_title}"><span class="fa fa-{if $entry.category_icon_class}{$entry.category_icon_class}{else}folder{/if}"></span></a>
                        {/if}
                    </div>
                    <div class="b-card__content">
                        {ia_hooker name='smartyItemBlockBeforeTitle'}
                        <div class="b-card__title">{ia_url type='link' item=$entry.item data=$entry text=$entry.venue_title}</div>
                        <span class="fa fa-map-marker"></span> {$entry.address}, {ia_url item='yloc' type='link' data=$entry text=$entry.location} {if !empty($entry.zipcode)}, {$entry.zipcode}{/if}
                    </div>
                </div>
            </div>

            {if ($entry@iteration % 4 == 0) && !$entry@last}
                </div>
                <div class="row m-t">
            {/if}
        {/foreach}
    </div>
{else}
    <div class="alert alert-info">{lang key='no_venues_here'}</div>
{/if}
