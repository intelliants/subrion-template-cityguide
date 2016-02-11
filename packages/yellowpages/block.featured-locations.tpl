{if !empty($featuredLocations[0])}
	<div class="b-section b-section--alt">
		<div class="b-section__title">
			<h2>{lang key='section_featured_locations_title'}</h2>
			<p>{lang key='section_featured_locations_tag'}</p>
		</div>

		<div class="b-section__content">
			<div class="container">
				<div class="row">
					{foreach $featuredLocations[0] as $location}
						<div class="col-md-4">
							<div class="b-card b-card--2">
								<div class="b-card__image">
									{if $location.location_image}
										{$loc_img = unserialize($location.location_image)}
										<img src="{$smarty.const.IA_CLEAR_URL}uploads/{$loc_img.path}" alt="">
									{/if}
									<a href="{ia_url item='ylocs' type='url' data=$location}" class="b-card__image__title">{$location.title}</a>
								</div>
								<div class="b-card__content">
									{if isset($featuredLocations[1][$location.id])}
										<ol>
											{foreach $featuredLocations[1][$location.id] as $entry}
												<li>
													{ia_url item='venues' type='link' data=$entry text=$entry.venue_title}
													<p>{$entry.category}</p>
												</li>
											{/foreach}
										</ol>
									{/if}
								</div>
							</div>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
{/if}