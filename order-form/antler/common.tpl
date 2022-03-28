<link rel="stylesheet" type="text/css" href="{assetPath file='all.min.css'}?v={$versionHash}" />
{assetExists file="custom.css"}
<link rel="stylesheet" type="text/css" href="{$__assetPath__}?v={$versionHash}" />
{/assetExists}
<script type="text/javascript" src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>

<!-- Multilingual Condition to RTL & LTR Language -->
{if $language eq 'arabic' || $language eq 'farsi' || $language eq 'hebrew'}<html dir="rtl">
<link href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/auto-rtl/style-rtl.css" property="stylesheet" rel="stylesheet"/>
{else}
<link href="{$WEB_ROOT}/templates/orderforms/{$carttpl}/css/style.css" property="stylesheet" rel="stylesheet"/>
<html>
{/if}