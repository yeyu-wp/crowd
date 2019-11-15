<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            padding : 5px;
            border: 1px #f60 solid;
        }
        #typeList  :not(:first-child) {
            margin-top:20px;
        }
        .label-txt {
            margin:10px 10px;
            border:1px solid #ddd;
            padding : 4px;
            font-size:14px;
        }
        .panel {
            border-radius:0;
        }

        .progress-bar-default {
            background-color: #ddd;
        }

        .money{
            width: 80px;
            text-align: center;
            border-color: gray;
            border: 3px;
        }
        #selectMoney{
            width: 80px;
            height: 30px;
            border-color: lightgray;
            border-radius: 4px;
            margin-left: 15px;
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

    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <%--<li>
                                <a rel="nofollow" href="index.html"><i class="glyphicon glyphicon-home"></i> 众筹首页</a>
                            </li>
                            <li >
                                <a rel="nofollow" href="projects.html"><i class="glyphicon glyphicon-th-large"></i> 项目总览</a>
                            </li>--%>
                            <li class="active">
                                <a rel="nofollow" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 项目回报修改</a>
                            </li>
                            <%--<li>
                                <a rel="nofollow" href="minecrowdfunding.html"><i class="glyphicon glyphicon-user"></i> 我的众筹</a>
                            </li>--%>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>

<div class="container-fluid">
    <div class="row clearfix">
        <div id="navList" class="">
            <form class="form-horizontal" action="${pageContext.request.contextPath}/user/reward/updateRewardById?id=${reward.id}&goodid=${goodid}&goodPrice=${goodPrice}" method="post">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">回报类型</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="types"  id="inlineRadio1" value="1"<c:if test="${reward.types eq '1'}">checked="checked"</c:if>/> 实物回报
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="types"   id="inlineRadio2" value="2"<c:if test="${reward.types eq '2'}">checked="checked"</c:if>/> 虚拟物品回报
                        </label>
                    </div>
                </div>
                <input id="goodid" type="text" value="${goodid}" name="goodId"/>
                <input id="goodPrice" type="text" value="${goodPrice}" name="goodId"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label">支持金额（元）
                        <%--<input id="searchMoney" value="${reward.money}" type="hidden" />--%>
                    </label>
                    <div class="col-sm-10">
                        <input id="zfmoney" type="text" name="money" value="${reward.money}" class="form-control" style="width:100px;">
                        <label style="color: red" class="control-label"> 一旦设置不可修改</label>
                    </div>
                    <%--<ul style="list-style:none;padding-left:0;">
                        <li style="margin:10px 0">
                            &lt;%&ndash;<select id="selectMoney" name="money">&ndash;%&gt;
                            <select id="supportMoney" name="money" disabled="disabled">
                                <option value="1">1元</option>
                                <option value="5">5元</option>
                                <option value="10">10元</option>
                                <option value="20">20元</option>
                                <option value="50">50元</option>
                                <option value="100">100元</option>
                            </select>
                        </li>
                    </ul>--%>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">回报内容</label>
                    <div class="col-sm-10">
                        <textarea name="descs" class="form-control" rows="5" placeholder="简单描述回报信息，不超过200字" >${reward.descs}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">回报数量（名）</label>
                    <div class="col-sm-10">
                        <input id="huibaoNum" name="num" type="text" class="form-control" style="width:100px;display:inline" value="${reward.num}">
                        <label style="color: red" class="control-label">一旦设置不可修改</label>
                        <label id="xianshi" class="control-label" style="color: red"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">单笔限购</label>
                    <div class="col-sm-10" id="radiobig">
                        <label class="radio-inline">
                            <input type="radio" name="limits" id="radio1" value="0" <c:if test="${reward.limits eq '0'}">checked="checked"</c:if> /> 不限购
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="limits" id="radio2" value="1" <c:if test="${reward.limits eq '1'}">checked="checked"</c:if> /> 限购
                        </label>
                        <div>
                            <input id="radiobox" name="limitnumber" class="form-control" style="width:130px;" placeholder="请输入限购数量" type="text" value="${reward.limitnumber}"/>
                            <label id="tishi" style="color: red"></label>
                        </div>
                    </div>
                </div>
               <%-- <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">单笔限购</label>
                    <div class="col-sm-10" id="radiobig">
                        <label class="radio-inline">
                            <input type="radio" name="limits" id="radio1" value="1"/> 不限购
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="limits" id="radio2" value="2" checked="checked"/> 限购
                        </label>
                        <div>
                            <input id="radiobox" name="limitnumber" type="text" class="form-control" style="width:130px;" placeholder="请输入限购数量"/>
                            <label id="tishi" style="color: red"></label>
                        </div>
                    </div>
                </div>--%>
                <div class="form-group">
                    <label class="col-sm-2 control-label">运费(元)</label>
                    <div class="col-sm-10">
                        <input name="cost" type="text" class="form-control" style="width:100px;display:inline" value="${reward.cost}" >
                        <label class="control-label" style="color: red">“0”为包邮</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">发票</label>
                    <div class="col-sm-10" id="radiobig">
                        <label class="radio-inline">
                            <input type="radio" name="bill" id="radio1" value="1" <c:if test="${reward.bill eq '1'}">checked="checked"</c:if>/> 不可开发票
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="bill" id="radio2" value="2" <c:if test="${reward.bill eq '2'}">checked="checked"</c:if>> 可开发票（包括个人发票和自定义抬头发票）
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">回报时间</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            项目结束后
                        </label>
                        <input name="rewardTime" type="text" class="form-control" style="width:100px;display:inline" value="${reward.rewardTime}">
                        <label class="radio-inline">天，向支持者发送回报</label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <%--<button type="button" class="btn btn-primary" onclick="step3()">确定</button>--%>
                        <input onclick="xiugai()" type="submit" class="btn btn-primary" value="确定"/>
                        <button type="button" class="btn btn-default">取消</button>
                    </div>
                </div>

            </form>
        </div>
    </div>
