<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

        .label-type, .label-status, .label-order {
            background-color: #fff;
            color: #f60;
            padding: 5px;
            border: 1px #f60 solid;
        }

        #typeList :not(:first-child) {
            margin-top: 20px;
        }

        .label-txt {
            margin: 10px 10px;
            border: 1px solid #ddd;
            padding: 4px;
            font-size: 14px;
        }

        .panel {
            border-radius: 0;
        }

        .progress-bar-default {
            background-color: #ddd;
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
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                    class="glyphicon glyphicon-user"></i> ${CURRENT_USER.userName}<span
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

<div class="container theme-showcase" role="main">

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li>
                                <a rel="nofollow" href="index.html"><i class="glyphicon glyphicon-home"></i> 众筹首页</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="projects.html"><i class="glyphicon glyphicon-th-large"></i> 项目总览</a>
                            </li>
                            <li class="active">
                                <a rel="nofollow" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 发起项目</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="minecrowdfunding.html"><i class="glyphicon glyphicon-user"></i>
                                    我的众筹</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="panel panel-default">
                    <div class="panel-heading" style="text-align:center;">
                        <div class="container-fluid">
                            <div class="row clearfix">
                                <div class="col-md-3 column">
                                    <div class="progress"
                                         style="height:50px;border-radius:0;    position: absolute;width: 75%;right:49px;">
                                        <div class="progress-bar progress-bar-success" role="progressbar"
                                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">1. 项目及发起人信息</div>
                                        </div>
                                    </div>
                                    <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(92, 184, 92, 1);
                                             border-top-color: rgba(92, 184, 92, 0);
                                             border-bottom-color: rgba(92, 184, 92, 0);
                                             border-right-color: rgba(92, 184, 92, 0);
                                        ">
                                    </div>
                                </div>
                                <div class="col-md-3 column">
                                    <div class="progress"
                                         style="height:50px;border-radius:0;position: absolute;width: 75%;right:49px;">
                                        <div class="progress-bar progress-bar-default" role="progressbar"
                                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">2. 回报设置</div>
                                        </div>
                                    </div>
                                    <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(221, 221, 221, 1);
                                             border-top-color: rgba(221, 221, 221, 0);
                                             border-bottom-color: rgba(221, 221, 221, 0);
                                             border-right-color: rgba(221, 221, 221, 0);
                                        ">
                                    </div>
                                </div>
                                <div class="col-md-3 column">
                                    <div class="progress"
                                         style="height:50px;border-radius:0;position: absolute;width: 75%;right:49px;">
                                        <div class="progress-bar progress-bar-default" role="progressbar"
                                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">3. 确认信息</div>
                                        </div>
                                    </div>
                                    <div style="right: 0;border:10px solid #ddd;border-left-color: #88b7d5;border-width: 25px;position: absolute;
                                             border-left-color: rgba(221, 221, 221, 1);
                                             border-top-color: rgba(221, 221, 221, 0);
                                             border-bottom-color: rgba(221, 221, 221, 0);
                                             border-right-color: rgba(221, 221, 221, 0);
                                        ">
                                    </div>
                                </div>
                                <div class="col-md-3 column">
                                    <div class="progress" style="height:50px;border-radius:0;">
                                        <div class="progress-bar progress-bar-default" role="progressbar"
                                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                                             style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">4. 完成</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="container-fluid">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <blockquote style="border-left: 5px solid #f60;color:#f60;padding: 0 0 0 20px;">
                                        <b>
                                            项目及发起人信息<br>
                                            发起人：${CURRENT_USER.userName} <br>
                                            发起人邮箱：${CURRENT_USER.userEmail}
                                        </b>
                                    </blockquote>

                                </div>
                                <div class="col-md-12 column">
                                    <div class="page-header" style="    border-bottom-style: dashed;">
                                        <h3>
                                            项目信息
                                        </h3>
                                    </div>
                                    <form class="form-horizontal"
                                          action="${pageContext.request.contextPath}/good/addGood" method="post" enctype="multipart/form-data">
                                        <input name="userId" value="${CURRENT_USER.userId}">
                                        <div class="form-group">
                                            <label for="inputEmail3" class="col-sm-2 control-label">信息类别</label>
                                            <div class="col-sm-10">
                                                <label class="radio-inline">
                                                    <input type="radio" name="goodType" id="inlineRadio1" value="0"> 科技
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="goodType" id="inlineRadio2" value="1"> 设计
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="goodType" id="inlineRadio3" value="2"> 公益
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="goodType" id="inlineRadio3" value="3"> 农业
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">项目名称</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" placeholder="项目名称"
                                                       name="goodName">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">一句话简介</label>
                                            <div class="col-sm-10">
                                                <textarea class="form-control" rows="5" placeholder="在此输入对项目的描述"
                                                          name="goodRemarks"></textarea>
                                            </div>
                                        </div>
                                        <hr></hr>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">筹资金额（元）</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" style="width:100px;"
                                                       name="goodPrice">
                                                <label class="control-label">筹资金额范围 200￥-100,000￥</label>
                                            </div>
                                        </div>
                                        <hr></hr>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">筹资天数（天）</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" style="width:100px;"
                                                       name="goodDate">
                                                <label class="control-label">一般10-90天，建议30天</label>
                                            </div>

                                        </div>
                                        <hr></hr>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">项目头图</label>
                                            <div class="col-sm-10">
                                                <input type="file" name="xmfile" class="btn btn-primary btn-lg active"/>
                                                <label class="control-label">图片上无文字,支持jpg、jpeg、png、gif格式，大小不超过2M，建议尺寸：740*457px</label>
                                            </div>
                                        </div>
                                        <hr></hr>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">项目详情</label>
                                            <div class="col-sm-10">
                                                <input type="file" name="xqfile" class="btn btn-primary btn-lg active">上传图片</input>
                                                <label class="control-label">支持jpg、jpeg、png、gif格式，大小不超过2M，建议尺寸：宽740px</label>
                                            </div>
                                        </div>

                                        <div class="col-md-12 column">
                                            <div class="page-header" style="    border-bottom-style: dashed;">
                                                <h3>
                                                    发起人信息
                                                </h3>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">自我介绍</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="一句话自我介绍，不超过40字"
                                                           name="goodDesc">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">详细自我介绍</label>
                                                <div class="col-sm-10">
                                                    <textarea class="form-control" rows="5"
                                                              placeholder="向支持者详细介绍你自己或你的团队及项目背景，让支持者在最短时间内了解你，不超过160字"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">联系电话</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="此信息不会显示在项目页面"
                                                           name="goodTel">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">客服电话</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" placeholder="此信息显示在项目页面"
                                                           name="goodLocalTel">
                                                </div>
                                            </div>
                                        </div>

                                        <input type="text" id="goodid" value="${goodId}"/>
                                        <div class="panel-footer" style="text-align:center;">
                                            <input type="submit" class="btn  btn-warning btn-lg" value="提交审核"></button>
                                            <%--<input type="button" class="btn  btn-warning btn-lg" value="下一步" >--%>
                                            <a class="btn"  id="scroll"> 请点击确认项目信息,回到顶部 </a>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>


                        <div class="container" style="margin-top:20px;">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <div id="footer">
                                        <div class="footerNav">
                                            <a rel="nofollow" href="http://www.layoutit.cn">关于我们</a> | <a rel="nofollow"
                                                                                                          href="http://www.layoutit.cn">服务条款</a>
                                            | <a rel="nofollow" href="http://www.layoutit.cn">免责声明</a> | <a
                                                rel="nofollow" href="http://www.layoutit.cn">网站地图</a> | <a
                                                rel="nofollow" href="http://www.layoutit.cn">联系我们</a>
                                        </div>
                                        <div class="copyRight">
                                            Copyright©2019-2020 layoutit.cn 版权所有
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div> <!-- /container -->
                    <script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resource/script/docs.min.js"></script>
                    <script src="${pageContext.request.contextPath}/resource/script/back-to-top.js"></script>
                    <script>
                        $('#myTab a').click(function (e) {
                            e.preventDefault()
                            $(this).tab('show')
                        })
                        /*点击回到顶部*/
                        $(function(){
                            showScroll();
                            function showScroll(){
                                $(window).scroll( function() {
                                    var scrollValue=$(window).scrollTop();
                                    scrollValue > 100 ? $('div[class=scroll]').fadeIn():$('div[class=scroll]').fadeOut();
                                } );
                                $('#scroll').click(function(){
                                    $("html,body").animate({scrollTop:0},200);
                                });
                            }
                        })
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
                </div>
</body>
</html>