<html>
<head>
    <title>后台管理系统</title>
<#include "../common/commonCss.ftl" >
<#include "../common/commonJs.ftl" >

    <script type="text/javascript">var absoluteContextPath = '${absoluteContextPath}';</script>
    <script type="text/javascript" src="${absoluteContextPath}/js/jquery/jquery.form.min.js"></script>
    <script type="text/javascript" src="${absoluteContextPath}/js/back/back.js"></script>

</head>
<body style="padding-top: 20px">
<div class="container">
    <div class="col-md-3">
        <form action="${absoluteContextPath}/back/addproduct" name="productFrm" method="POST" >
        <div class="col-md-12">
            <button class="btn btn-default dropdown-toggle" type="button" id="dropdownCategory" data-toggle="dropdown"
                    aria-expanded="true">
                电动车
                <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="category_ul">
            </ul>
            <input type="hidden" name="category" value="1" />
            <input type="hidden" name="label" value="0"/>
        </div>
        <div class="col-md-12" style="margin-top: 20px"><input type="text" class="form-control" name="name" placeholder="商品名称">
        </div>
        <div class="col-md-12" style="margin-top: 20px"><input type="text" class="form-control" name="myPrice" placeholder="价格:99.00">
        </div>
        <div class="col-md-12" style="margin-top: 20px"><input type="text" class="form-control" name="price" placeholder="天猫价:99.00">
        </div>
        <div class="col-md-12" style="margin-top: 20px"><textarea class="form-control" rows="3" name="description" placeholder="描述"></textarea>
        </div>
        <div class="col-md-12" style="margin-top: 20px"><button type="button" class="btn btn-primary" onclick="subProduct()">Submit</button></div>
            <input type="hidden" name="cover"/>
            <input type="hidden" name="pictures"/>
        </form>
    </div>
    <div class="col-md-1">
    </div>
    <div class="col-md-8">
        <div class="row">
            <form action="${absoluteContextPath}/back/image" name="imageForm" method="POST" enctype="multipart/form-data">
                <div class="col-md-6"><input type="file" name="image"/></div>
                <div class="col-md-2">
                    <button class="btn btn-default" type="button" onclick="upload()">
                        上传封面
                    </button>
                </div>
            </form>
        </div>
        <div class="row" style="margin-top: 20px">
            <form action="${absoluteContextPath}/back/bigimage" name="bigimageForm" method="POST" enctype="multipart/form-data">
                <div class="col-md-6"><input type="file" name="imageList"/></div>
                <div class="col-md-2">
                    <button class="btn btn-default" type="button" onclick="bigimage()">
                        上传详图
                    </button>
                </div>
                <div class="col-md-8" style="margin-top: 20px"><input type="file" name="imageList"/></div>
                <div class="col-md-8" style="margin-top: 20px"><input type="file" name="imageList"/></div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
