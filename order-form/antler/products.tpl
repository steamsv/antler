<script>
jQuery(document).ready(function () {
    jQuery('#btnShowSidebar').click(function () {
        if (jQuery(".product-selection-sidebar").is(":visible")) {
            jQuery('.row-product-selection').css('left','0');
            jQuery('.product-selection-sidebar').fadeOut();
            jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-right"></i> {$LANG.showMenu}');
        } else {
            jQuery('.product-selection-sidebar').fadeIn();
            jQuery('.row-product-selection').css('left','300px');
            jQuery('#btnShowSidebar').html('<i class="fas fa-arrow-circle-left"></i> {$LANG.hideMenu}');
        }
    });
});
</script>

{if $showSidebarToggle}
    <button type="button" class="btn btn-default btn-sm" id="btnShowSidebar">
        <i class="fas fa-arrow-circle-right"></i>
        {$LANG.showMenu}
    </button>
{/if}

<!-- Multilingual Condition to RTL & LTR Language -->
{if $language eq 'arabic' || $language eq 'farsi' || $language eq 'hebrew'}<html dir="rtl">
<link href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/auto-rtl/style-rtl.css" property="stylesheet" rel="stylesheet"/>
{else}
<link href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/style.css" property="stylesheet" rel="stylesheet"/>
<html>
{/if}

<div class="row row-product-selection">
    <div class="col-xs-3 product-selection-sidebar" id="premiumComparisonSidebar">
        {include file="orderforms/standard_cart/sidebar-categories.tpl"}
    </div>
    <div id="order-antler">
        <div class="main-container price-01">
            <div class="col-md-12">
                <h3 id="headline" class="mb-4">
                    {if $productGroup.headline}
                        {$productGroup.headline}
                    {else}
                        {$productGroup.name}
                    {/if}
                </h3>
                {if $productGroup.tagline}
                    <h5 id="tagline">
                        {$productGroup.tagline}
                    </h5>
                {/if}
                {if $errormessage}
                    <div class="alert alert-danger">
                        {$errormessage}
                    </div>
                {elseif !$productGroup}
                    <div class="alert alert-info">
                        {lang key='orderForm.selectCategory'}
                    </div>
                {/if}
            </div>
            <div id="products" class="price-table-container">
                <ul class="row">
                    {foreach $products as $key => $product}
                        {$idPrefix = ($product.bid) ? ("bundle"|cat:$product.bid) : ("product"|cat:$product.pid)}
                        <li class="col-sm-12 col-md-4 col-lg-4" id="$idPrefix}">
                            <div class="price-table">
                                <div class="top-head">
                                    {if $product.tagLine}
                                        <p id="$idPrefix}-tag-line">{$product.tagLine}</p>
                                    {/if}
                                    {if $product.isFeatured}
                                        <div class="popular-plan">
                                            {$LANG.featuredProduct|upper}
                                        </div>
                                    {/if}
                                    <div class="price-area">
                                        <div class="top-area">
                                            <h4 id="$idPrefix}-name">{$product.name}</h4>
                                        </div>
                                        <div class="price" id="$idPrefix}-price">
                                            {if $product.bid}
                                                {$LANG.bundledeal}
                                                {if $product.displayprice}
                                                    <br /><br /><span>{$product.displayPriceSimple}</span>
                                                {/if}
                                            {elseif $product.paytype eq "free"}
                                                {$LANG.orderfree}
                                            {elseif $product.paytype eq "onetime"}
                                                {$product.pricing.onetime} {$LANG.orderpaymenttermonetime}
                                            {else}
                                                {if $product.pricing.hasconfigoptions}
                                                    {$LANG.from}
                                                {/if}
                                                <span class="price">{$product.pricing.minprice.price}</span>
                                                <span class="period">
                                                    {if $product.pricing.minprice.cycle eq "monthly"}
                                                    {$LANG.orderpaymenttermmonthly}
                                                    {elseif $product.pricing.minprice.cycle eq "quarterly"}
                                                        {$LANG.orderpaymenttermquarterly}
                                                    {elseif $product.pricing.minprice.cycle eq "semiannually"}
                                                        {$LANG.orderpaymenttermsemiannually}
                                                    {elseif $product.pricing.minprice.cycle eq "annually"}
                                                        {$LANG.orderpaymenttermannually}
                                                    {elseif $product.pricing.minprice.cycle eq "biennially"}
                                                        {$LANG.orderpaymenttermbiennially}
                                                    {elseif $product.pricing.minprice.cycle eq "triennially"}
                                                        {$LANG.orderpaymenttermtriennially}
                                                    {/if}
                                                </span>
                                                <br>
                                                {if $product.pricing.minprice.setupFee}
                                                    <small>{$product.pricing.minprice.setupFee->toPrefixed()} {$LANG.ordersetupfee}</small>
                                                {/if}
                                            {/if}
                                        </div>
                                        {if $product.qty eq "0"}
                                            <span id="$idPrefix}-unavailable" class="order-button unavailable">{$LANG.outofstock}</span>
                                        {else}
                                            <a href="{$product.productUrl}" class="btn btn-default-pink-fill" id="{$idPrefix}-order-button">
                                                {$LANG.ordernowbutton}
                                            </a>
                                        {/if}
                                    </div>
                                </div>
                                <ul>
                                    {foreach $product.features as $feature => $value}
                                        <li id="$idPrefix}-feature{$value@iteration}">
                                            <span class="feature-value">{$value}</span>
                                            {$feature}
                                        </li>
                                    {foreachelse}
                                        <li id="$idPrefix}-description">
                                            {$product.description}
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
        {if count($productGroup.features) > 0}
            <div class="includes-features">
                <div class="row clearfix">
                    <div class="col-md-12">
                        <div class="head-area">
                            <span>
                                {$LANG.orderForm.includedWithPlans}
                            </span>
                        </div>
                        <ul class="list-features">
                            {foreach $productGroup.features as $features}
                                <li>{$features.feature}</li>
                            {/foreach}
                        </ul>
                    </div>
                </div>
            </div>
        {/if}
    </div>

</div>
