<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/theme.css">
    <style>
        #footer {
            padding: 15px 0;
            background: #fff;
            border-top: 1px solid #ddd;
            text-align: center;
        }

        #topcontrol {
            color: #fff;
            z-index: 99;
            width: 30px;
            height: 30px;
            font-size: 20px;
            background: #222;
            position: relative;
            right: 14px !important;
            bottom: 11px !important;
            border-radius: 3px !important;
        }

        #topcontrol:after {
            /*top: -2px;*/
            left: 8.5px;
            content: "\f106";
            position: absolute;
            text-align: center;
            font-family: FontAwesome;
        }

        #topcontrol:hover {
            color: #fff;
            background: #18ba9b;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover {
            border-bottom-color: #ddd;
        }

        .nav-tabs > li > a {
            border-radius: 0;
        }

        #endtime {
            font-style: normal;
            color: #761c19;
        }
    </style>
</head>
<body onload="setTimer()">
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/user/index" style="font-size:32px;">千锋-创意产品众筹平台</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float:right;">

                       <c:if test="${CURRENT_USER.userName == null}">
                           <ul class="nav navbar-nav navbar-right">
                               <li><a href="${pageContext.request.contextPath}/user/viewname/login">登录</a></li>
                               <li><a href="${pageContext.request.contextPath}/user/viewname/reg">注册</a></li>
                           </ul>
                       </c:if>
                       <c:if test="${CURRENT_USER.userName != null}">
                           <ul class="nav navbar-nav">
                               <li class="dropdown">
                                   <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i> ${CURRENT_USER.userName}<span class="caret"></span></a>
                                   <ul class="dropdown-menu" role="menu">
                                       <li><a    onclick="window.location.href='${pageContext.request.contextPath}/user/mycrowd'"><i class="glyphicon glyphicon-scale"></i> 会员中心</a></li>
                                       <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                                       <li class="divider"></li>
                                       <li><a onclick="exit()"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                                   </ul>
                               </li>
                           </ul>
                       </c:if>
                </div>
            </div>
        </nav>
    </div>
</div>

