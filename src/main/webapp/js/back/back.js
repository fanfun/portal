/**
 * Created by Administrator on 2014/12/9.
 */

function upload() {
    var form = $("form[name=imageForm]");
    var options  = {
        dataType : null,
        success : function(data) {
            if(data == "") {
                alert("上传失败")
            }else{
                alert("上传成功")
            }
            $("input[name=cover]").val(data);
        }
    };
    form.ajaxSubmit(options);
}

function bigimage() {
    var form = $("form[name=bigimageForm]");
    var options  = {
        dataType : null,
        success : function(data) {
            if(data == "") {
                alert("上传失败")
            }else {
                alert("上传成功");
            }
            $("input[name=pictures]").val(data);
        }
    };
    form.ajaxSubmit(options);
}

function subProduct() {
    var form = $("form[name=productFrm]");
    var options  = {
        dataType : null,
        success : function(data) {
            if(data == "") {
                alert("上传失败")
            }else {
                alert("上传成功");
            }
        }
    };
    form.ajaxSubmit(options);
}


$(document).ready(function(){
    initCategory();
});

function initCategory() {
    $.ajax({
        url:absoluteContextPath + "/back/categoryList",
        type:"GET",
        success:function(data) {
            if(data == "") {
                alert("目录加载失败");
            }else{
                buildCategory(data);
            }
        }

    });
}

function buildCategory(data) {
    var list = $.parseJSON(data);
    var ul = $("#category_ul");
    $.each(list, function (n, value) {
        var li = $("<li role='presentation'><a role='menuitem' href='#'>" + value.name + "</a></li>");
        ul.append(li);
        li.bind("click", function() {
            $("#dropdownCategory").html(value.name);
            $("input[name=category]").val(value.id);
        });
    });
}
