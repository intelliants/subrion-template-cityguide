<form action="{$smarty.const.IA_URL}venues/search/" class="b-search{if 'index' != $core.page.name} b-search--inner{/if}">
	<div class="row">
		<div class="col-md-5">
			<div class="b-search__keywords">
				<input class="form-control input-lg" type="text" name="search" id="search_key" value="{$ypSearchInfo.term}" placeholder="{lang key='search_what'}">
			</div>
		</div>
		<div class="col-md-5">
			<div class="b-search__location">
				<input class="form-control input-lg" type="text" name="loc" id="search_loc" autocomplete="off" value="{$ypSearchInfo.location}" data-location="{$ypSearchInfo.location}">
				{if $core.config.yp_obtain_location}
					<a href="#locationChangeModal" data-toggle="modal"{if !isset($smarty.cookies.location_set)} title="{lang key='location_set_to'} {location get='title'}" data-tooltip="true"{/if}><span class="fa fa-compass"></span></a>
				{/if}
			</div>
		</div>
		<div class="col-md-2">
			<button type="submit" class="btn btn-primary btn-lg btn-block" title="{lang key='search'}"><span class="fa fa-search"></span></button>
		</div>
	</div>
</form>

{ia_add_js}
$(function()
{
	$('#search_loc').typeahead(
	{
		source: function(query, process)
		{
			listings = { };

			return $.ajax(
			{
				url: intelli.config.packages.yellowpages.url + 'yellowpages/read.json',
				type: 'get',
				dataType: 'json',
				displayField: 'title',
				data: { action: 'autocomplete', q: query },
				success: function(data)
				{
					var display = [];

					$.each(data, function (i, listing)
					{
						listings[listing.title] = listing;
						display.push(listing.title);
					});

					return process(display);
				}
			});
		}
	});

	// Show that location is set for the first time.
	{if !isset($smarty.cookies.location_set) && $core.config.yp_obtain_location}
		setTimeout(function()
		{
			$('[data-tooltip="true"]').tooltip({
				container: 'body',
				placement: 'left'
			}).tooltip('show');

			setTimeout(function()
			{
				$('[data-tooltip="true"]').tooltip('destroy');
			}, 2500);

			intelli.cookie.write('location_set', true);
		}, 500);
	{/if}
});
{/ia_add_js}
