<th width="10%" class="nowrap center mobile-hide">
    <a class="cm-ajax" href="{"`$c_url`&sort_by=position&sort_order=`$search.sort_order_rev`"|fn_url}"
        data-ca-target-id="pagination_contents">{__("position")}
        {if $search.sort_by == "position"}{$c_icon nofilter}
        {else}{$c_dummy nofilter}
        {/if}</a>
</th>