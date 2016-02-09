{if !empty($top_ycategs)}
	<ul class="tags-list tags-list--inverse">
		{foreach $top_ycategs as $category}
			<li><a href="{ia_url item='ycategs' type='url' data=$category}">{$category.title} {$category.num|default:0}</a></li>
		{/foreach}
	</ul>
{/if}