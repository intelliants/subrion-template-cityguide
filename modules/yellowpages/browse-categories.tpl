{if !empty($categories)}
    <div class="ia-categories">
        {include 'ia-categories.tpl' categories=$categories item='ycateg'
            show_amount={!($core.config.yp_obtain_location && $core.config.yp_location_filter)}
            num_columns=$core.config.yp_categories_columns icons=true}
    </div>
{/if}