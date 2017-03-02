{if isset($block_blog_entries) && $block_blog_entries}
	<div class="new-blog-posts">
		{foreach $block_blog_entries as $one_blog_entry}
			<div class="media">
				{if $one_blog_entry.image}
					<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}" class="media-object pull-left">{ia_image file=$one_blog_entry.image width=40 title=$one_blog_entry.title|escape:'html' class='img-responsive'}</a>
				{/if}
				<div class="media-body">
					<h5 class="media-heading">
						<a href="{$smarty.const.IA_URL}blog/{$one_blog_entry.id}-{$one_blog_entry.alias}">{$one_blog_entry.title|escape: 'html'}</a>
					</h5>
					<p>{$one_blog_entry.date_added|date_format:$core.config.date_format}</p>
				</div>
			</div>

			{if $one_blog_entry@iteration == $core.config.blog_number_new_block}
				{break}
			{/if}
		{/foreach}
	</div>

	<p>
		<a href="{$smarty.const.IA_URL}blog/">{lang key='view_all_blog_entries'} &rarr;</a>
	</p>
{else}
	<div class="alert alert-info">{lang key='no_blog_entries'}</div>
{/if}