<div class="container theme-showcase" role="main">

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li>
                                <a rel="nofollow" href="${pageContext.request.contextPath}/user/index"><i
                                        class="glyphicon glyphicon-home"></i> 众筹首页</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="${pageContext.request.contextPath}/user/viewname/projects.html"><i
                                        class="glyphicon glyphicon-th-large"></i> 众筹项目</a>
                            </li>
                            <c:if test="${CURRENT_USER.userName == null}">
                                <li>
                                    <a rel="nofollow" onclick="window.location.href='${pageContext.request.contextPath}/user/viewname/login'"><i
                                            class="glyphicon glyphicon-edit"></i> 发起众筹</a>
                                </li>
                            </c:if>
                            <c:if test="${CURRENT_USER.userName != null}">
                            <li>
                                <a rel="nofollow" href="${pageContext.request.contextPath}/user/viewname/start"><i
                                        class="glyphicon glyphicon-edit"></i> 发起众筹</a>
                            </li>
                            </c:if>
                            <c:if test="${CURRENT_USER.userName != null}">
                            <li>
                                <a rel="nofollow"
                                   onclick="window.location.href='${pageContext.request.contextPath}/user/mycrowd'"><i
                                        class="glyphicon glyphicon-user"></i>
                                    我的众筹</a>
                            </li>
                            </c:if>
                            <c:if test="${CURRENT_USER.userName == null}">
                                <li>
                                    <a rel="nofollow"
                                       onclick="window.location.href='${pageContext.request.contextPath}/user/viewname/login'"><i
                                            class="glyphicon glyphicon-user"></i>
                                        我的众筹</a>

                                </li>
                            </c:if>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="jumbotron nofollow" style="    padding-top: 10px;">
                    <input type="text" id="goodid" value="${goods.goodId}" hidden="hidden">
                    <h3>
                        ${goods.goodName}
                    </h3>
                    <div style="float:left;width:70%;">
                        ${goods.goodRemarks}
                    </div>
                    <div style="float:right;">
                        <button type="button" class="btn btn-default" onclick="updateCSS()">
                            <i style="color:#f60" id="follow" class="glyphicon glyphicon-heart-empty"></i> 关注 111
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="row clearfix">
                    <div class="col-md-8 column">
                        <img alt="140x140" width="740"
                             src="${pageContext.request.contextPath}/resource/img/${goods.goodImgUrl}"/>
                        <img alt="140x140" width="740"
                             src="${pageContext.request.contextPath}/resource/img/${goods.goodDescImg}"/>
                    </div>
                    <div class="col-md-4 column">
                        <div class="panel panel-default" style="border-radius: 0px;">
                            <div class="panel-heading" style="background-color: #fff;border-color: #fff;">
                                <span class="label label-primary"><i class="glyphicon glyphicon-tag"></i> 众筹中</span>
                            </div>
                            <div class="panel-body">
                                <h3>
                                    已筹资金：el表达式
                                </h3>
                                <p><span>目标金额 ：${goods.goodPrice}</span><span style="float:right;">达成 ：1%</span></p>
                                <div class="progress" style="height:10px; margin-bottom: 5px;">
                                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60"
                                         aria-valuemin="0" aria-valuemax="100" style="width: 10%;"></div>
                                </div>
                                <p style="color:#CC3300" id="havetime"></p>
                                <input id="endtime" disabled="disabled" value="${haveDate}" hidden/>
                                <div>
                                    <p><span>已有629人支持该项目</p>
                                    <button type="button" class="btn  btn-warning btn-lg btn-block" data-toggle="modal"
                                            data-target="#myModal">立即支持
                                    </button>
                                </div>
                            </div>
                            <div class="panel-footer" style="    background-color: #fff;
                                    border-top: 1px solid #ddd;
                                    border-bottom-right-radius: 0px;
                                    border-bottom-left-radius: 0px;">
                                <div class="container-fluid">
                                    <div class="row clearfix">
                                        <div class="col-md-3 column" style="padding:0;">
                                            <img alt="140x140"
                                                 src="${pageContext.request.contextPath}/resource/img/services-box2.jpg"
                                                 data-holder-rendered="true" style="width: 80px; height: 80px;">
                                        </div>
                                        <div class="col-md-9 column">
                                            <div class="">
                                                <h4>
                                                    <b>${user.userCompany}</b> <span style="float:right;font-size:12px;"
                                                                                     class="label label-success">已认证</span>
                                                </h4>
                                                <p style="font-size:12px">
                                                    我们有一支朝气蓬勃，有激情、有想法、敢实践的团队。

                                                </p>
                                                <p style="font-size:12px">
                                                    客服电话:0595-86218855
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default" style="border-radius: 0px;">
                            <div class="panel-heading">
                                <h3>
                                    ￥1.00 <span style="float:right;font-size:12px;">无限额，447位支持者</span>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <p>配送费用：包邮</p>
                                <p>预计发放时间：项目筹款成功后的50天内</p>
                                <button type="button" class="btn  btn-warning btn-lg"
                                        onclick="isusername()">支持
                                </button>
                                <br><br>
                                <p>感谢您的支持，在众筹开始后，您将以79元的优惠价格获得“遇见彩虹?”智能插座一件（参考价208元）。</p>
                            </div>
                        </div>

                        <div class="panel panel-default" style="border-radius: 0px;">
                            <div class="panel-heading">
                                <h3>
                                    ￥149.00 <span style="float:right;font-size:12px;">限额2000位，剩余1966位</span>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <p>配送费用：包邮</p>
                                <p>预计发放时间：项目筹款成功后的50天内</p>
                                <button type="button" class="btn  btn-warning btn-lg"
                                        onclick="isusername()">支持
                                </button>
                                <br><br>
                                <p>感谢您的支持，在众筹开始后，您将以79元的优惠价格获得“遇见彩虹?”智能插座一件（参考价208元）。</p>
                            </div>
                        </div>
                        <div class=" panel panel-default" style="border-radius: 0px;">
                            <div class="panel-heading">
                                <h3>
                                    风险提示
                                </h3>
                            </div>
                            <div class="panel-body">
                                <p>1.众筹并非商品交易，存在一定风险。支持者根据自己的判断选择、支持众筹项目，与发起人共同实现梦想并获得发起人承诺的回报。<br>
                                    2.众筹平台仅提供平台网络空间及技术支持等中介服务，众筹仅存在于发起人和支持者之间，使用众筹平台产生的法律后果由发起人与支持者自行承担。<br>
                                    3.本项目必须在2017-06-09之前达到￥10000.00 的目标才算成功，否则已经支持的订单将取消。订单取消或募集失败的，您支持的金额将原支付路径退回。<br>
                                    4.请在支持项目后15分钟内付款，否则您的支持请求会被自动关闭。<br>
                                    5.众筹成功后由发起人统一进行发货，售后服务由发起人统一提供；如果发生发起人无法发放回报、延迟发放回报、不提供回报后续服务等情况，您需要直接和发起人协商解决。<br>
                                    6.如您不同意上述风险提示内容，您有权选择不支持；一旦选择支持，视为您已确认并同意以上提示内容。</p>
                            </div>
                        </div>
                        <div><h2>为你推荐</h2>
                            <hr>
                        </div>
                        <div class="prjtip panel panel-default" style="border-radius: 0px;">
                            <div class="panel-body">
                                <img src="${pageContext.request.contextPath}/resource/img/product-3.png" width="100%"
                                     height="100%">
                            </div>
                        </div>

                        <div class="prjtip panel panel-default" style="border-radius: 0px;">
                            <div class="panel-body">
                                <img src="${pageContext.request.contextPath}/resource/img/product-4.jpg" width="100%"
                                     height="100%">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container" style="margin-top:20px;">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div id="footer">
                    <div class="footerNav">
                        <a rel="nofollow" href="http://www.qf.com">关于我们</a> | <a rel="nofollow"
                                                                                 href="http://www.qf.com">服务条款</a> | <a
                            rel="nofollow" href="http://www.qf.com">免责声明</a> | <a rel="nofollow"
                                                                                  href="http://www.qf.com">网站地图</a> | <a
                            rel="nofollow" href="http://www.qf.com">联系我们</a>
                    </div>
                    <div class="copyRight">
                        Copyright ?2010-2014qf.com 版权所有
                    </div>
                </div>

            </div>
        </div>
    </div>
