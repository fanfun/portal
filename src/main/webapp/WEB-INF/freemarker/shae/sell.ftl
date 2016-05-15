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
            <input type="hidden" id="_id" value="${id}">
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu">
        <#list enums['com.school.shop.common.enumerate.TradeEnum']?values as itemType>
            <li data-id="${itemType.getId()}" data-name="${itemType.getName()}" onclick="chooseClassify(this)"><a href="javascript:void(0);">${itemType.getName()}</a></li>
            <#if itemType_index %3 == 0><li role="presentation" class="divider"></li></#if>
        </#list>
        </ul>
    </div>
    <div class="row" style="margin-top: 10px">
        <div class="col-md-12" style="margin-top: 10px">
            <textarea class="form-control" id="_content" rows="5" placeholder="有什么好东西要和大家分享？(选择图片点击upload上传，限3张)"></textarea>
        </div>
        <div class="col-md-12" style="margin-top: 10px">
            <form method="post" enctype="multipart/form-data">
                <input id="file-1" type="file" class="file" name="files" multiple data-max-file-count="3"/>
                <input id="_files" type="hidden" />
            </form>
        </div>
        <div class="col-md-8 col-md-offset-4" style="margin-top: 10px">
            <input type="text" class="form-control" id="_phone" size="20" placeholder="快来联系我啊" style="margin-top: 10px">
            <input type="text" class="form-control" id="_school" size="20" placeholder="校区" style="margin-top: 10px">
        </div>
        <div  class="col-md-4 col-md-offset-8" style="margin-top: 10px">
            <button type="button" class="btn btn-primary" style="margin-top: 10px;width: 100%" onclick="commit()">提交</button>
        </div>
    </div>
</div>
</body>
<#include "../common/pfooter.ftl" >
</html>

<script>
    $("#file-1").fileinput({
        uploadUrl:'/file/img/upload',
        uploadExtraData:{'id':'${id}'},
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
        alert(data.jqXHR.responseText);
    });

    function chooseClassify(obj) {
        name = obj.getAttribute("data-name");
        code = obj.getAttribute("data-id");
        $("#spanChooseItem").text(name);
        $("#_chooseItem").val(code);
    }

    function commit() {
        var item = $("#_chooseItem").val();
        var files = $("#_files").val();
        var describe = $("#_content").val();
        var phone = $("#_phone").val();
        var school = $("#_school").val();

        if(item == "") {
            alert("请选择分类");
            return;
        }
        if(phone == "") {
            alert("你的联系方式呢");
            return;
        }
        if(school == "") {
            alert("你的校区呢");
            return;
        }
        if(describe == "") {
            alert("请填写内容");
            return;
        }
        var params = {
            "id":1,
            "item":item,
            "nick":school,
            "phone":phone,
            "describe":describe
        }
        $.ajax({
                    url: "/shae/sellCommit",
                    data: params,
                    type: "POST",
                    success: function (data) {
                        if(data == "true") {
                            alert("修改成功");
                        }else {
                            alert("修改失败");
                        }
                    }
                });
    }
</script>