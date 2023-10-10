{** block-description:vendor_terms **}
<div id="content_terms" class="{if $selected_section && $selected_section !== "terms"}hidden{/if}">
    {if $vendor_info.terms}
        <div class="ty-wysiwyg-content">
            {$vendor_info.terms nofilter}
        </div>
    {/if}
</div>