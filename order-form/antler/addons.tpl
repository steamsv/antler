{include file="orderforms/antler/common.tpl"}

<div id="order-standard_cart">
    <div class="row">
        <div class="cart-sidebar">
            {include file="orderforms/standard_cart/sidebar-categories.tpl"}
        </div>
        <div class="cart-body">
            <div class="header-lined">
                <h1 class="font-size-36">{$LANG.cartproductaddons}</h1>
            </div>
            {include file="orderforms/standard_cart/sidebar-categories-collapsed.tpl"}
            {if count($addons) == 0}
                <div id="noAddons" class="alert alert-warning text-center" role="alert">
                    {$LANG.cartproductaddonsnone}
                </div>
                <p class="text-center">
                    <a href="{$WEB_ROOT}/clientarea.php" class="btn btn-default">
                        <i class="fas fa-arrow-circle-left"></i>
                        {$LANG.orderForm.returnToClientArea}
                    </a>
                </p>
            {/if}
            <div id="addons-antler">
                <div class="products">
                    <div class="row row-eq-height">
                        {foreach $addons as $num => $addon}
                        <div class="col-md-6">
                            <div class="product clearfix" id="product{$num}">
                                <form method="post" action="{$smarty.server.PHP_SELF}?a=add" class="form-inline">
                                    <input type="hidden" name="aid" value="{$addon.id}" />
                                    <div class="product-desc">
                                        <span class="title">{$addon.name}</span>
                                        <p title="{$addon.description|nl2br}"> {$addon.description|nl2br} </p>
                                        
                                        <div class="product-pricing">
                                            {if $addon.free}
                                                {$LANG.orderfree}
                                            {else}
                                                <span class="price">{$addon.recurringamount} <span class="period">{$addon.billingcycle}</span></span>
                                                {if $addon.setupfee}<br />+ {$addon.setupfee} {$LANG.ordersetupfee}{/if}
                                            {/if}
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <footer class="col-12">
                                        <div class="input-group">
                                            <select name="productid" id="inputProductId{$num}" class="form-control">
                                                {foreach $addon.productids as $product}
                                                    <option value="{$product.id}">
                                                        {$product.product}{if $product.domain} - {$product.domain}{/if}
                                                    </option>
                                                {/foreach}
                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-default-yellow-fill btn-md">
                                            <i class="fas fa-shopping-cart"></i>
                                            {$LANG.ordernowbutton}
                                        </button>
                                    </footer>
                                </form>
                            </div>
                        </div>
                        {if $num % 2 != 0}
                    </div>
                    <div class="row row-eq-height">
                        {/if}
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
