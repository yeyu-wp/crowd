<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    </style>
</head>
<body>
<div class="navbar-wrapper">
    <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.html" style="font-size:32px;">千锋-创意产品众筹平台</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float:right;">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                                    class="glyphicon glyphicon-user"></i>${CURRENT_USER.userName}<span
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
    <div class="page-header">
        <h1>实名认证 - 申请</h1>
    </div>

    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation"><a href="apply"><span class="badge">1</span> 基本信息</a></li>
        <li role="presentation" class="active"><a href="apply-1"><span class="badge">2</span> 资质文件上传</a></li>
        <li role="presentation"><a href="apply-2"><span class="badge">3</span> 邮箱确认</a></li>
        <li role="presentation"><a href="apply-3"><span class="badge">4</span> 申请确认</a></li>
    </ul>

    <form  action="${pageContext.request.contextPath}/user/doAccttype" role="form" enctype="multipart/form-data" method="post" style="margin-top:20px;">
        <div class="form-group">
            <input type="text" name="userId" value="${CURRENT_USER.userId}">
            <input type="text" name="personName" value="${param.personName}">
            <input type="text" name="personIdCard" value="${param.personIdCard}">
            <input type="text" name="personTel" value="${param.personTel}">
            <BR>
            <label for="exampleInputEmail1">手执身份证照片</label>
            <input type="file" name="img1" class="form-control">
            <br>
            <img src="${pageContext.request.contextPath}/resource/img/pic.jpg">
        </div>
        <button type="button"
                onclick="window.location.href='apply?personName=${param.personName}&personIdCard=${param.personIdCard}&personTel=${param.personTel}'"
                class="btn btn-default">上一步
        </button>
        <input type="submit"  class="btn btn-success" value="下一步">

    </form>
    <hr>
</div> <!-- /container -->
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
                    Copyright ?2017-2017 qf.com 版权所有
                </div>
            </div>

        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/docs.min.js"></script>
<script>
    $('#myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    });
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

</script>
</html>