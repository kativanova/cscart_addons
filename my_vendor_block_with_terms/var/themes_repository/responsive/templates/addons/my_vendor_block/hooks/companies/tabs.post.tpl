<div id="content_terms" class="{if $selected_section && $selected_section !== "terms"}hidden{/if}">
{if $company_data.terms}
   <div class="ty-wysiwyg-content">
       {$company_data.terms nofilter}
   </div>
{/if}
</div>