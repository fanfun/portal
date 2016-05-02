<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>厦易站</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
<div class="page-bizinfo">
    <div class="header" style="position: relative;">
        <h1 id="activity-name">设置信息</h1>
    </div>
    <div>
        <div class="row" style="margin-top: 20px">
            <input type="hidden" id="name" value="${student.name}">

            <div class="col-md-4">
                昵称：
            </div>
            <div class="col-md-8">
                <input type="text" id="nickName" class="form-control" placeholder="例如：静静"
                       value="${student.nickName}">
            </div>
        </div>
        <div class="row" style="margin-top: 20px">
            <div class="col-md-4">
                校区：
            </div>
            <div class="col-md-8">
                <input type="text" id="nick" class="form-control" placeholder="例如：本部、翔安" value="${student.nick}">
            </div>
        </div>
        <div class="row" style="margin-top: 20px">
            <div class="col-md-4">
                联系方式：
            </div>
            <div class="col-md-8">
                <input type="text" id="phone" class="form-control" placeholder="例如：QQ123456"
                       value="${student.phone}">
            </div>
        </div>
    </div>
    <div style="margin-top: 20px">
        <button type="button" onclick="commit()" class="btn btn-default btn-block">提交</button>
    </div>
</div>
</body>
<#include "../common/pfooter.ftl" >
</html>

<script type="text/javascript">

    function commit() {
        var name = $("#name").val();
        var nick = $("#nick").val();
        var phone = $("#phone").val();
        var nickName = $("#nickName").val();
        if(nick == "") {
            alert("你的校区呢");
            return;
        }

        if(phone == "") {
            alert("你的联系方式呢");
            return;
        }

        if(nickName == "") {
            alert("你的昵称呢");
            return;
        }

        var params = {
            "name":name,
            "nick":nick,
            "phone":phone,
            "nickName":nickName
        }
        $.ajax(
                {
                    url: "/shae/setinfo",
                    data: params,
                    type: "POST",
                    dataType: "text",
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