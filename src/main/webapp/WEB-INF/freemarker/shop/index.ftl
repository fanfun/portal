<html>
<head>
    <title>芒鹿，为更好的自己</title>
<#include "../common/commonCss.ftl" >
<#include "../common/commonJs.ftl" >

    <script type="text/javascript">var absoluteContextPath = '${absoluteContextPath}';</script>
    <script type="text/javascript" src="${absoluteContextPath}/js/pin/jquery.pin.min.js"></script>
    <script type="text/javascript" src="${absoluteContextPath}/js/shop/welcome.js"></script>

</head>
<body>
<#include "../common/head.ftl" >
<div class="container clearfix">
    <div class="row">
        <div class="col-left">
        <#if (products?size=0)>
        ${message}
        </#if>
        <#list products as product>
            <div class="product">
                <div class="product-wrap">
                    <div class="product-img">
                        <a class="product-a" href="#" onclick="initDetail(${product.id})" data-toggle="modal"
                           data-target="#myModal"><img src="${absoluteContextPath}/img/${product.cover}"
                                                       alt="portrait"
                                                       width="200"></a>
                        <input type="hidden" value="${product.pictures}" id="detail_${product.id}"/>
                        <input type="hidden" value="${product.description}" id="description_${product.id}"/>
                    </div>
                    <div class="product-desc">
                        <table width="100%">
                            <tr>
                                <td width="50%" align="left">
                                    <span class="detail-price">${product.myPrice}.00</span>
                                </td>
                                <td width="50%" align="right">
                                    <span class="word">销量(${product.saleNo})</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="product-desc" title="${product.name}"><span class="word">${product.name}</span></div>
                    <div class="product-desc">
                        <table width="100%">
                            <tr>
                                <td width="50%" align="left">
                                    <span class="glyphicon glyphicon-heart" aria-hidden="true" id="like_${product.id}"
                                          onclick="like(${product.id})" data-toggle="tooltip" data-placement="right"
                                          title="love it">(${product.love})</span>
                                </td>
                                <td width="50%" align="right">
                                    <span class="glyphicon glyphicon-pushpin" aria-hidden="true" id="want_${product.id}"
                                          onclick="want(${product.id})" data-toggle="tooltip" data-placement="left"
                                          title="I want">(${product.want})</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </#list>
        </div>
        <div class="col-right">
            <div class="pinned">
                <img style="margin-top: 20px" src="${absoluteContextPath}/img/wx.jpg" width="100%" data-toggle="tooltip"
                     data-placement="top" title="微信:busyercom">
                <img style="margin-top: 20px" src="${absoluteContextPath}/img/qq.jpg" width="100%" data-toggle="tooltip"
                     data-placement="top" title="QQ:208260757">
                <img style="margin-top: 20px" src="${absoluteContextPath}/img/zfb.jpg" width="100%"
                     data-toggle="tooltip" data-placement="left" title="支付宝">
            </div>
        </div>
        <div>
        </div>
    </div>
</div>
<#include "../common/footer.ftl" >
</body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Picture</h4>
            </div>
            <div class="modal-body" id="modalbody">
            </div>
        </div>
    </div>
</div>
</html>
