<html>
<head>
    <title>厦易站</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport"
          content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,maximum-scale=1.0,user-scalable=no;"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no"/>

<#include "../common/chatCss.ftl" >
<#include "../common/commonCss.ftl" >
<#include "../common/commonJs.ftl" >
    <script type="text/javascript" src="${absoluteContextPath}/js/shae/product.js"></script>
    <script type="text/javascript">var absoluteContextPath = '${absoluteContextPath}';</script>

</head>
<body id="news2">
<#include "../common/phead.ftl" >
<div style="padding: 20px">
    <div class="btn-group">
        <button id="chooseItem" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
            选择分类
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
        <#list enums['com.school.shop.common.enumerate.TradeEnum']?values as itemType>
            <li onclick="javascript:alert(3);"><a href="javascript:void(0);">${itemType.getName()}</a></li>
            <#if itemType_index %3 == 0><li role="presentation" class="divider"></li></#if>
        </#list>
        </ul>
    </div>
    <div class="row" style="margin-top: 10px">
        <textarea class="form-control" rows="5" placeholder="有什么好东西要和大家分享？" style="margin-top: 5px"></textarea>
        <div class="col-md-6 col-md-offset-6" style="margin-top: 10px">
            <input type="text" class="form-control" size="20" placeholder="快来联系我啊">
        </div>
        <div class="col-md-6 col-md-offset-6" style="margin-top: 10px">
            <input type="text" class="form-control" size="20" placeholder="校区">
        </div>
    </div>
</div>
</body>
<#include "../common/pfooter.ftl" >
</html>
