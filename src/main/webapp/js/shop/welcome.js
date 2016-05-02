
$(function() {
    $('[data-toggle="tooltip"]').tooltip()

    $(".pinned").pin({
        containerSelector: ".container"
    });
});

function like(id) {
    mklove(1, id);
}

function want(id) {
    mklove(2, id);
}

function mklove(type, id) {
    $.ajax({
        url:absoluteContextPath + "/mklove",
        data:{"type":type, "id":id},
        type:"POST",
        success:function(data) {
            if(type == 1) {
                $("#like_" + id).html("(" + data + ")");
            }else if(type == 2) {
                $("#want_" + id).html("(" + data + ")");
            }
        }

    });
}

function initDetail(index) {
    var pictures = $("#detail_" + index).val();
    var description = $("#description_" + index).val();
    var picList = pictures.split("##");
    var modal = $("#modalbody");
    modal.html("");
    $.each(picList, function(index, pic) {
        if(pic != ""){
            var url = absoluteContextPath + "/img/" + pic;
            modal.append("<img style='margin-bottom:15px' width='100%' src='" + url + "' />");
        }
    });
    modal.append("<p style='color: #666'>" + description + "</p>");
}
