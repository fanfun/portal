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
<div class="btn-group dropup" role="group" style=";position: fixed;z-index: 1024;left:10px;right:10px;bottom: 2px">
    <button id="chooseItem" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
        所有类别
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
        <#list enums['com.school.shop.common.enumerate.TradeEnum']?values as itemType>
            <li onclick="chooseItem('${itemType.getId()}', '${itemType.getName()}')"><a href="javascript:void(0);">${itemType.getName()}</a></li>
            <#if itemType_index %3 == 0><li role="presentation" class="divider"></li></#if>
        </#list>
    </ul>
    <div class="input-group">
        <input type="text" id="search" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" onclick="go()" type="button">Go!</button>
      </span>
    </div>
</div>
<input type="hidden" id="item" value="${item}">
<input type="hidden" id="type" value="1">
<input type="hidden" id="last" value="${last}">
<#include "../common/phead.ftl" >
<#if (products?size=0)>
<div class="page-bizinfo">
    <div class="header" style="position: relative;">
        <h1 id="activity-name">啊哦</h1>
        <span id="post-date">today</span>　
    </div>
    <div class="text" id="content"><br/>

        <p><span style="line-height:1.5;">So sorry, 没有东西哦~</span></p> <br/>
    </div>
</div>
</#if>
<div class="page-bizinfo">
<#list products as product>
    <div class="header" style="position: relative;">
        <h1 id="activity-name">编号#${product.id}</h1>
        <span id="post-date">${product.createtime} | ${product.nick}</span>　
    </div>
    <div class="text" id="content">
        <br/><p><span style="line-height:1.5;">${product.describe}</span></p> <br/>
    </div>
    <#if (product.photos?size!=0)>
        <div class="showpic">
            <#list product.photos as photo>
                <img src="${photo}"/>
            </#list>
        </div>
    </#if>
</#list>
</div>
<div style="padding: 10px;>
    <button type="button" id="more" class="btn btn-default btn-block" onclick="getProduct()">获取更多</button>
</div>
</body>
<#include "../common/pfooter.ftl" >

</html>
