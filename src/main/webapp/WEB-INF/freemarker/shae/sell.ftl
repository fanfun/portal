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
    <link href="${absoluteContextPath}/css/classify/fileinput.min.css" rel="stylesheet">
    <script type="text/javascript" src="${absoluteContextPath}/js/shae/product.js"></script>
    <script type="text/javascript" src="${absoluteContextPath}/js/shae/fileinput.min.js"></script>
    <script type="text/javascript">var absoluteContextPath = '${absoluteContextPath}';</script>

</head>
<body id="news2">
<#include "../common/phead.ftl" >
<div style="padding: 20px">
    <div class="btn-group">
        <button id="chooseItem" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
            <span id="spanChooseItem">选择分类</span>
            <input type="hidden" id="_chooseItem">
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
        <#list enums['com.school.shop.common.enumerate.TradeEnum']?values as itemType>
            <li onclick="chooseClassify('${itemType.getId()}', '${itemType.getName()}')"><a href="javascript:void(0);">${itemType.getName()}</a></li>
            <#if itemType_index %3 == 0><li role="presentation" class="divider"></li></#if>
        </#list>
        </ul>
    </div>
    <div class="row" style="margin-top: 10px">
        <div class="col-md-12" style="margin-top: 10px">
            <textarea class="form-control" rows="5" placeholder="有什么好东西要和大家分享？(选择图片点击upload上传，限3张)"></textarea>
        </div>
        <div class="col-md-12" style="margin-top: 10px">
            <form method="post" enctype="multipart/form-data">
                <input id="file-1" type="file" class="file" name="files" />
            </form>
        </div>
        <div class="col-md-8 col-md-offset-4" style="margin-top: 10px">
            <input type="text" class="form-control" size="20" placeholder="快来联系我啊" style="margin-top: 5px">
            <input type="text" class="form-control" size="20" placeholder="校区" style="margin-top: 5px">
        </div>
    </div>
</div>
</body>
<#include "../common/pfooter.ftl" >
</html>

<script>
    $("#file-1").fileinput({
        uploadUrl:'/file/img/upload',
        uploadAsync:false,
        allowedFileExtensions : ['jpg', 'png','gif'],
        overwriteInitial: false,
        dropZoneEnabled:false,
        maxFileSize: 10000,
        maxFilesNum: 10,
        maxFileCount: 3
    });

    //同步上传错误处理
    $('#file-1').on('filebatchuploaderror', function(event, data, msg) {
        alert("filebatchuploaderror");
        alert(JSON.stringify(data));
        alert(data);
        alert(data.jqXHR.responseText);
    });

    function chooseClassify(code, name) {
        $("#spanChooseItem").text(name);
        $("#_chooseItem").val(code);
    }
</script>