<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/main.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor: pointer;
        }

        table tbody tr:nth-child(odd) {
            background: #F4F4F4;
        }

        table tbody td:nth-child(even) {
            color: #C00;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <div><a class="navbar-brand" style="font-size:32px;" href="#">众筹平台 - 广告审核</a></div>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li style="padding-top:8px;">
                    <div class="btn-group">
                        <button type="button" class="btn btn-default btn-success dropdown-toggle"
                                data-toggle="dropdown">
                            <i class="glyphicon glyphicon-user"></i>${CURRENT_USER.userName}<span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><i class="glyphicon glyphicon-cog"></i> 个人设置</a></li>
                            <li><a href="#"><i class="glyphicon glyphicon-comment"></i> 消息</a></li>
                            <li class="divider"></li>
                            <li><a onclick="exit()"><i class="glyphicon glyphicon-off"></i> 退出系统</a></li>
                        </ul>
                    </div>
                </li>
                <li style="margin-left:10px;padding-top:8px;">
                    <button type="button" class="btn btn-default btn-danger">
                        <span class="glyphicon glyphicon-question-sign"></span> 帮助
                    </button>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <input type="text" class="form-control" placeholder="Search...">
            </form>
        </div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <ul style="padding-left:0px;" class="list-group">
                    <li class="list-group-item tree-closed">
                        <a href="main.html"><i class="glyphicon glyphicon-dashboard"></i> 控制面板</a>
                    </li>
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon glyphicon-tasks"></i> 权限管理 <span class="badge"
                                                                                             style="float:right">3</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="${pageContext.request.contextPath}/user/finAll"><i class="glyphicon glyphicon-user"></i> 用户维护</a>
                            </li>
                            <li style="height:30px;">
                                <a onclick="window.location.href='${pageContext.request.contextPath}/user/findAllRole'"><i class="glyphicon glyphicon-king"></i> 角色维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="permission.html"><i class="glyphicon glyphicon-lock"></i> 许可维护</a>
                            </li>
                        </ul>
                    </li>
<<<<<<< .mine

||||||| .r518
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge"
                                                                                style="float:right">3</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_adv.jsp" style="color:red;"><i class="glyphicon glyphicon-check"></i> 广告审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a>
                            </li>
                        </ul>
                    </li>
=======
                    <li class="list-group-item">
                        <span><i class="glyphicon glyphicon-ok"></i> 业务审核 <span class="badge"
                                                                                style="float:right">3</span></span>
                        <ul style="margin-top:10px;">
                            <li style="height:30px;">
                                <a href="auth_cert.html"><i class="glyphicon glyphicon-check"></i> 实名认证审核</a>
                            </li>
                            <li style="height:30px;">
                                <a onclick="window.location.href='${pageContext.request.contextPath}/gg/selectAdv?startIndex=1&pageSize=6'"><i class="glyphicon glyphicon-check"></i> 广告审核</a>
                            </li>
                            <li style="height:30px;">
                                <a href="auth_project.html"><i class="glyphicon glyphicon-check"></i> 项目审核</a>
                            </li>
                        </ul>
                    </li>
>>>>>>> .r629
                    <li class="list-group-item tree-closed">
                        <span><i class="glyphicon glyphicon-th-large"></i> 业务管理 <span class="badge" style="float:right">7</span></span>
                        <ul style="margin-top:10px;display:none;">
                            <li style="height:30px;">
                                <a href="cert.html"><i class="glyphicon glyphicon-picture"></i> 资质维护</a>
                            </li>
                            <li style="height:30px;">
                                <a href="type.html"><i class="glyphicon glyphicon-equalizer"></i> 分类管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="process.html"><i class="glyphicon glyphicon-random"></i> 流程管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="advertisement.html"><i class="glyphicon glyphicon-hdd"></i> 广告管理</a>
                            </li>
                            <li style="height:30px;">
                                <a href="message.html"><i class="glyphicon glyphicon-comment"></i> 消息模板</a>
                            </li>
                            <li style="height:30px;">
                                <a href="project_type.html"><i class="glyphicon glyphicon-list"></i> 项目分类</a>
                            </li>
                            <li style="height:30px;">
                                <a href="tag.html"><i class="glyphicon glyphicon-tags"></i> 项目标签</a>
                            </li>
                        </ul>
                    </li>
                    <li class="list-group-item tree-closed">
                        <a href="param.html"><i class="glyphicon glyphicon-list-alt"></i> 参数管理</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table  table-bordered">
                            <thead>
                            <tr>
                                <th width="60">序号</th>
                                <th>申请人</th>
                                <th>置顶广告名称</th>
                                <th>广告状态</th>
                                <th width="100">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${advs}" var="adv" varStatus="status">
                                <tr>

                                    <td>${status.index+1}</td>
                                    <td>${adv.userName}</td>
                                    <td>${adv.goodName}</td>
                                    <td><c:if test="${adv.advStatus==0}">
                                        未显示 </c:if>
                                        <c:if test="${adv.advStatus==1}">
                                            显示 </c:if></td>
                                    <td>
                                        <button type="button" class="btn btn-success btn-xs"
                                                onclick="window.location.href = '${pageContext.request.contextPath}/gg/doUp?goodId=${adv.goodId}&startIndex=${param.startIndex}&pageSize=${param.pageSize}'">
                                            <i class="glyphicon glyphicon-ok"></i></button>
                                        <button type="button" class="btn btn-success btn-xs"
                                                onclick="window.location.href = '${pageContext.request.contextPath}/gg/doDown?goodId=${adv.goodId}&startIndex=${param.startIndex}&pageSize=${param.pageSize}'">
                                            <i class="glyphicon glyphicon-remove"></i></button>
                                    </td>

                                </tr>

                            </c:forEach>


                            </tbody>
                            <tfoot>

                            <tr>
                                <td colspan="4" align="center">
                                    <ul class="pagination">

                                        <c:if test="${param.startIndex==1}">
                                            <li class="disabled"><a onclick="nextPage(${param.startIndex-1})">上一页</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${param.startIndex!=1}">
                                            <li><a onclick="nextPage(${param.startIndex-1})">上一页</a></li>
                                        </c:if>
                                        <c:set var="pageindex" value="0"></c:set>
                                        <c:forEach end="${allPage-1}" begin="0">
                                            <c:set var="pageindex" value="${pageindex+1}"></c:set>
                                            <c:if test="${pageindex==param.startIndex}">
                                                <li id="${pageindex}" class="active"><a
                                                        onclick="nextPage(${pageindex})">${param.startIndex}<span
                                                        class="sr-only">(current)</span></a></li>
                                            </c:if>
                                            <c:if test="${pageindex!=param.startIndex}">
                                                <li id="${pageindex}" class=""><a
                                                        onclick="nextPage(${pageindex})">${pageindex}<span
                                                        class="sr-only">(current)</span></a></li>
                                            </c:if>
                                        </c:forEach>
                                        <li><a onclick="nextPage(${param.startIndex+1})">下一页</a></li>
                                    </ul>
                                </td>

                            </tr>


                            </tfoot>

                        </table>
                        每页显示 ${param.pageSize} 个
                        <hr>
                        总页码:${allPage}
                        总记录: ${pageCount}
                        <hr>
                        页面显示数:
                        <select id="pagesizelist" onchange="getNum()">
                            <option id="option1" value="4">--选择页面显示数量--</option>
                            <option>4</option>
                            <option>6</option>
                            <option>8</option>
                        </select>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resource/jquery/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resource/script/docs.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function () {
            if ($(this).find("ul")) {
                $(this).toggleClass("tree-closed");
                if ($(this).hasClass("tree-closed")) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
    });

    //分页
    function lastPage() {

    }

    var currentPage = 0;

    var pageSize = 0;

    function getNum() {
        pageSize = $("#pagesizelist").val();
        window.location.href = "${pageContext.request.contextPath}/gg/selectAdv?startIndex=1" + "&pageSize=" + pageSize;
    }

    function nextPage(currentPage) {
        pageSize =${param.pageSize};
        if (currentPage <= 0) {
            alert("没有上一页了\n 前面是无穷的宇宙");
        } else if (currentPage >=${allPage}) {
            window.location.href = "${pageContext.request.contextPath}/gg/selectAdv?startIndex=" + ${allPage} +"&pageSize=" + pageSize;
        } else {
            window.location.href = "${pageContext.request.contextPath}/gg/selectAdv?startIndex=" + currentPage + "&pageSize=" + pageSize;
        }
        // alert(currentPage);
        // alert(pageSize);
        $("#option1").attr("value", pageSize);

    }

</script>
</body>
<script type="text/javascript">
    //用户退出的JS
    function exit() {
        if (confirm("确定要退出当前用户吗？")) {
            //如果是 去跳转到退出的业务
            window.location.href = "${pageContext.request.contextPath}/user/exit";
        } else {
            //啥也不做
        }
    }

</script>
</html>
