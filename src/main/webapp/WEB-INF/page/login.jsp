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
    <style type="text/css">
        /*#user_input_verifyCode{*/
        /*    width: 200px;*/
        /*}*/
        .mouse{
            cursor: pointer;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <div><a class="navbar-brand" href="${pageContext.request.contextPath}/user/index" style="font-size:32px;">千锋-创意产品众筹平台</a></div>
        </div>
    </div>
</nav>

<div class="container">

    <form action="${pageContext.request.contextPath}/user/login" class="form-signin" role="form" method="post">
        <h2 class="form-signin-heading"><i class="glyphicon glyphicon-user"></i> 用户登录</h2>
        <div class="form-group has-success has-feedback">
            <input type="text" name="userName" class="form-control" id="inputSuccess4" placeholder="请输入登录账号" autofocus>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-success has-feedback">
            <input type="password" name="password" class="form-control" id="inputSuccess5" placeholder="请输入登录密码"
                   style="margin-top:10px;">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>

        <div>

            <input type="text" id="user_input_verifyCode" class="form-control"
                   name="user_input_verifyCode" placeholder="验证码" maxlength="4">

            <span class="code_img"  id="yzm"> <img  ONCLICK="changeImage()" class="mouse"
                    src="${pageContext.request.contextPath }/user/getVerifyCode"
                    width="110" height="40" id="verifyCodeImage">
					</span> <span> <a id="changeVerifImageRegister"
                                      class="mouse" ONCLICK="changeImage()"  >换一张</a>
					</span>

        </div>


        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me"> 记住我
            </label>
            <br>
            <label>
                忘记密码
            </label>
            <label>
               <font color="#b22222"> ${msg} </font>
            </label>

            <label style="float:right">
                <a href="${pageContext.request.contextPath}/user/viewname/reg">我要注册</a>
            </label>
        </div>
        <input class="btn btn-lg btn-success btn-block" type="submit" value="登录">
    </form>
</div>
<script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script>

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }
    function changeImage() {
        $('#verifyCodeImage').attr('src',
            '${pageContext.request.contextPath }/user/getVerifyCode?timestamp=' + genTimestamp());
    }
    // 登录，目前只检测验证码
    function login(){
        var user_input_verifyCode=$("#user_input_verifyCode").val();
        $.ajax({
            type : 'post',
            url : "${pageContext.request.contextPath}/user/login",
            data:{verifyCode:user_input_verifyCode},
            //dataType : "json",
            success : function(data) {
                alert("验证码正确");
            },
            error : function() {
                alert("验证码错误");
            }
        });
    }





    function dologin() {
        var type = $(":selected").val();
        var name=$("#inputSuccess4").val();
        var password=$("#inputSuccess5").val();
        console.log(name);
        console.log(password);

  var user={userName:name,password:password};
        if (type == "user") {
            window.location.href = "${pageContext.request.contextPath}/user/login?user="+user;
        } else {
            window.location.href = "${pageContext.request.contextPath}/user/login";
        }
    }


</script>
</body>
</html>