{if !empty($ypTopLocations)}
	<div class="popular-locations">
		{include 'ia-categories.tpl' categories=$ypTopLocations show_amount=false num_columns=3 item='ylocs' islocation=true}
	</div>
{/if}