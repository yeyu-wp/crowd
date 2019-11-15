<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="GB18030">
  <head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/1231bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/theme.css">
	<style>
#footer {
    padding: 15px 0;
    background: #fff;
    border-top: 1px solid #ddd;
    text-align: center;
}
.seltype {
    position: absolute;
    margin-top: 70px;
    margin-left: 10px;
    color: red;
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
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-user"></i>${CURRENT_USER.userName}<span class="caret"></span></a>
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
        <h1>实名认证 - 账户类型选择</h1>
        <h5 style="color: #4f9fcf">${CURRENT_USER.userName}，您还为进行实名认证，请选择下面的一项来进行认证</h5>
      </div>
	  <div style="padding-top:10px;">
		<div class="row">
      <div class="col-xs-6 col-md-3">
      
      <h2>商业公司</h2>
        <a href="#" class="thumbnail">
          
          <img alt="100%x180" src="${pageContext.request.contextPath}/resource/img/services-box1.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
        </a>
      </div>
      <div class="col-xs-6 col-md-3">
        <h2>个体工商户</h2>
        <a href="#" class="thumbnail">
          <img alt="100%x180" src="${pageContext.request.contextPath}/resource/img/services-box2.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
        </a>
      </div>
      <div class="col-xs-6 col-md-3">
        <h2>个人经营</h2>
        <a href="#" class="thumbnail">
          <img alt="100%x180" src="${pageContext.request.contextPath}/resource/img/services-box3.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
        </a>
      </div>
      <div class="col-xs-6 col-md-3">
        <h2>政府及非营利组织</h2>
        <a href="#" class="thumbnail">
          <img alt="100%x180" src="${pageContext.request.contextPath}/resource/img/services-box4.jpg" data-holder-rendered="true" style="height: 180px; width: 100%; display: block;">
        </a>
      </div>
    </div>
	<button type="button" class="btn btn-danger btn-lg btn-block" onclick="window.location.href='${pageContext.request.contextPath}/user/viewname/apply'">认证申请</button>
    </div> <!-- /container -->
      <!-- /END THE FEATURETTES -->


        <div class="container" style="margin-top:20px;">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div id="footer">
                        <div class="footerNav">
                             <a rel="nofollow" href="http://www.qf.com">关于我们</a> | <a rel="nofollow" href="http://www.qf.com">服务条款</a> | <a rel="nofollow" href="http://www.qf.com">免责声明</a> | <a rel="nofollow" href="http://www.qf.com">网站地图</a> | <a rel="nofollow" href="http://www.qf.com">联系我们</a>
                        </div>
                        <div class="copyRight">
                            Copyright ?2017-2017qf.com 版权所有
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resource/script/docs.min.js"></script>
	<script>
    $(".thumbnail").click(function(){
        $('.seltype').remove();
        $(this).prepend('<div class="glyphicon glyphicon-ok seltype"></div>');
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