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
    <button type="button" class="btn btn-default dropdown-toggle" onclick="askbuy()">
        全部
    </button>
    <div class="input-group">
        <input type="text" id="search" class="form-control" placeholder="Search for...">
      <span class="input-group-btn">
        <button class="btn btn-default" onclick="go()" type="button">Go!</button>
      </span>
    </div>
</div>
<input type="hidden" id="last" value="${last}">
<input type="hidden" id="type" value="10">

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
<div style="padding: 10px">
    <button type="button" id="more" class="btn btn-default btn-block" onclick="getAskbuy()">获取更多</button>
</div>
</body>
<#include "../common/pfooter.ftl" >
</html>
