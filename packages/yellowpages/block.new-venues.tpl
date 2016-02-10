{if !empty($newVenues)}
	<div class="row">
		{foreach $newVenues as $page}
			<div class="col-md-3">
				<div class="b-card b-card--border">
					<div class="b-card__image">
						<a href="{ia_url item='venues' type='url' data=$page}">
							{printImage imgfile=$page.image.path|default:'' title=$page.venue_title}
						</a>
					</div>
					<div class="b-card__content">
						{ia_hooker name='smartyItemBlockBeforeTitle'}
						<div class="b-card__title">{ia_url type='link' item='venues' data=$page text=$page.venue_title}</div>
						<span class="fa fa-map-marker"></span> {$page.address}, {ia_url item='ylocs' type='link' data=$page text=$page.location} {if !empty($page.zipcode)}, {$page.zipcode}{/if}
					</div>
				</div>
			</div>
		{/foreach}
	</div>
{else}
	<div class="alert alert-info">{lang key='no_venues'}</div>
{/if}