</div>
</div>
<%--<div class="panel-footer" style="text-align:center;">
    <button type="button" class="btn  btn-warning btn-lg" onclick="pre()">上一步</button>
</div>--%>
<script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/docs.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/back-to-top.js"></script>
<script>
    $(document).ready(function(){
        $("#selectMoney").val($("#searchMoney").val());
    });
  /*  //限购或不限购
    $("#radiobig").change(function () {
        if (document.getElementById("radio2").checked){
            console.log("限购被选中了，可以填写")
            $("#radiobox").prop("disabled",false);
        }
        if (document.getElementById("radio1").checked){
            console.log("限购没有选中，不能填写")
            $("#radiobox").prop("disabled",true);
        }
    })*/
   /* //上一步
    function pre() {
        alert("是否确认返回回报设置？");
        window.location.href="${pageContext.request.contextPath}/user/reward/findAll";
    }*/

    //限购或不限购
    $("#radiobig").click(function () {
        if (document.getElementById("radio2").checked){
            console.log("限购被选中了，可以填写")
            $("#radiobox").prop("disabled",false);
            document.getElementById('radiobox').style.display="";
        }
        if (document.getElementById("radio1").checked){
            console.log("限购没有选中，不能填写")
            /*$("#radiobox").prop("disabled",true);*/
            document.getElementById('radiobox').style.display="none";
        }
    });
    $("#radiobox").change(function () {
        var huibaoNum=document.getElementById("huibaoNum").value;
        console.log("回报数量："+huibaoNum);
        var radiobox=document.getElementById("radiobox").value;
        console.log("限购数量："+radiobox);
        if (radiobox>huibaoNum){
            $("#tishi").text("*限购数量不超过上方已设置的回报数量，默认为1");
            $("#radiobox").val(1);
        }
    })
    $("#huibaoNum").change(function () {
        console.log("点击了回报数量")
        var goodPrice=document.getElementById("goodPrice").value;
        var supportMoney=document.getElementById("supportMoney").value;
        var huibaoNum=document.getElementById("huibaoNum").value;
        console.log("支持金额："+supportMoney);
        console.log("回报数量："+huibaoNum);
        console.log("目标金额："+goodPrice);
        var zong=supportMoney*huibaoNum;
        console.log("回报数量×支持金额："+zong);
        if (zong>goodPrice){
            $("#xianshi").text("（当前回报数量×支持金额不得大于："+goodPrice+"）");
            $("#huibaoNum").val(${reward.num});
        }else {
            $("#xianshi").text("必须填写回报数量");
            if (huibaoNum==0) {
                $("#huibaoNum").val(${reward.num});
            }
        }



    });

        //用户退出的JS
        function exit() {
            if (confirm("确定要退出当前用户吗？")){
                //如果是 去跳转到退出的业务
                window.location.href="${pageContext.request.contextPath}/user/exit";
            }else {
                //啥也不做
            }
        }
   function xiugai() {
        var huibaoNum = document.getElementById("huibaoNum").value;
        console.log("huibaoNum--"+huibaoNum);
        var zfmoney=document.getElementById("zfmoney").value;
        console.log("zfmoney==="+zfmoney);
        $("#huibaoNum").val(${reward.num});
        $("#zfmoney").val(${reward.money});
    }
</script>
</body>
</html>
