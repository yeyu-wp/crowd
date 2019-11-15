<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>回报设置</title>
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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/user/index" style="font-size:32px;">千锋-创意产品众筹平台</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse" style="float:right;">
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
                                <a rel="nofollow" href="${pageContext.request.contextPath}/user/index"><i class="glyphicon glyphicon-home"></i> 众筹首页</a>
                            </li>
                            <li >
                                <a rel="nofollow" href="${pageContext.request.contextPath}/user/viewname/projects.html"><i class="glyphicon glyphicon-th-large"></i> 项目总览</a>
                            </li>
                            <li class="active">
                                <a rel="nofollow" href="javascript:;"><i class="glyphicon glyphicon-edit"></i> 发起项目</a>
                            </li>
                            <li>
                                <a rel="nofollow" href="${pageContext.request.contextPath}/user/mycrowd"><i class="glyphicon glyphicon-user"></i> 我的众筹</a>
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
                <div class="panel panel-default" >
                    <div class="panel-heading" style="text-align:center;">
                        <div class="container-fluid">
                            <div class="row clearfix">
                                <div class="col-md-3 column">
                                    <div class="progress" style="height:50px;border-radius:0;    position: absolute;width: 75%;right:49px;">
                                        <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">1. 项目及发起人信息</div>
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
                                    <div class="progress" style="height:50px;border-radius:0;position: absolute;width: 75%;right:49px;">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
                                            <div style="font-size:16px;margin-top:15px;">2. 回报设置</div>
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
                                    <div class="progress" style="height:50px;border-radius:0;position: absolute;width: 75%;right:49px;">
                                        <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
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
                                        <div class="progress-bar progress-bar-default" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height:50px;">
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
                                            回报设置
                                        </b>
                                    </blockquote>
                                </div>
                                <div class="col-md-12 column">

                                    <table class="table table-bordered" style="text-align:center;">

                                        <thead>
                                        <tr style="background-color:#ddd;">
                                            <td style="width: 52px;">序号</td>
                                            <td style="width: 82px;">支付金额</td>
                                            <td style="width: 52px;">名额</td>
                                            <td style="width: 85px;">单笔限购</td>
                                            <td>回报内容</td>
                                            <td style="width: 160px;">回报时间</td>
                                            <td style="width: 65px;">运费</td>
                                            <td style="width: 90px;">操作</td>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${allReward}"  var="reward" varStatus="status">
                                        <tbody>
                                        <!-- 隔行变色 -->
                                        <c:if test="${status.index%2==0}">
                                            <tr class="even" style="background-color: lightcyan">
                                        </c:if>
                                        <c:if test="${status.index%2!=0}">
                                            <tr class="even">
                                        </c:if>
                                      <%-- <tr>--%>
                                           <td>${status.index+1}</td>
                                            <%--<td  scope="row">${reward.id}</td>--%>
                                            <td id="rewardMoney">${reward.money}</td>
                                            <td id="rewardNum">${reward.num}</td>
                                            <td id="limitPay">
                                                <c:if test="${reward.limitnumber eq '0'}">不限购</c:if>
                                                <c:if test="${reward.limitnumber eq reward.limitnumber && reward.limitnumber!='0'}">${reward.limitnumber}</c:if>
                                            </td>
                                            <%--<td>${reward.limits}</td>--%>
                                            <td>${reward.descs}</td>
                                            <td>项目结束后的${reward.rewardTime}天</td>
                                            <td>${reward.cost}</td>
                                            <td><%--onclick="window.location.href='${pageContext.request.contextPath}/user/reward/findRewardById/${reward.id}'"--%>
                                                <button type="button" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#myModal"
                                                        onclick="window.location.href='${pageContext.request.contextPath}/user/reward/findRewardById?id=${reward.id}&goodid=${goodid}&goodPrice=${goodPrice}'">
                                                    <i class=" glyphicon glyphicon-pencil"></i></button>
                                                <button type="button" class="btn btn-danger btn-xs" onclick="deletes(${reward.id})"><i class=" glyphicon glyphicon-remove"></i></button>
                                            </td>

                                        </tr>

                                        </tbody>
                                        </c:forEach>
                                    </table>

                                    <button type="button" class="btn btn-primary btn-lg" onclick="$('.huibao').show();"><i class="glyphicon glyphicon-plus"></i> 添加回报</button>
                                    <div class="huibao" style="display:none;border:10px solid #f60;border-bottom-color: #eceeef;border-width: 10px;width:20px;margin-left:20px;
                                             border-left-color: rgba(221, 221, 221, 0);
                                             border-top-color: rgba(221, 221, 221, 0);
                                             border-right-color: rgba(221, 221, 221, 0);
                                    "></div>

                                    <div class="huibao panel panel-default" style="display:none; border-style: dashed;background-color:#eceeef">
                                        <div class="panel-body">

                                            <div class="col-md-12 column">
                                                <%--<form class="form-horizontal" action="${pageContext.request.contextPath}/user/reward/addReward/${goodPrice}" method="post">--%>
                                                <form class="form-horizontal" action="${pageContext.request.contextPath}/user/reward/addReward?goodPrice=${goodPrice}" method="post">
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label">回报类型</label>
                                                        <div class="col-sm-10">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="type" id="inlineRadio1" value="1" checked="checked"> 实物回报
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="type" id="inlineRadio2" value="2"> 虚拟物品回报
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <input id="goodid" type="text" value="${goodid}" name="goodId"/>
                                                    <input id="goodPrice" type="text" value="${goodPrice}" name="goodId"/>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">支持金额（元）</label>
                                                        <%--<div class="col-sm-10">
                                                            <input id="supportMoney" type="text" name="money" class="form-control" style="width:100px;" value="1" placeholder="1">
                                                        </div>--%>
                                                        <%--下拉框形式--%>
                                                         <ul style="list-style:none;padding-left:0;">
                                                            <li style="margin:10px 0">
                                                                <%--<select id="selectMoney" name="money">--%>
                                                                <select id="supportMoney" name="money" style="margin-left: 18px;height: 35px;width: 65px;border-color: lightgray;border-radius: 3px">
                                                                    <option value="1">1元</option>
                                                                    <option value="5">5元</option>
                                                                    <option value="10">10元</option>
                                                                    <option value="20">20元</option>
                                                                    <option value="50">50元</option>
                                                                    <option value="100">100元</option>
                                                                </select>
                                                            </li>
                                                        </ul>
                                                        <%--复选框形式--%>
                                                        <%--<input type="checkbox" name="money" value="1"/>1元
                                                        <input type="checkbox" name="money" value="2"/>9.99元
                                                        <input type="checkbox" name="money" value="3"/>19.99元
                                                        <input type="checkbox" name="money" value="4"/>49.99元
                                                        <input type="checkbox" name="money" value="5"/>99.99元
                                                        <input type="checkbox" name="money" value="6"/>199.98元--%>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">回报内容</label>
                                                        <div class="col-sm-10">
                                                            <textarea name="descs" class="form-control" rows="5" placeholder="简单描述回报内容，不超过200字"></textarea>
                                                        </div>
                                                    </div>
                                                    <%--<div class="form-group">
                                                        <label class="col-sm-2 control-label">说明图片</label>
                                                        <div class="col-sm-10">
                                                            <button type="button" class="btn btn-primary btn-lg active">上传图片</button>
                                                            <label class="control-label">支持jpg、jpeg、png、gif格式，大小不超过2M，建议尺寸：760*510px选择文件</label>
                                                        </div>
                                                    </div>--%>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">回报数量（名）</label>
                                                        <div class="col-sm-10">
                                                            <input id="huibaoNum" name="num" type="text" class="form-control" style="width:100px;display:inline" value="1">
                                                            <label id="xianshi" class="control-label" style="color: red">必须填写回报数量，默认为1</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label">单笔限购</label>
                                                        <div class="col-sm-10" id="radiobig">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="limits" id="radio1" value="0"/> 不限购
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="limits" id="radio2" value="1" checked="checked"/> 限购
                                                            </label>
                                                            <div>
                                                                <input id="radiobox" name="limitnumber" type="text" class="form-control" style="width:130px;" placeholder="请输入限购数量" value="1"/>
                                                                <label id="tishi" style="color: red"></label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">运费(元)</label>
                                                        <div class="col-sm-10">
                                                            <input name="cost" type="text" class="form-control" style="width:100px;display:inline" value="0" >
                                                            <label class="control-label" style="color: red">“0”为包邮</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label">发票</label>
                                                        <div class="col-sm-10">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="bill" id="inlineRadio1" value="1" checked="checked"> 不可开发票
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="bill" id="inlineRadio2" value="2"> 可开发票（包括个人发票和自定义抬头发票）
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label">回报时间</label>
                                                        <div class="col-sm-10">
                                                            <label class="radio-inline">
                                                                项目结束后
                                                            </label>
                                                            <input name="rewardTime" type="text" class="form-control" style="width:100px;display:inline" value="1">
                                                            <label class="radio-inline">天，向支持者发送回报</label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEmail3" class="col-sm-2 control-label"></label>
                                                        <div class="col-sm-10">
                                                            <%--<button type="button" class="btn btn-primary" onclick="step3()">确定</button>--%>
                                                            <c:if test="${goodPrice==0}">
                                                                <button onclick="nosave()" type="button" class="btn btn-primary" value="确定">确定</button>
                                                            </c:if>
                                                            <c:if test="${goodPrice!=0}">
                                                                <input type="submit" class="btn btn-primary" value="确定"/>
                                                            </c:if>
                                                            <button type="button" class="btn btn-default">取消</button>
                                                        </div>
                                                    </div>

                                                </form>
                                            </div>


                                        </div>
                                    </div>

                                </div>
                                <div class="container" >
                                    <div class="row clearfix">
                                        <div class="col-md-12 column" style="margin-top:10px;">
                                            <blockquote>
                                                <p >
                                                    <i class="glyphicon glyphicon-info-sign" style="color:#2a6496;"></i> 提示
                                                </p> <small>3个以上的回报：多些选择能提高项目的支持率。几十、几百、上千元的支持：3个不同档次的回报，能让你的项目更快成功。回报最好是项目的衍生品：<br>与项目内容有关的回报更能吸引到大家的支持。</small>
                                            </blockquote>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="panel-footer" style="text-align:center;">
                        <button type="button" class="btn  btn-default btn-lg" onclick="pre()">上一步</button>
                        <button type="button" class="btn  btn-warning btn-lg" onclick="step3()">下一步</button>
                        <%--<input type="submit" class="btn  btn-warning btn-lg" value="下一步"/>--%>
                        <a class="btn"  id="scroll"> 查看已设置的回报 </a>
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
                        <a rel="nofollow" href="http://www.layoutit.cn">关于我们</a> | <a rel="nofollow" href="http://www.layoutit.cn">服务条款</a> | <a rel="nofollow" href="http://www.layoutit.cn">免责声明</a> | <a rel="nofollow" href="http://www.layoutit.cn">网站地图</a> | <a rel="nofollow" href="http://www.layoutit.cn">联系我们</a>
                    </div>
                    <div class="copyRight">
                        Copyright ?2017-2017layoutit.cn 版权所有
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
    function deletes(id) {

        alert("确定要删除此回报信息吗"+id);

        var goodid=document.getElementById("goodid").value;
        var goodPrice=document.getElementById("goodPrice").value;
        console.log("goodid"+goodid);
        console.log("goodPrice"+goodPrice);
        window.location.href="${pageContext.request.contextPath}/user/reward/deleteReward?id="+id+"&goodid="+goodid+"&goodPrice="+goodPrice;
    }
    //上一步
    function pre() {
        alert("返回上一步将需要重新填写项目信息，是否继续？");
        /*window.location.href="${pageContext.request.contextPath}/user/viewname/start-step-1";*/
        window.location.href="${pageContext.request.contextPath}/user/reward/step1";
    }
    //到下一步（确认信息）
    function step3(){
        alert("'是否进行下一步？项目id为'+${goodid}+'--目标金额为：'+${goodPrice}");
        window.location.href="${pageContext.request.contextPath}/user/reward/step3?goodid=${goodid}&goodPrice=${goodPrice}";
    }
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
    //限购或不限购
    $("#radiobig").click(function () {
        if (document.getElementById("radio2").checked){
            console.log("限购被选中了，可以填写")
            $("#radiobox").prop("disabled",false);
            document.getElementById('radiobox').style.display="";
            $("#tishi").text("*限购数量不超过上方已设置的回报数量.默认为1");
        }
        if (document.getElementById("radio1").checked){
            console.log("限购没有选中，不能填写")
            /*$("#radiobox").prop("disabled",true);*/
            document.getElementById('radiobox').style.display="none";
            $("#radiobox").val(0);
        }
    });
    //回报数量
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
            $("#xianshi").text("（当前回报数量×支持金额不得大于："+goodPrice+"）默认为1");
            $("#huibaoNum").val(1);
        }else {
            $("#xianshi").text("必须填写回报数量，默认为1");
        }
    });
    //判断限购数量不得超过回报数量
    $("#radiobox").change(function () {
        var huibaoNum=document.getElementById("huibaoNum").value;
        console.log("回报数量："+huibaoNum);
        var radiobox=document.getElementById("radiobox").value;
        console.log("限购数量："+radiobox);
        if (radiobox>huibaoNum){
            $("#tishi").text("*限购数量不超过上方已设置的回报数量.默认为1");
            $("#radiobox").val(1);
        }
    })
    //判断目标金额是否为0，为0则不能添加回报
    function nosave() {
        alert("不可以添加啦！");
    }
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
