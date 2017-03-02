<div class="b-card b-card--border">
	<div class="b-card__image">
		<a href="{ia_url item='venues' type='url' data=$venue}">
			{ia_image file=$venue.image title=$venue.venue_title}
		</a>

		{printFavorites item=$venue itemtype='venues' guests=true tpl='no-text' classname='b-card__fav'}
		{if 'yellowpages_home' != $core.page.name && isset($venue.category_title) && '' != $venue.category_title}
			<a class="b-card__cat" href="{ia_url item='ycategs' type='url' data=$venue action='view'}" data-toggle="tooltip" title="{$venue.category_title}"><span class="fa fa-{if $venue.category_icon_class}{$venue.category_icon_class}{else}folder{/if}"></span></a>
		{/if}
	</div>
	<div class="b-card__labels">
		{if $member && $member.id == $venue.member_id && iaCore::STATUS_ACTIVE != $venue.status}
			<span class="label label-{$venue.status}" title="{lang key=$venue.status default=$venue.status}"><span class="fa fa-warning"></span> {lang key=$venue.status default=$venue.status}</span>
		{/if}
		{if $venue.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
		{if $venue.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
	</div>
	<div class="b-card__content">
		{ia_hooker name='smartyItemBlockBeforeTitle'}
		<div class="b-card__title">{ia_url type='link' item='venues' data=$venue text=$venue.venue_title}</div>
		<p><span class="fa fa-map-marker"></span> {$venue.address}, {ia_url item='ylocs' type='link' data=$venue text=$venue.location}{if !empty($venue.zipcode)} {$venue.zipcode}{/if}</p>
	</div>
</div>