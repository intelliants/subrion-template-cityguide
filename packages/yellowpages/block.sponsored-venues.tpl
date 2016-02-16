{if !empty($sponsoredVenues)}
	<div class="row">
		{foreach $sponsoredVenues as $page}
			<div class="col-md-3">
				<div class="b-card b-card--border">
					<div class="b-card__image">
						<a href="{ia_url item='venues' type='url' data=$page}">
							{printImage imgfile=$page.image.path|default:'' title=$page.venue_title}
						</a>

						{printFavorites item=$page itemtype='venues' guests=true tpl='no-text' classname='b-card__fav'}
						{if 'yellowpages_home' != $core.page.name && isset($page.category_title) && '' != $page.category_title}
							<a class="b-card__cat" href="{ia_url item='ycategs' type='url' data=$page action='view'}" data-toggle="tooltip" title="{$page.category_title}"><span class="fa fa-{if $page.category_icon_class}{$page.category_icon_class}{else}folder{/if}"></span></a>
						{/if}
					</div>
					<div class="b-card__content">
						{ia_hooker name='smartyItemBlockBeforeTitle'}
						<div class="b-card__title">{ia_url type='link' item='venues' data=$page text=$page.venue_title}</div>
						<span class="fa fa-map-marker"></span> {$page.address}, {ia_url item='ylocs' type='link' data=$page text=$page.location} {if !empty($page.zipcode)}, {$page.zipcode}{/if}
					</div>
				</div>
			</div>

			{if ($page@iteration % 4 == 0) && !$page@last}
				</div>
				<div class="row m-t">
			{/if}
		{/foreach}
	</div>
{/if}
