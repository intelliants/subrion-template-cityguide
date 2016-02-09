<div class="page-content">
	{if isset($location.description)}<div class="slogan">{$location.description}</div>{/if}

	{if !empty($locations)}
		<div class="ia-categories">
			{include 'ia-categories.tpl' categories=$locations item='ylocs' num_columns=$core.config.yp_categories_columns show_amount=true}
		</div>
	{/if}

	{if !empty($venues)}
		{if !isset($no_sorting)}
			<div class="btn-toolbar items-sorting c">
				<p class="btn-group">
					<span class="btn btn-small disabled">{lang key='sort_by'}:</span>
					{if 'venue_title' == $sorting.field}<span class="btn btn-small disabled">{lang key='title'}</span>{else}<a class="btn btn-small" href="{$smarty.const.IA_SELF}?sort=title" rel="nofollow">{lang key='title'}</a>{/if}
					{if 'views_num' == $sorting.field}<span class="btn btn-small disabled">{lang key='popularity'}</span>{else}<a class="btn btn-small" href="{$smarty.const.IA_SELF}?sort=popularity" rel="nofollow">{lang key='popularity'}</a>{/if}
					{if 'date_modified' == $sorting.field}<span class="btn btn-small disabled">{lang key='date'}</span>{else}<a class="btn btn-small" href="{$smarty.const.IA_SELF}?sort=date" rel="nofollow">{lang key='date'}</a>{/if}
				</p>
				<p class="btn-group">
					{if 'asc' == $sorting.direction}<span class="btn btn-small disabled">{lang key='asc'}</span>{else}<a class="btn btn-small" href="{$smarty.const.IA_SELF}?order=asc" rel="nofollow">{lang key='asc'}</a>{/if}
					{if 'desc' == $sorting.direction}<span class="btn btn-small disabled">{lang key='desc'}</span>{else}<a class="btn btn-small" href="{$smarty.const.IA_SELF}?order=desc" rel="nofollow">{lang key='desc'}</a>{/if}
				</p>
			</div>
		{/if}

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