</div> <!-- /container -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog " style="width:960px;height:400px;" role="document">
        <div class="modal-content" data-spy="scroll" data-target="#myScrollspy">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">选择支持项</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row clearfix">
                        <div class="col-sm-3 col-md-3 column" id="myScrollspy">

                            <ul class="nav nav-tabs nav-stacked">
                                <c:forEach items="${money}" var="money" varStatus="index">
                                    <li class="active"><a href="#section-${money.id}">￥${money.money}</a></li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div id="navList" class="col-sm-9 col-md-9 column" style="height:400px;overflow-y:auto;">
                            <c:forEach items="${money}" var="money">
                                <h2 id="section-${money.id}" style="border-bottom:1px dashed #ddd;">
                                    <span style="font-size:20px;font-weight:bold;">￥${money.money}</span>
                                    <span style="font-size:12px;margin-left:60px;"><c:if test="${money.limits eq '1'}">限额</c:if> <c:if test="${money.limits eq '2'}">无限额</c:if>，${money.num}位支持者</span>
                                </h2>
                                <input type="text" value="${money.num}" id="moneynum" hidden>

                                <input type="text" id="moneyid" value="${money.id}" hidden>

                                <p><c:if test="${money.cost eq '0'}">配送费用：全国包邮</c:if>  </p>
                                <p>预计发放时间：项目筹款成功后的${money.rewardTime}天内</p>
                                <button type="button" class="btn  btn-warning btn-lg "
                                     onclick="isusername(${money.id})"/>
                                支持
                                </button>
                                <br><br>
                                <p>${money.descs}</p>
                                <hr>
                                </p>
                            </c:forEach>
                        </div>
                    </div>
                </div>


            </div>

        </div>

    </div>
