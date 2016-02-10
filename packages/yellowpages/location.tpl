<div class="page-content">
	{if isset($location.description)}<div class="slogan">{$location.description}</div>{/if}

	{if !empty($locations)}
		<div class="ia-categories js-categories">
			{include 'ia-categories.tpl' categories=$locations item='ylocs' num_columns=$core.config.yp_categories_columns show_amount=true islocation=true}

			{if count($locations) > 12}
				<div class="ia-categories-more"><a class="js-more-cats" href="#" data-less-cats-text="<span class='fa fa-angle-up'></span> {lang key='less_cats'}" data-more-cats-text="<span class='fa fa-angle-down'></span> {lang key='more_cats'}"><span class="fa fa-angle-down"></span> {lang key='more_cats'}</a></div>
			{/if}
		</div>
	{/if}

	{if !empty($venues)}
		{include file='extra:yellowpages/_sorting'}

		<div class="ia-items">
			<div class="row">
				{foreach $venues as $venue}
					<div class="col-md-4">
						{include file='extra:yellowpages/list-venues' iteration=$venue@iteration}
					</div>

					{if ($venue@iteration % 3 == 0) && !$venue@last}
						</div>
						<div class="row">
					{/if}
				{/foreach}
			</div>

			{navigation aTotal=$pagination.total aTemplate=$pagination.url aItemsPerPage=$pagination.limit aNumPageItems=5 aTruncateParam=0}
		</div>
	{elseif isset($location.id)}
		<div class="alert alert-info">{lang key='no_venues'}</div>
	{/if}
</div>