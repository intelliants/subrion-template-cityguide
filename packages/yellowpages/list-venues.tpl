<div class="b-card b-card--border">
	<div class="b-card__image">
		<a href="{ia_url item='venues' type='url' data=$venue}">
			{printImage imgfile=$venue.image.path|default:'' title=$venue.venue_title}
		</a>

		{printFavorites item=$venue itemtype='venues' guests=true tpl='no-text' classname='b-card__fav'}
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
		{if 'yellowpages_home' != $core.page.name && isset($venue.category_title) && '' != $venue.category_title}
			<p><span class="fa fa-folder"></span> {ia_url item='ycategs' type='link' data=$venue text=$venue.category_title action='view'}</p>
		{/if}
	</div>
</div>