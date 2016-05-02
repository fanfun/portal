/**
 * Created by ruanzf on 2015/5/15.
 */

function getProduct() {
    $("#more").css("display","block");
    var item = $("#item").val();
    var last = $("#last").val();
    $.ajax(
        {
            url: "/shae/product",
            data:{"item":item,"last":last},
            type:"GET",
            dataType:"text",
            success: function(data){
                var products = eval(data);
                showData(products);
            }
        });
}

function askbuy() {
    $("#last").val(100000000);
    var content = $(".page-bizinfo");
    content.html("");
    getAskbuy();
}

function getAskbuy() {
    $("#more").css("display","block");
    var last = $("#last").val();
    $.ajax(
        {
            url: "/shae/askbuy",
            data:{"last":last},
            type:"GET",
            dataType:"text",
            success: function(data){
                var products = eval(data);
                showData(products);
            }
        });
}

function edit(id) {
    var content = $("#content_" + id).html();
    $("#newContent").val(content);
    $("#editId").val(id);
}

function save() {
    var id = $("#editId").val();
    var content = $("#newContent").val();

    $.ajax(
        {
            url: "/shae/modify",
            data: {"id": id, "content": content},
            type: "POST",
            dataType: "text",
            success: function (data) {
                if(data == "ok") {
                    $("#content_" + id).html(content);
                }else{
                    alert("保存失败");
                }
            }
        }
    );
}

function soldOut(id) {
    var r=confirm("确定要下架编号#" + id + "?");
    if (r==true)
    {
        $.ajax(
            {
                url: "/shae/soldOut",
                data: {"id": id},
                type: "POST",
                dataType: "text",
                success: function (data) {
                    if(data == "ok") {
                        alert("已下架");
                    }else{
                        alert("下架失败");
                    }
                }
            }
        );
    }
}

function chooseItem(item, name) {
    $("#more").css("display","block");
    var content = $(".page-bizinfo");
    var chooseItem = $("#chooseItem");
    $.ajax(
        {
            url: "/shae/item",
            data:{"item":item},
            type:"GET",
            dataType:"text",
            success: function(data){
                $("#item").val(item);
                content.html("");
                chooseItem.html(name + "<span class='caret'></span>");
                var products = eval(data);
                showData(products);
            }
        });

}

function showData(products) {
    var content = $(".page-bizinfo");
    var index = $("#last").val();
    $.each(products, function(i, product){
        index = product.id;
        var head = $("<div class='header' style='position: relative;'> " +
        "<h1 id='activity-name'>编号#" + product.id +"</h1>" +
        "<span id='post-date'>" + product.createtime + " | " + product.nick + "</span></div>");

        var describe = $("<div class='text' id='content'><br/>" +
        "<p><span style='line-height:1.5;'>" + product.describe +"</span></p><br/>"+
        "</div>");
        content.append(head);
        content.append(describe);
        if(product.photos.length >0) {
            var pic = $("<div class='showpic'>");
            content.append(pic);
            $.each(product.photos, function(i, photo){
                var img = $("<img src='"+ photo +"'>");
                pic.append(img);
            });
        }
    });
    $("#last").val(index);
}

function go() {
    var type = $("#type").val();
    var search = $("#search").val();
    if(search.length > 20) {
        return;
    }
    $.ajax(
        {
            url: "/shae/search",
            data: {"type": type, "search": search},
            type: "POST",
            dataType: "text",
            success: function (data) {
                var products = eval(data);
                if (products.length > 0) {
                    var content = $(".page-bizinfo");
                    content.html("");
                    $("#more").css("display", "none");
                    showData(products);
                } else {
                    $("#search").val("没找到" + search);
                }
            }
        });
}

