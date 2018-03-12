{if !empty($categories)}
    <div class="ia-categories">
        {include 'ia-categories.tpl' categories=$categories item='ycateg' show_amount=true num_columns=$core.config.yp_categories_columns icons=true}
    </div>
{/if}