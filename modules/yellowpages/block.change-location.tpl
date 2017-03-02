{if $core.config.yp_obtain_location}
	<div class="modal fade" id="locationChangeModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">{lang key='your_location'}: {location get='title'}</h4>
				</div>
				<div class="modal-body">
					<div class="yp-locations">
						<div class="input-group input-group-md">
							<span class="input-group-addon">{lang key='change_location'}</span>
							<input type="text" name="loc" id="search_loc2" autocomplete="off" class="form-control" placeholder="{lang key='where_are_you'}">
						</div>
						{if !empty($top_ylocs)}
							<div class="top-locations m-t">
								{foreach $top_ylocs as $loc}
									<p><a href="{$core.packages.yellowpages.url}{$loc.title_alias}/">{$loc.title}</a></p>
								{/foreach}
							</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
	</div>

	{ia_add_js}
$(function()
{
	intelli.searchLocations = function(list)
	{
		var text = '';
		$.each(list, function(index, value)
		{
			var item = value.split('|');
			text += '<a href="'+intelli.config.packages.yellowpages.url + 'location/'+item[1]+'/" class="yp-locations__list__item">'+item[0]+'</a>';
		});
		$('#locations_search').html(text ? text:_t('empty_locations'));
	};
	intelli.preSearchLoc = function(val)
	{
		if (intelli.dataSearch[val])
		{
			intelli.searchLocations(intelli.dataSearch[val]);
		}
		else
		{
			$.ajax(
			{
				url: intelli.config.ia_url + 'venues/search/read.json',
				data: { action: 'autocomplete', mask: val },
				success: function(data)
				{
					if (data.list)
					{
						intelli.dataSearch[val] = data.list;
						intelli.searchLocations(data.list);
					}
				}
			});
		}
	};

	intelli.searchTimeout = null;
	intelli.dataSearch = [];

	$('#search_loc2').parent().after('<div class="yp-locations__list" id="locations_search"></div>');
	$('#search_loc2').keyup(function()
	{
		if (intelli.searchTimeout) clearTimeout(intelli.searchTimeout);
		intelli.searchTimeout = setTimeout('intelli.preSearchLoc("'+$(this).val()+'")', 300);
	});
});
	{/ia_add_js}
{/if}