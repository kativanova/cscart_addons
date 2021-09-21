{if "MULTIVENDOR"|fn_allowed_for && $runtime.company_id}
    <div class="dashboard-card dashboard-card--contact_admin cc_vendor_panel">
        <div class="dashboard-card-title">{__("cc_vendor_panel.welcome")}</div>
        <div class="dashboard-card-content">
            <div class="control-group shift-top">
                <p>{__("cc_vendor_panel.add_product")}&nbsp;</p>
                {include
                                                file="buttons/button.tpl"
                                                but_role="text"
                                                but_text=__("add_product")
                                                but_href="products.add"
                                                but_meta="btn btn-primary"
                                                but_icon="icon-plus"
                                            }
                <div class="break"></div>
                <p class="second-row">{__("add_withdrawal")}&nbsp;</p>
                {capture name="add_new_picker"}
                    {include file="views/companies/components/balance_new_payment.tpl" c_url=$c_url}
                {/capture}
                {include file="common/popupbox.tpl"
                                                     id="add_payment"
                                                     text=__("new_withdrawal")
                                                     content=$smarty.capture.add_new_picker
                                                     title=__("add_withdrawal")
                                                     act="general"
                                                     icon="icon-plus"
                                                     link_text=__("new_withdrawal")
                                                     link_class="btn-primary"

                                            }
            </div>
        </div>
    </div>
{/if}