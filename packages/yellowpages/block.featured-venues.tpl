{if !empty($featuredVenues)}
	<div class="ia-items featured-pages">
		{foreach $featuredVenues as $entry}
			<div class="ia-item ia-item--border ia-item--featured">
				<a class="ia-item__image" href="{ia_url item='venues' type='url' data=$entry}">
					{printImage imgfile=$entry.image.path|default:'' width=50 title=$entry.venue_title class='img-responsive'}
				</a>

				<div class="ia-item__content">
					{ia_hooker name='smartyItemBlockBeforeTitle'}
					<div class="ia-item__title">{ia_url type='link' item='venues' data=$entry text=$entry.venue_title}</div>
					<p><span class="fa fa-map-marker"></span> {$entry.address},
						{ia_url item='ylocs' type='link' data=$entry text=$entry.location}
						{if !empty($entry.zipcode)}, {$entry.zipcode}{/if}
					</p>
					<p><span class="fa fa-phone"></span> {$entry.phone}</p>
				</div>
			</div>
		{/foreach}
	</div>
{/if}