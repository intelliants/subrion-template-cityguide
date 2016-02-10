{if !empty($ypPopularCategories.top)}
	<div class="b-section b-section--alt">
		<div class="b-section__title">
			<h2>Popular categories</h2>
			<p>Explore some of the best tips from around the city from our partners and friends.</p>
		</div>

		<div class="b-section__content">
			<div class="container">
				<div class="row">
					{foreach $ypPopularCategories.top as $entry}
						<div class="col-md-4">
							<div class="b-card b-card--1"{if $entry.category_image} style="background-image: url('{$smarty.const.IA_CLEAR_URL}uploads/{$entry.category_image.path}');"{/if}>
								<div class="b-card__content">
									<div class="b-card__title">{ia_url item='ycategs' type='link' data=$entry text=$entry.title}</div>
									<div class="b-card__tags">
										{if isset($ypPopularCategories.children[$entry.id])}
											{foreach $ypPopularCategories.children[$entry.id] as $subEntry}
												<a href="{ia_url item='ycategs' type='url' data=$subEntry}">{$subEntry.title|escape:'html'}</a>
											{/foreach}
										{/if}
									</div>
								</div>
							</div>
						</div>

						{if ($entry@iteration % 3 == 0) && !$entry@last}
							</div>
							<div class="row m-t-md">
						{/if}
					{/foreach}
				</div>
			</div>
		</div>
	</div>
{/if}