<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
  <head>
    <meta charset="GB18030">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/login.css">
	<style>

	</style>
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">千锋-创意产品众筹平台</a></div>
        </div>
      </div>
    </nav>

    <div class="container">

      <form class="form-signin" role="form"  action="${pageContext.request.contextPath}/user/register" method="post">


        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-log-in"></i> 用户注册</h2>
          <label>
              <font color="#b22222"> ${msg} </font>
          </label>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" onblur="check()" id="userName" name="userName" placeholder="请输入登录账号" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" onblur="check1()" id="password" name="password" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="inputSuccess4"  name="userEmail" placeholder="请输入邮箱地址" style="margin-top:10px;">
			<span class="glyphicon glyphicon glyphicon-envelope form-control-feedback"></span>
		  </div>
<%--		  <div class="form-group has-success has-feedback">--%>
<%--			<select class="form-control" id="userType" name="userType">--%>
<%--               <option value="" selected="selected" disabled="disabled">请选择用户类型</option>--%>
<%--                    <option value="1">会员</option><option  disabled="disabled" value="0">管理员</option>--%>
<%--            </select>--%>
<%--		  </div>--%>
        <div class="checkbox">

          <label style="float:right">
            <a href="${pageContext.request.contextPath}/user/viewname/login">我有账号</a>
          </label>
        </div>
        <input type="submit"  class="btn btn-lg btn-success btn-block" value="注册">
      </form>
    </div>
    <script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
  </body>
<script type="text/javascript">
    function check(){
        var userName = document.getElementById('userName').value;
        if(!userName){
            alert("账号不能为空");
            return false;
        }
            else{
            return true;
        }
    }
    function check1(){
        var password = document.getElementById('password').value;
        if(!password){
            alert("密码不能为空");
            return false;
        }
        else{
            return true;
        }
    }
</script>
</html>