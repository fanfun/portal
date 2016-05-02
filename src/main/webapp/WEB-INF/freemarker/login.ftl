<html>

<head>
    <meta charset="utf-8">
    <title>用户登录</title>
    <!-- Le styles -->
    <link rel="shortcut icon" href="${absoluteContextPath}/img/logo.ico" mce_href="${absoluteContextPath}/img/logo.ico" type="image/x-icon">
    <link href="${absoluteContextPath}/css/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="${absoluteContextPath}/css/signin.css" rel="stylesheet">
    <link href="${absoluteContextPath}/css/messenger/messenger.css" rel="stylesheet">
    <link href="${absoluteContextPath}/css/messenger/messenger-theme-future.css" rel="stylesheet">

    <script type="text/javascript" src="${absoluteContextPath}/js/jquery/jquery-2.0.3.js"></script>
    <script type="text/javascript" src="${absoluteContextPath}/js/bootstrap/bootstrap.js"></script>
    <script type="text/javascript" src="${absoluteContextPath}/js/messenger/messenger.min.js"></script>
    <script type="text/javascript" src="${absoluteContextPath}/js/messenger/messenger-theme-future.js"></script>
</head>

<body>
<div class="container">
<#if loginError?exists>
    <script type="text/javascript">
        $._messengerDefaults = {
            extraClasses: 'messenger-fixed messenger-on-top'
        };
        $.globalMessenger().post({
            message: "用户名或密码错误，请核实。",
            type: 'error',
            showCloseButton: true
        });
    </script>
</#if>
    <form class="form-signin" action="${absoluteContextPath}/j_spring_security_check" method="post">
        <h2 class="form-signin-heading">请登陆</h2>
        <div class='container-fluid' style="margin-top:40px;">
            <input id='j_username' name='j_username' type="text" class="form-control" placeholder="用户名" autofocus="">
            <input id='j_password' name='j_password' type="password" class="form-control" placeholder="密码">
        </div>
        <div class='container-fluid' style="margin-top:40px;">
            <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
        </div>
    </form>
</div>
<#--<div class="logintop">-->
<#--<div id="top_left"><img  src="${absoluteContextPath}/img/login_03.jpg"/></div>-->
<#--<div id="top_center"></div>-->
<#--</div>-->
<#--<div class="center"></div>-->
<#--<div class="center">-->
<#--<div id="inf"> <span class="copyright">网络加速平台 (网宿科技) 版权所有</span></div>-->
<#--</div>-->

</body>
</html>