</div>
</div>
</div>
<script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/back-to-top.js"></script>
<script>
    $(".prjtip img").css("cursor", "pointer");
    $(".prjtip img").click(function () {
        window.location.href = 'project.jsp';
    });

    //js判断用户id是否为空 如果为空则提示
    var moneyid=0;
    function isusername(moneyid) {
        var userName = '${CURRENT_USER.userName}';
       // alert(userName);
       var userId=${CURRENT_USER.userId};
       //alert("用户Id是："+userId);
        //alert("money的id是："+moneyid);
        var goodid=$("#goodid").val();
        //alert("goodid:"+goodid);

        var moneynum=$("#moneynum").val();
       // alert("获取到的moneynum是"+moneynum);
        if (userName == ' ') {
           // alert("登录了才能支持");
            window.location.href = "${pageContext.request.contextPath}/user/viewname/login";
        } else {
            <%--window.location.href = "${pageContext.request.contextPath}/user/viewname/pay-step-1";--%>
            window.location.href = "${pageContext.request.contextPath}/money/ordercontent?moneyid="+moneyid+"&goodid="+goodid+"&moneynum="+moneynum;
        }
    }

    //用户退出的JS
    function exit() {
        if (confirm("确定要退出当前用户吗？")) {
            //如果是 去跳转到退出的业务
            window.location.href = "${pageContext.request.contextPath}/user/exit";
        } else {
            //啥也不做
        }
    }

    //时间倒计时的js
    //时间为一位数时显示格式为："0X"
    function checkTime(i) {
        if (i < 10) {
            i = "0" + i;
        }
        return i;
    }

    function formatTime(timeVal) {
        //定义年月日时分秒
        var datePara = new Date(timeVal);//定义日期对象
        var MM = datePara.getMonth() + 1;//通过日期对象的getMonth()方法返回月
        var dd = datePara.getDate();//通过日期对象的getDate()方法返回日
        var hh = datePara.getHours();//通过日期对象的getHours方法返回时
        var mm = datePara.getMinutes();//通过日期对象的getMinutes方法返回分
        var ss = datePara.getSeconds();//通过日期对象的getSeconds方法返回秒
        // 如果分钟或小时的值小于10，则在其值前加0
        MM = checkTime(MM);
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);
        //setTimeout('formatTime()', 1000);//每一秒中重新加载formatTime()方法
        return MM + "-" + dd + " " + hh + ":" + mm + ":" + ss; //+ " " + day;
    }

    var startTime = '';
    //活动截止时间endTime（以服务器时间为标准，即给定的时间）
    var endTime = '';
    //活动截止时间（以浏览器时间为标准）
    var browserEndTime = '';
    //距离活动结束还剩余的时间（以浏览器为标准）
    var plus = '';
    var end = document.getElementById("endtime").value;
    console.log("===" + end);

    //倒计时
    function setTimer() {
        function setTimer() {
            console.log("==setTimer=");
            if (!plus) {
                //服务器现在的时间（这里只是测试，就用浏览器时间代替）
                startTime = new Date();
                console.log("===" + startTime);
                //活动截止时间endTime（预先给定的值）
                var endTime = new Date(end);
                console.log("===" + endTime);
                //活动截止时间与当前时间的时间差
                plus = endTime - startTime;
                console.log("===" + plus);

            } else {
                //距离活动结束还剩余的时间，第二次以后就不需要再计算，直接自减即可
                plus -= 1000;
                // //更新当前时间(getTime()获取时间转化成毫秒后的数值)
                // startTime = new Date(startTime.getTime() + 1000);
                // $("#start").val(formatTime(startTime));
            }

            var day = parseInt(plus / 1000 / 60 / 60 / 24);
            var hour = parseInt(plus / 1000 / 60 / 60) - day * 24;
            var minute = parseInt(plus / 1000 / 60) - parseInt(plus / 1000 / 60 / 60) * 60;
            var second = parseInt(plus / 1000) - parseInt(plus / 1000 / 60) * 60;

            // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
            day = checkTime(day);
            hour = checkTime(hour);
            minute = checkTime(minute);
            second = checkTime(second);

            document.getElementById("havetime").innerHTML = "距离活动截止，还剩" + day + "天" + hour + "时" + minute + "分" + second + "秒";

            if (plus <= 1) {
                clearInterval(id);
            }
        }

        //每秒循环一次，刷新活动截止时间与当前时间的时间差
        var id = setInterval(setTimer, 1000);
    }

    function updateCSS() {

        if (document.getElementById("follow").className == "glyphicon glyphicon-heart") {
            document.getElementById("follow").className = "glyphicon glyphicon-heart-empty";
        } else {
            document.getElementById("follow").className = "glyphicon glyphicon-heart";
        }
    }
</script>
</body>
</html>