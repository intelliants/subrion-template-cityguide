<div class="ia-item-view">
	<div class="ia-item-view__info">
		{if $item.sponsored}<span class="ia-item-view__info__item"><span class="label label-warning">{lang key='sponsored'}</span></span>{/if}
		{if $item.featured}<span class="ia-item-view__info__item"><span class="label label-info">{lang key='featured'}</span></span>{/if}
		<span class="ia-item-view__info__item" title="{lang key='category'}">
			<span class="fa fa-folder-o"></span> 
			{foreach $categories as $category}
				{ia_url item='ycategs' type='link' data=$category text=$category.title}
				{if !$category@last}/{/if}
			{/foreach}
		</span>
		<span class="ia-item-view__info__item"><span class="fa fa-eye"></span> {$item.views_num}</span>
		<span class="ia-item-view__info__item"><span class="fa fa-calendar"></span> {$item.date_added|date_format:$core.config.date_format}</span>
	</div>

	{if $item.image}
		<div class="ia-item-view__section">
			{printImage imgfile=$item.image.path|default:'' fullimage=true title=$item.venue_title class='img-responsive ia-item-view__image'}
		</div>
	{/if}

	<div class="ia-item-view__section">
		<h3>{lang key='details'}</h3>

		<table class="ia-item-view__table">
			<tbody>
				<tr>
					<td>{lang key='address'}</td>
					<td>{$item.address}, {ia_url item='ylocs' type='link' data=$item text=$item.location}{if $item.zipcode}, {$item.zipcode}{/if}
					</td>
				</tr>
				{if $item.phone}
					<tr>
						<td>{lang key='field_phone'}</td>
						<td>{$item.phone}</td>
					</tr>
				{/if}
				{if $item.local_phone}
					<tr>
						<td>{lang key='field_local_phone'}</td>
						<td>{$item.local_phone}</td>
					</tr>
				{/if}
				{if $item.fax}
					<tr>
						<td>{lang key='field_fax'}</td>
						<td>{$item.fax}</td>
					</tr>
				{/if}
				{if $item.url}
					<tr>
						<td>{lang key='field_url'}</td>
						<td>
							{assign var='url' value='|'|explode:$item.url}
							<span class="fa fa-external-link"></span> <a href="{$url[0]}" target="_blank">{$url[1]}</a>
						</td>
					</tr>
				{/if}
				{if $item.email}
					<tr>
						<td>{lang key='field_email'}</td>
						<td><a href="mailto:{$item.email}" target="_blank">{$item.email}</a></td>
					</tr>
				{/if}
				{if $item.working_hours}
					<tr>
						<td>{lang key='field_working_hours'}</td>
						<td>{$item.working_hours}</td>
					</tr>
				{/if}
				{if $item.payments_methods}
					<tr>
						<td>{lang key='field_payments_methods'}</td>
						<td>
							{$payment_methods = explode(',', $item.payments_methods)}
							{foreach $payment_methods as $one}
								{lang key="field_payments_methods_{$one}"}{if !$one@last}, {/if}
							{/foreach}
						</td>
					</tr>
				{/if}
			</tbody>
		</table>
	</div>

	<div class="ia-item-view__section">
		<h3>{lang key='description'}</h3>

		{$item.description}
	</div>

	{if trim($item.products_services)}
	<div class="ia-item-view__section">
		<h3>{lang key='field_products_services'}</h3>

		{$item.products_services}
	</div>
	{/if}

	{if $item.gallery}
		<div class="ia-item-view__section">
			<h3>{lang key='field_gallery'}</h3>

			{ia_add_media files='fotorama'}

			<div class="ia-item-view__gallery">
				<div class="fotorama" 
					 data-nav="thumbs"
					 data-width="100%"
					 data-ratio="800/400"
					 data-allowfullscreen="true"
					 data-fit="cover">
					{foreach $item.gallery as $entry}
						<a class="ia-item-view__gallery__item" href="{printImage imgfile=$entry.path url=true fullimage=true}">{printImage imgfile=$entry.path title=$entry.title}</a>
					{/foreach}
				</div>
			</div>
		</div>
	{/if}
</div>

{if isset($actionClaimListing)}
	<div class="text-center m-t">
		<a class="btn btn-primary" id="{$actionClaimListing.id}" {foreach $actionClaimListing.attributes as $attr => $value}{$attr}="{$value}" {/foreach}>{$actionClaimListing.title}</a>
	</div>
{/if}

{ia_hooker name='smartyItemListBeforeInfoPost'}

{include file='item-view-tabs.tpl' isView=true exceptions=array('venue_title', 'description', 'address', 'zipcode', 'url', 'phone', 'local_phone', 'fax', 'email', 'image', 'gallery', 'products_services', 'working_hours', 'payments_methods')}

{ia_hooker name='smartyViewListingBeforeFooter'}

{ia_add_js}
$(function()
{
	$('#js-removal-confirmation').on('click', function(e)
	{
		e.preventDefault();

		intelli.confirm(_t('are_you_sure_to_delete_venue'), { url: $(this).attr('href') });
	});
});
{/ia_add_js}