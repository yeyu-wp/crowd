<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="GB18030">
<head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/carousel.css">
    <style>
        h3 {
            font-weight: bold;
        }

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

        /* 侧栏导航 */
        .sideBox {
            padding: 10px;
            height: 220px;
            background: #fff;
            margin-bottom: 10px;
            overflow: hidden;
        }

        .sideBox .hd {
            height: 30px;
            line-height: 30px;
            background: #f60;
            padding: 0 10px;
            text-align: center;
            overflow: hidden;
        }

        .sideBox .hd .more {
            color: #fff;
        }

        .sideBox .hd h3 span {
            font-weight: bold;
            font-size: 14px;
            color: #fff;
        }

        .sideBox .bd {
            padding: 5px 0 0;
        }

        #sideMenu .bd li {
            margin-bottom: 2px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            overflow: hidden;
        }

        #sideMenu .bd li a {
            display: block;
            background: #EAE6DD;
        }

        #sideMenu .bd li a:hover {
            background: #D5CFBF;
        }

        /* 列表页 */
        #mainBox {
            margin-bottom: 10px;
            padding: 10px;
            background: #fff;
            overflow: hidden;
        }

        #mainBox .mHd {
            border-bottom: 2px solid #09c;
            height: 30px;
            line-height: 30px;
        }

        #mainBox .mHd h3 {
            display: initial;
            *display: inline;
            zoom: 1;
            padding: 0 15px;
            background: #09c;
            color: #fff;
        }

        #mainBox .mHd h3 span {
            color: #fff;
            font-size: 14px;
            font-weight: bold;
        }

        #mainBox .path {
            float: right;
        }

        /* 位置导航 */
        .path {
            height: 30px;
            line-height: 30px;
            padding-left: 10px;
        }

        .path a, .path span {
            margin: 0 5px;
        }

        /* 文章列表 */
        .newsList {
            padding: 10px;
            text-align: left;
        }

        .newsList li {
            background: url("../images/share/point.png") no-repeat 2px 14px;
            padding-left: 10px;
            height: 30px;
            line-height: 30px;
        }

        .newsList li a {
            display: inline-block;
            *display: inline;
            zoom: 1;
            font-size: 14px;
        }

        .newsList li .date {
            float: right;
            color: #999;
        }

        .newsList li.split {
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px dotted #ddd;
            height: 0px;
            line-height: 0px;
            overflow: hidden;
        }

        /* 通用带图片的信息列表_普通式 */
        .picList {
            padding: 10px;
            text-align: left;
        }

        .picList li {
            margin: 0 5px;
            height: 190px;
        }

        h3.break {
            font-size: 16px;
            display: block;
            white-space: nowrap;
            word-wrap: normal;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        h3.break > a {
            text-decoration: none;
        }

    </style>
</head>
<body>
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
                                    <li><a href="member.html"><i class="glyphicon glyphicon-scale"></i> 会员中心</a></li>
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


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active" onclick="window.location.href='project.html'" style="cursor:pointer;">
            <img src="${pageContext.request.contextPath}/resource/img/carousel-1.jpg" alt="First slide">
        </div>
        <div class="item" onclick="window.location.href='project.html'" style="cursor:pointer;">
            <img src="${pageContext.request.contextPath}/resource/img/carousel-2.jpg" alt="Second slide">
        </div>
        <div class="item" onclick="window.location.href='project.html'" style="cursor:pointer;">
            <img src="${pageContext.request.contextPath}/resource/img/carousel-3.jpg" alt="Third slide">
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <c:forEach items="${goods}" var="good">
            <c:if test="${good.goodTop==999}">
                <div class="col-lg-4">
                    <img class="img-circle" src="${pageContext.request.contextPath}/resource/img/${good.goodImgUrl}"
                         alt="Generic placeholder image"
                         style="width: 140px; height: 140px;">
                    <h2>${good.goodName}</h2>
                    <p>${good.goodDesc}</p>
                    <p><a class="btn btn-default" href="${pageContext.request.contextPath}/good/details/${good.goodId}"
                          role="button">项目详情 &raquo;</a></p>
                </div>
                <!-- /.col-lg-4 -->
            </c:if>
        </c:forEach>
    </div><!-- /.row -->
</div>


<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="box ui-draggable" id="mainBox">
                <div class="mHd" style="">
                    <div class="path">
                        <a href="projects.html">更多...</a>
                    </div>
                    <h3>
                        科技
                        <small style="color:#FFF;">科技世界</small>
                    </h3>
                </div>
                <div class="mBd" style="padding-top:10px;">
                    <div class="row">
                        <c:forEach items="${goods}" var="good" begin="0" end="3">
                            <c:if test="${good.goodType==0}">
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <a href="${pageContext.request.contextPath}/good/details/${good.goodId}"> <img
                                                alt="300x200"
                                                src="${pageContext.request.contextPath}/resource/img/${good.goodImgUrl}"/></a>
                                        <div class="caption">
                                            <h3 class="break">
                                                    ${good.goodName}
                                            </h3>
                                            <p>
                                            <div style="float:left;"><i class="glyphicon glyphicon-screenshot"
                                                                        title="目标金额"></i> ￥${good.goodPrice}
                                            </div>
                                            <div style="float:right;"><i title="截至日期"
                                                                         class="glyphicon glyphicon-calendar"></i>

                                                <fmt:formatDate type="date" value="${good.goodStartDate}"/>
                                            </div>
                                            </p>
                                            <br>
                                            <div class="progress" style="margin-bottom: 4px;">
                                                <div class="progress-bar progress-bar-success"
                                                     role="progressbar"
                                                     aria-valuenow="1" aria-valuemin="0" aria-valuemax="100"
                                                     style="width:100%">
                                                    <span>99.99%</span>
                                                </div>
                                            </div>
                                            <div><span style="float:right;">
                                                <i class="glyphicon glyphicon-star-empty">关注人数</i></span> <span>
                                                <i class="glyphicon glyphicon-user" title="支持人数"></i>支持人数</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="box ui-draggable" id="mainBox">
                <div class="mHd" style="">
                    <div class="path">
                        <a href="projects.html">更多...</a>
                    </div>
                    <h3>
                        设计
                        <small style="color:#FFF;">设计创意</small>
                    </h3>
                </div>
                <div class="mBd" style="padding-top:10px;">
                    <div class="row">
                        <c:set var="size2" value="0"></c:set>
                        <c:forEach items="${goods}" var="good" begin="0">
                            <c:if test="${good.goodType==1 && size2<=3}">
                                <c:set var="size2" value="${size2+1}"></c:set>
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <a href="${pageContext.request.contextPath}/good/details/${good.goodId}"> <img
                                                alt="300x200"
                                                src="${pageContext.request.contextPath}/resource/img/${good.goodImgUrl}"/></a>
                                        <div class="caption">
                                            <h3 class="break">
                                                    ${good.goodName}
                                            </h3>
                                            <p>
                                            <div style="float:left;"><i class="glyphicon glyphicon-screenshot"
                                                                        title="目标金额"></i> ${good.goodPrice}
                                            </div>
                                            <div style="float:right;"><i title="截至日期"
                                                                         class="glyphicon glyphicon-calendar"></i>
                                                2017-01-31
                                            </div>
                                            </p>
                                            <br>
                                            <div class="progress" style="margin-bottom: 4px;">
                                                <div class="progress-bar progress-bar-success"
                                                     role="progressbar"
                                                     aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
                                                     style="width: 40%">
                                                    <span>30% </span>
                                                </div>
                                            </div>
                                            <div><span style="float:right;"><i
                                                    class="glyphicon glyphicon-star-empty"></i></span> <span><i
                                                    class="glyphicon glyphicon-user"
                                                    title="支持人数"></i> 999</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="box ui-draggable" id="mainBox">
                <div class="mHd" style="">
                    <div class="path">
                        <a href="projects.html">更多...</a>
                    </div>
                    <h3>
                        公益
                        <small style="color:#FFF;">公益活动</small>
                    </h3>
                </div>
                <div class="mBd" style="padding-top:10px;">
                    <div class="row">
                        <c:set var="size1" value="0"></c:set>
                        <c:forEach items="${goods}" var="good">
                            <c:if test="${good.goodType == 2 && size1<= 3}">
                                <c:set var="size1" value="${size1+1}"></c:set>
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <a href="${pageContext.request.contextPath}/good/details/${good.goodId}"> <img
                                                alt="300x200"
                                                src="${pageContext.request.contextPath}/resource/img/${good.goodImgUrl}"/></a>
                                        <div class="caption">
                                            <h3 class="break">
                                                    ${good.goodName}
                                            </h3>
                                            <p>
                                            <div style="float:left;"><i class="glyphicon glyphicon-screenshot"
                                                                        title="目标金额"></i> ${good.goodPrice}
                                            </div>
                                            <div style="float:right;"><i title="截至日期"
                                                                         class="glyphicon glyphicon-calendar"></i>
                                                2017-01-31
                                            </div>
                                            </p>
                                            <br>
                                            <div class="progress" style="margin-bottom: 4px;">
                                                <div class="progress-bar progress-bar-success"
                                                     role="progressbar"
                                                     aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
                                                     style="width: 40%">
                                                    <span>30% </span>
                                                </div>
                                            </div>
                                            <div><span style="float:right;"><i
                                                    class="glyphicon glyphicon-star-empty"></i></span> <span><i
                                                    class="glyphicon glyphicon-user"
                                                    title="支持人数"></i> 999</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="box ui-draggable" id="mainBox">
                <div class="mHd" style="">
                    <div class="path">
                        <a href="projects.html">更多...</a>
                    </div>
                    <h3>
                        农业
                        <small style="color:#FFF;">农业产品</small>
                    </h3>
                </div>
                <div class="mBd" style="padding-top:10px;">
                    <div class="row">
                        <c:set var="size" value="0"></c:set>
                        <c:forEach items="${goods}" var="good" begin="0" varStatus="status">
                            <c:if test="${good.goodType==3 && size<=3}">
                                <c:set var="size" value="${size+1}"></c:set>
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <a href="${pageContext.request.contextPath}/good/details/${good.goodId}"> <img
                                                alt="300x200"
                                                src="${pageContext.request.contextPath}/resource/img/${good.goodImgUrl}"/></a>
                                        <div class="caption">
                                            <h3 class="break">
                                                    ${good.goodName}
                                            </h3>
                                            <p>
                                            <div style="float:left;"><i class="glyphicon glyphicon-screenshot"
                                                                        title="目标金额"></i> ${good.goodPrice}
                                            </div>
                                            <div style="float:right;"><i title="截至日期"
                                                                         class="glyphicon glyphicon-calendar"></i>
                                                2017-01-31
                                            </div>
                                            </p>
                                            <br>
                                            <div class="progress" style="margin-bottom: 4px;">
                                                <div class="progress-bar progress-bar-success"
                                                     role="progressbar"
                                                     aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"
                                                     style="width: 40%">
                                                    <span>30% </span>
                                                </div>
                                            </div>
                                            <div><span style="float:right;"><i
                                                    class="glyphicon glyphicon-star-empty"></i></span> <span><i
                                                    class="glyphicon glyphicon-user"
                                                    title="支持人数"></i> 999</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<!-- FOOTER -->
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div id="footer">
                <div class="footerNav">
                    <a rel="nofollow" href="http://www.qf.com">关于我们</a> | <a rel="nofollow"
                                                                             href="http://www.qf.com">服务条款</a>
                    | <a
                        rel="nofollow" href="http://www.qf.com">免责声明</a> | <a rel="nofollow"
                                                                              href="http://www.qf.com">网站地图</a>
                    | <a
                        rel="nofollow" href="http://www.qf.com">联系我们</a>
                </div>
                <div class="copyRight">
                    Copyright ?2017-2017qf.com 版权所有
                </div>
            </div>

        </div>
    </div>
</div>

</div><!-- /.container -->


<script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/back-to-top.js"></script>
<script>
    $(".thumbnail img").css("cursor", "pointer");
    <%--$(".thumbnail img").click(function () {--%>
    <%--    window.location.href = "${pageContext.request.contextPath}/good/details/${good.goodId}";--%>
    <%--});--%>
    //用户退出的JS
    function exit() {
        if (confirm("确定要退出当前用户吗？")){
            //如果是 去跳转到退出的业务
            window.location.href="${pageContext.request.contextPath}/user/exit";
        }else {
            //啥也不做
        }
    }
</script>
</body>
</html>