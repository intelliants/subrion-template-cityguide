<div class="b-card b-card--border">
	<div class="b-card__image">
		<a href="{ia_url item='venues' type='url' data=$venue}">
			{printImage imgfile=$venue.image.path|default:'' title=$venue.venue_title}
		</a>
	</div>
	<div class="b-card__content">
		{ia_hooker name='smartyItemBlockBeforeTitle'}
		<div class="b-card__title">{ia_url type='link' item='venues' data=$venue text=$venue.venue_title}</div>
		<span class="fa fa-map-marker"></span> {$venue.address}, {ia_url item='ylocs' type='link' data=$venue text=$venue.location} {if !empty($venue.zipcode)}, {$venue.zipcode}{/if}
	</div>
</div>

{*
<div class="ia-item ia-item--border ia-item--{$venue.status}{if $venue.featured} ia-item--featured{/if}{if $venue.sponsored} ia-item--sponsored{/if}">

	{if $venue.image}
		<a class="ia-item__image" href="{ia_url item='venues' type='url' data=$venue}">
			{printImage imgfile=$venue.image.path|default:'' width=100 title=$venue.venue_title class='img-responsive'}
		</a>
	{/if}

	<div class="ia-item__labels">
		{if $member && $member.id == $venue.member_id && iaCore::STATUS_ACTIVE != $venue.status}
			<span class="label label-{$venue.status}" title="{lang key=$venue.status default=$venue.status}"><span class="fa fa-warning"></span> {lang key=$venue.status default=$venue.status}</span>
		{/if}
		{if $venue.sponsored}<span class="label label-warning" title="{lang key='sponsored'}"><span class="fa fa-star"></span> {lang key='sponsored'}</span>{/if}
		{if $venue.featured}<span class="label label-info" title="{lang key='featured'}"><span class="fa fa-star-o"></span> {lang key='featured'}</span>{/if}
	</div>

	<div class="ia-item__content">
		<div class="ia-item__actions">
			{printFavorites item=$venue itemtype='venues' guests=true}
			{accountActions item=$venue itemtype='venues'}

			<a href="{ia_url type='url' item='venues' data=$venue}">{lang key='details'} <span class="fa fa-angle-double-right"></span></a>
		</div>

		<div class="ia-item__title">
			{ia_url item='venues' type='link' data=$venue text=$venue.venue_title}
		</div>

		{ia_hooker name='smartyItemListAfterTitle'}

		<div class="ia-item__additional">
			{if !empty($venue.address)}
				<p><span class="fa fa-map-marker"></span> {$venue.address}, {ia_url item='ylocs' type='link' data=$venue text=$venue.location}</p>
			{/if}
		</div>

		{if !empty($venue.phone)}<p><span class="fa fa-phone"></span> {$venue.phone}</p>{/if}

		{ia_hooker name='smartyItemListBeforeInfoPost'}
	</div>

	<div class="ia-item__panel">
		{if 'yellowpages_home' != $core.page.name && isset($venue.category_title) && '' != $venue.category_title}
			<span class="ia-item__panel__item pull-left"><span class="fa fa-folder-o"></span> {ia_url item='ycategs' type='link' data=$venue text=$venue.category_title action='view'}</span>
		{/if}
		{if !empty($venue.url)}
			{assign var='url' value='|'|explode:$venue.url}
			<span class="ia-item__panel__item pull-right"><span class="fa fa-external-link"></span> <a href="{$url[0]}">{$url[1]}</a></span>
		{/if}
	</div>
</div>
*}