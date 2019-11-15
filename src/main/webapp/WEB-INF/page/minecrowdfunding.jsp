<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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

    </style>
</head>
<body>
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/user/index"
                       style="font-size:32px;">千锋-创意产品众筹平台</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float:right;">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                    class="glyphicon glyphicon-user"></i>${CURRENT_USER.userName} <span
                                    class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="member.html"><i class="glyphicon glyphicon-scale"></i> 会员中心</a></li>
                                <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                                <li class="divider"></li>
                                <li><a onclick="exit()"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>
<div class="container">
    <div class="row clearfix">
        <div class="col-sm-3 col-md-3 column">
            <div class="row">
                <div class="col-md-12">
                    <div class="thumbnail" style="    border-radius: 0px;">
                        <img src="${pageContext.request.contextPath}/resource/img/tx3.jpg" class="img-thumbnail"
                             alt="A generic square placeholder image with a white border around it, making it resemble a photograph taken with an old instant camera">
                        <div class="caption" style="text-align:center;">
                            <h3>
                                ${CURRENT_USER.userName}
                            </h3>
                            <c:if test="${CURRENT_USER.userAccttype==1}">
                                <span class="label  label-success" style="cursor:pointer;">已实名</span>
                            </c:if>
                            <c:if test="${CURRENT_USER.userAccttype==0}">
                                <span class="label  label-danger" style="cursor:pointer;"
                                      onclick="window.location.href='${pageContext.request.contextPath}/user/accttype/${CURRENT_USER.userId}'">未进行实名认证</span>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-group">
                <div class="list-group-item" style="cursor:pointer;"
                     onclick="window.location.href='${pageContext.request.contextPath}/user/myProperty'">
                    资产总览<span class="badge"><i class="glyphicon glyphicon-chevron-right"></i></span>
                </div>
                <div class="list-group-item active">
                    我的众筹<span class="badge"><i class="glyphicon glyphicon-chevron-right"></i></span>
                </div>
            </div>
        </div>
        <div class="col-sm-9 col-md-9 column">
            <ul id="myTab" style="" class="nav nav-pills" role="tablist">
                <li role="presentation" class="active"><a href="#home" role="tab" data-toggle="tab" aria-controls="home"
                                                          aria-expanded="true">我的众筹</a></li>
                <li role="presentation"><a href="#profile">众筹资产</a></li>
            </ul>
            <div id="myTabContent" class="tab-content" style="margin-top:10px;">
                <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">

                    <ul id="myTab1" class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="#support">我支持的</a></li>
                        <li role="presentation"><a href="#attension">我关注的</a></li>
                        <li role="presentation"><a href="#add">我发起的</a></li>
                        <li class=" pull-right">
                            <button type="button" class="btn btn-warning"
                                    onclick="window.location.href='${pageContext.request.contextPath}/user/viewname/start'">
                                发起众筹
                            </button>
                        </li>
                    </ul>
                    <div id="myTab1" class="tab-content" style="margin-top:10px;">
                        <div role="tabpanel" class="tab-pane fade active in" id="support" aria-labelledby="home-tab">
                            <div class="container-fluid">
                                <div class="row clearfix">
                                    <div class="col-md-12 column">
                                        <span class="label label-warning">全部</span> <span class="label"
                                                                                          style="color:#000;">已支付</span>
                                        <span class="label " style="color:#000;">未支付</span>
                                    </div>
                                    <div class="col-md-12 column" style="margin-top:10px;padding:0;">
                                        <table class="table table-bordered" style="text-align:center;">
                                            <thead>
                                            <tr style="background-color:#ddd;">
                                                <td>项目信息</td>
                                                <td width="90">支持日期</td>
                                                <td width="120">支持金额（元）</td>
                                                <td width="80">回报数量</td>
                                                <td width="80">交易状态</td>
                                                <td width="120">操作</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${goods}" var="good">
                                                <c:if test="${good.goodAndUserStatus == 1}">
                                            <tr id="div${good.goodId}">
                                                <td style="vertical-align:middle;">
                                                    <div  class="thumbnail">
                                                        <div class="caption">
                                                            <h3>
                                                            ${good.goodName}
                                                            </h3>
                                                            <p>

                                                            </p>
                                                            <p>
                                                            <div style="float:left;"><i
                                                                    class="glyphicon glyphicon-screenshot"
                                                                    title="目标金额"></i> 已完成 ${(good.counts*good.orderSale)/good.goodPrice*100}%
                                                            </div>
                                                            <div style="float:right;"><i title="截至日期"
                                                                                         class="glyphicon glyphicon-calendar"></i>
                                                            </div>
                                                            </p>
                                                            <br>
                                                            <div class="progress" style="margin-bottom: 4px;">
                                                                <div
                                                                <%-- class="progress-bar progress-bar-danger"--%>
                                                                <%--                                                                        class="progress-bar progress-bar-info"--%>
                                                                        class="progress-bar progress-bar-striped"
                                                                        role="progressbar" aria-valuenow="40"
                                                                        aria-valuemin="0" aria-valuemax="100"
                                                                        style="width: ${(good.counts*good.orderSale)/good.goodPrice*100}%">
                                                                    <span>众筹中</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>

                                                <td style="vertical-align:middle;"><fmt:formatDate value="${good.orderCreateDate}" pattern="yyyy年MM月dd日HH:mm:ss"></fmt:formatDate></td>
                                                <td style="vertical-align:middle;">￥${good.orderSale*good.counts}<br>(运费：0.00 )</td>
                                                <td style="vertical-align:middle;">${good.counts}</td>
                                                <td style="vertical-align:middle;">交易完成</td>
                                                <td style="vertical-align:middle;">
                                                    <div class="btn-group-vertical" role="group"
                                                         aria-label="Vertical button group">
                                                        <button type="button" id="${good.goodId}" class="btn btn-default">删除订单</button>
                                                        <button type="button" class="btn btn-default">交易详情</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            </c:if>
                                            </c:forEach>

                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade" id="attension" aria-labelledby="attension-tab">
                            <div class="container-fluid">
                                <div class="row clearfix">
                                    <div class="col-md-12 column" style="padding:0;">
                                        <table class="table table-bordered" style="text-align:center;">
                                            <thead>
                                            <tr style="background-color:#ddd;">
                                                <td>项目信息</td>
                                                <td width="120">支持人数</td>
                                                <td width="120">关注人数</td>
                                                <td width="120">操作</td>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td style="vertical-align:middle;">
                                                    <div class="thumbnail">
                                                        <div class="caption">
                                                            <p>

                                                            </p>
                                                            <p>
                                                                <i class="glyphicon glyphicon-jpy"></i> 已筹集 1000.0元
                                                            </p>
                                                            <p>
                                                            <div style="float:left;"><i
                                                                    class="glyphicon glyphicon-screenshot"
                                                                    title="目标金额"></i> 已完成 100%
                                                            </div>
                                                            <div style="float:right;"><i
                                                                    class="glyphicon glyphicon-calendar"></i> 剩余2天
                                                            </div>
                                                            </p>
                                                            <br>
                                                            <div class="progress" style="margin-bottom: 4px;">
                                                                <div class="progress-bar progress-bar-success"
                                                                     role="progressbar" aria-valuenow="40"
                                                                     aria-valuemin="0" aria-valuemax="100"
                                                                     style="width: 40%">
                                                                    <span>众筹中</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td style="vertical-align:middle;">1</td>
                                                <td style="vertical-align:middle;">1</td>
                                                <td style="vertical-align:middle;">
                                                    <div class="btn-group-vertical" role="group"
                                                         aria-label="Vertical button group">
                                                        <button type="button" class="btn btn-default">取消关注</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane fade  " id="add" aria-labelledby="add-tab">
                            <div class="container-fluid">
                                <div class="row clearfix">
                                    <div class="col-md-12 column">
                                        <span class="label label-warning">全部</span> <span class="label"
                                                                                          style="color:#000;">众筹中</span>
                                        <span class="label " style="color:#000;">众筹成功</span> <span class="label "
                                                                                                   style="color:#000;">众筹失败</span>
                                    </div>
                                    <div class="col-md-12 column" style="padding:0;margin-top:10px;">
                                        <table class="table table-bordered" style="text-align:center;">
                                            <thead>
                                            <tr style="background-color:#ddd;">
                                                <td>项目信息</td>
                                                <td width="120">募集金额（元）</td>
                                                <td width="80">当前状态</td>
                                                <td width="120">操作</td>
                                            </tr>
                                            </thead>
                                            <c:forEach items="${goods}" var="good">
                                                <c:if test="${good.goodAndUserStatus == 3}">
                                                <tbody>
                                                <tr>

                                                    <td style="vertical-align:middle;">
                                                        <div class="thumbnail">
                                                            <div class="caption">
                                                                <p>
                                                                    <input type="text" id="${good.goodId}"
                                                                           value="${good.goodId}" hidden/>
                                                                        ${good.goodName}
                                                                    <c:if test="${good.goodTop==999}">
                                                                        <span class="label  label-success"
                                                                              style="cursor:pointer;">已置顶</span>
                                                                    </c:if>
                                                                    <c:if test="${good.goodTop==0}">
                                                                        <span class="label  label-primary"
                                                                              style="cursor:pointer;"
                                                                              onclick="doUp(${good.goodId})">未置顶</span>
                                                                    </c:if>
                                                                </p>
                                                                <p>
                                                                <div style="float:left;"><i
                                                                        class="glyphicon glyphicon-screenshot"
                                                                        title="目标金额"></i> 已完成 100%
                                                                </div>
                                                                <div style="float:right;"><i title="截至日期"
                                                                                             class="glyphicon glyphicon-calendar"></i>
                                                                    剩余10天
                                                                </div>
                                                                </p>
                                                                <br>
                                                                <div class="progress" style="margin-bottom: 4px;">
                                                                    <div class="progress-bar progress-bar-success"
                                                                         role="progressbar" aria-valuenow="40"
                                                                         aria-valuemin="0" aria-valuemax="100"
                                                                         style="width: 40%">
                                                                        <span>众筹中</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td style="vertical-align:middle;">${good.goodPrice}<br>(运费：0.00
                                                        )
                                                    </td>
                                                    <td style="vertical-align:middle;">已发布</td>
                                                    <td style="vertical-align:middle;">
                                                        <div class="btn-group-vertical" role="group"
                                                             aria-label="Vertical button group">
                                                            <button type="button" onclick="showcrowd(${good.goodId})"
                                                                    class="btn btn-info">项目预览
                                                            </button>
                                                            <button type="button" onclick="updatecrowd(${good.goodId})"
                                                                    class="btn btn-warning">修改项目
                                                            </button>
                                                            <button type="button" class="btn btn-danger">删除项目
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                                </c:if>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                    众筹资产
                    <input type="text" id="userId" value="${CURRENT_USER.userId}">
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
                    <a rel="nofollow" href="http://www.qf.com">关于我们</a> | <a rel="nofollow" href="http://www.qf.com">服务条款</a>
                    | <a rel="nofollow" href="http://www.qf.com">免责声明</a> | <a rel="nofollow" href="http://www.qf.com">网站地图</a>
                    | <a rel="nofollow" href="http://www.qf.com">联系我们</a>
                </div>
                <div class="copyRight">
                    Copyright ?2017-2017qf.com 版权所有
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



    $('#myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    })
    $('#myTab1 a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    })
    //项目预览
    var goodid = 0;

    function showcrowd(goodid) {
        var goodId = document.getElementById(goodid);
        var val = goodId.value;
        alert(val);
        window.location.href = "${pageContext.request.contextPath}/good/details/" + val;
    }

    //修改项目
    function updatecrowd(goodid) {
        var goodId = document.getElementById(goodid);
        var val = goodId.value;
        alert(val);
        window.location.href = "${pageContext.request.contextPath}/good/details/" + val;
    }

    //置顶项目
    var userId = 0;

    function doUp(goodid) {
        if (confirm("确认申请置顶吗？")) {
            userId =${CURRENT_USER.userId};
            alert(userId);
            var goodId = document.getElementById(goodid);
            var val = goodId.value;
            alert(val);




            window.location.href = "${pageContext.request.contextPath}/gg/selectAdv?goodId=" + val+"&userId="+userId;

            window.location.href = "${pageContext.request.contextPath}/good/doUp?goodId=" + val+"&userId="+userId;


            window.location.href = "${pageContext.request.contextPath}/good/addADV?goodId=" + val+"&userId="+userId;

        } else {

        }
    }
</script>
</body>
<script type="text/javascript">
    //用户退出的JS
    function exit() {
        if (confirm("确定要退出当前用户吗？")){
            //如果是 去跳转到退出的业务
            window.location.href="${pageContext.request.contextPath}/user/exit";
        }else {
            //啥也不做
        }
    }
//删除我支持的订单

    $("div>button:first-child").click(function (event) {

       $.ajax({
           url:'${pageContext.request.contextPath}/user/delOrder?userId=${CURRENT_USER.userId}&goodId='+event.target.id,
           type:'post',
           success:msg

       });
        function msg() {
            alert("删除成功");
            $('#div'+event.target.id).remove();
        }
   });

</script>
</html>