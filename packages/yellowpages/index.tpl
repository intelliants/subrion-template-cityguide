<div class="page-content">
	{if isset($category.title)}
		<div class="lead">{$category.description}</div>

		{if !empty($categories)}
			{if $core.config.categories_as_tags}
				<ul class="tags-list">
					{foreach $categories as $category}
						<li><a href="{ia_url item='ycategs' type='url' data=$category}">{$category.title} {$category.num|default:0}</a></li>
					{/foreach}
				</ul>
			{else}
				<div class="ia-categories">
					{include file='ia-categories.tpl' categories=$categories item='ycategs' show_amount=true num_columns=$core.config.yp_categories_columns icons=true}
				</div>
			{/if}
			{if isset($num_all_categories) && $num_all_categories > $core.config.yp_popular_categ_limit}
				<p><a href="{$smarty.const.IA_PACKAGE_URL}browse/categories/">{lang key='more_categories'}&nbsp;&raquo;</a></p>
			{/if}
		{/if}
	{/if}

	{if !isset($locations)}
		{ia_hooker name='smartyFrontYpBeforeListingsDisplay'}

		{if !empty($venues)}
			{if !isset($no_sorting)}
				<div class="ia-sorting m-t">
					{lang key='sort_by'}:
					<div class="btn-group">
						<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
							{if $sorting.field == 'venue_title'}
								{lang key='title'}
							{elseif $sorting.field == 'views_num'}
								{lang key='popularity'}
							{elseif $sorting.field == 'date_modified'}
								{lang key='date'}
							{/if}
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="{$smarty.const.IA_SELF}?sort=title{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-clock-o"></span> {lang key='title'}</a></li>
							<li><a href="{$smarty.const.IA_SELF}?sort=popularity{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-font"></span> {lang key='popularity'}</a></li>
							<li><a href="{$smarty.const.IA_SELF}?sort=date{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-signal"></span> {lang key='date'}</a></li>
						</ul>
					</div>
					<div class="btn-group pull-right">
						<a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
							{if $sorting.direction == 'asc'}
								{lang key='asc'}
							{else}
								{lang key='desc'}
							{/if}
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="{$smarty.const.IA_SELF}?order=asc{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-long-arrow-down"></span> {lang key='asc'}</a></li>
							<li><a href="{$smarty.const.IA_SELF}?order=desc{if $query_params}&{$query_params}{/if}" rel="nofollow"><span class="fa fa-long-arrow-up"></span> {lang key='desc'}</a></li>
						</ul>
					</div>
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
		{/if}
	{/if}
</div>
{if isset($smarty.get.search) && $smarty.get.search}
	{ia_add_js}
$(function()
{
	var search = '{$smarty.get.search|escape:'html'}';
	var patt = new RegExp('('+search+')', 'mgi');

	$('td.center-column div.company').find('h4 a,div.description').each(function()
	{
		var text = $(this).html();
		if (patt.exec(text))
		{
			text = text.replace(patt, '<span class="search-find">$1</span>');
			$(this).html(text);
		}
	});
});
	{/ia_add_js}
{/if}