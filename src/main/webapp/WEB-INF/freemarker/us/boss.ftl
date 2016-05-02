<html>
<head>
    <title>我也要当小老板</title>
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
            <div class="col-md-3">
                <div class="product">
                    <div class="product-wrap">
                        <div class="product-img">
                            <a class="product-a" href="#"><img src="${absoluteContextPath}/img/pot.jpg"
                                                               alt="portrait"
                                                               width="200"></a>
                        </div>
                        <div class="product-desc"><span class="word">
                                我们上大学的时候，一个宿舍4个人5口锅。其中人手一个电煮杯，还有个电磁炉，嘘！@_@
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="product">
                    <div class="product-wrap">
                        <div class="product-img">
                            <a class="product-a" href="#"><img src="${absoluteContextPath}/img/hot.jpg"
                                                               alt="portrait"
                                                               width="200"></a>
                        </div>
                        <div class="product-desc"><span class="word">
                                冬天到了后，你也可以准备些热水袋卖给小伙伴们~~
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div style="margin: 50px">
                    <p class="title">想赚些可以任性挥霍的钱</p>
                    <p class="title">上<a href="http://www.1688.com">1688</a>批发心仪的物品吧</p>
                    <p class="title">批量所以比淘宝便宜很多</p>
                    <p class="title">咱们提供送货到宿舍服务</p>
                    <p class="title">认识新同学当面验货交易</p>
                    <p class="title">开启校园的伟大交易时代</p>
                    <h5>请加入我们</h5>
                </div>
            </div>
            <div class="col-md-12">
                <div class="product">
                    <div class="product-wrap">
                        <div class="product-img">
                            <a class="product-a" href="#"><img src="${absoluteContextPath}/img/big.jpg"
                                                               alt="portrait"
                                                               width="200"></a>
                        </div>
                        <div class="product-desc"><span class="word">
                                还有我们可爱的大白，可爱的手办。都可以在<a href="http://www.1688.com">1688</a>上批发
                            </span>
                        </div>
                    </div>
                </div>
                <div class="product">
                    <div class="product-wrap">
                        <div class="product-img">
                            <a class="product-a" href="#"><img src="${absoluteContextPath}/img/shell.jpg"
                                                               alt="portrait"
                                                               width="200"></a>
                        </div>
                        <div class="product-desc"><span class="word">
                                或者是精美的手机壳，小物品。因为咱们是批量，所以价格肯定比淘宝便宜不少
                            </span>
                        </div>
                    </div>
                </div>
                <div class="product">
                    <div class="product-wrap">
                        <div class="product-img">
                            <a class="product-a" href="#"><img src="${absoluteContextPath}/img/radio.jpg"
                                                               alt="portrait"
                                                               width="200"></a>
                        </div>
                        <div class="product-desc"><span class="word">
                                还有新生们需要用到的收音机。咱们可以送货上宿舍门，验货后付款
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-right">
            <div class="pinned">
                <img style="margin-top: 20px" src="${absoluteContextPath}/img/wx.jpg" width="100%"
                     data-toggle="tooltip"
                     data-placement="top" title="微信:busyercom">
                <img style="margin-top: 20px" src="${absoluteContextPath}/img/qq.jpg" width="100%"
                     data-toggle="tooltip"
                     data-placement="top" title="QQ:208260757">
                <img style="margin-top: 20px" src="${absoluteContextPath}/img/zfb.jpg" width="100%"
                     data-toggle="tooltip" data-placement="left" title="支付宝">
            </div>
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
