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
{/if}