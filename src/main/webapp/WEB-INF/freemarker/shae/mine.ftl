<html>
<head>
    <title>我的商品</title>
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,maximum-scale=1.0,user-scalable=no;"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="format-detection" content="telephone=no"/>

<#include "../common/chatCss.ftl" >
<#include "../common/commonCss.ftl" >
<#include "../common/commonJs.ftl" >

    <script type="text/javascript">var absoluteContextPath = '${absoluteContextPath}';</script>
    <script type="text/javascript" src="${absoluteContextPath}/js/shae/product.js"></script>

</head>
<body id="news2">
<#include "../common/phead.ftl" >
<#if (products?size=0)>
<div class="page-bizinfo">
    <div class="header" style="position: relative;">
        <h1 id="activity-name">啊哦</h1>
        <span id="post-date">today</span>　
    </div>
    <div class="text" id="content"> <br />
        <p><span style="line-height:1.5;">So sorry, 没有东西哦~</span></p> <br />
    </div>
</div>
</#if>
<div class="page-bizinfo">
    <#list products as product>
    <div class="header" style="position: relative;">
        <h1 id="activity-name">编号#${product.id}<span style="float: right">
                <a href="javascript:soldOut(${product.id});" class="btn btn-default" role="button">下架</a>
                <a href="#" class="btn btn-default" role="button" data-toggle="modal" data-target="#myModal" onclick="edit(${product.id})">编辑</a></span></h1>
        <span id="post-date">${product.createtime} | ${product.type} | ${product.status}</span>
    </div>
        <div class="text" id="content"> <br />
            <p><span style="line-height:1.5;" id="content_${product.id}">${product.describe}</span></p> <br />
        </div>
        <#if (product.photos?size!=0)>
            <div class="showpic">
                <#list product.photos as photo>
                    <img src="${photo}" />
                </#list>
            </div>
        </#if>
    </#list>
</div>
</body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">编辑</h4>
            </div>
            <div class="modal-body">
                <input type="hidden" id="editId">
                <textarea class="form-control" rows="5" id="newContent"></textarea>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="save()">Save</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</html>
