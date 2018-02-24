<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8" />
    <%
        pageContext.setAttribute("ctx", request.getContextPath());
    %>

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- CSS Libs -->
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/checkbox3.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/jquery.dataTables.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/lib/css/select2.min.css">
    <!-- CSS App -->
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/static/other/css/themes/flat-blue.css">
</head>

<body class="flat-blue">
<div class="app-container">
    <div class="row content-container">
        <nav class="navbar navbar-default navbar-fixed-top navbar-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-expand-toggle">
                        <i class="fa fa-bars icon"></i>
                    </button>
                    <ol class="breadcrumb navbar-breadcrumb">
                        <li class="active">博客后台管理系统</li>
                    </ol>
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-th icon"></i>
                    </button>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <button type="button" class="navbar-right-expand-toggle pull-right visible-xs">
                        <i class="fa fa-times icon"></i>
                    </button>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-comments-o"></i></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li class="title">
                                Notification <span class="badge pull-right">0</span>
                            </li>
                            <li class="message">
                                No new notification
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown danger">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-star-half-o"></i> 4</a>
                        <ul class="dropdown-menu danger  animated fadeInDown">
                            <li class="title">
                                Notification <span class="badge pull-right">4</span>
                            </li>
                            <li>
                                <ul class="list-group notifications">
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge">1</span> <i class="fa fa-exclamation-circle icon"></i> new registration
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge success">1</span> <i class="fa fa-check icon"></i> new orders
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item">
                                            <span class="badge danger">2</span> <i class="fa fa-comments icon"></i> customers messages
                                        </li>
                                    </a>
                                    <a href="#">
                                        <li class="list-group-item message">
                                            view all
                                        </li>
                                    </a>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown profile">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Emily Hart <span class="caret"></span></a>
                        <ul class="dropdown-menu animated fadeInDown">
                            <li class="profile-img">
                                <img src="${ctx }/static/img/profile/picjumbo.com_HNCK4153_resize.jpg" class="profile-img">
                            </li>
                            <li>
                                <div class="profile-info">
                                    <h4 class="username">Emily Hart</h4>
                                    <p>emily_hart@email.com</p>
                                    <div class="btn-group margin-bottom-2x" role="group">
                                        <button type="button" class="btn btn-default"><i class="fa fa-user"></i> Profile</button>
                                        <button type="button" class="btn btn-default"><i class="fa fa-sign-out"></i> Logout</button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="side-menu sidebar-inverse">
            <nav class="navbar navbar-default" role="navigation">
                <div class="side-menu-container">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">
                            <div class="icon fa fa-paper-plane"></div>
                            <div class="title">博客后台</div>
                        </a>
                        <button type="button" class="navbar-expand-toggle pull-right visible-xs">
                            <i class="fa fa-times icon"></i>
                        </button>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#">
                                <span class="icon fa fa-tachometer"></span><span class="title">数据概览</span>
                            </a>
                        </li>
                        <li class="panel panel-default dropdown">
                            <a data-toggle="collapse" href="#dropdown-element">
                                <span class="icon fa fa-desktop"></span><span class="title">用户管理</span>
                            </a>
                            <!-- Dropdown level 1 -->
                            <div id="dropdown-element" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <ul class="nav navbar-nav">
                                        <li><a href="javascript:void(0);" onclick="show()">用户信息</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container-fluid">
            <div class="side-body">
            </div>
        </div>
    </div>
</div>

<!-- Javascript Libs -->
<script type="text/javascript" src="${ctx }/static/other/lib/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/Chart.min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/jquery.matchHeight-min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/select2.full.min.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/ace/ace.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/ace/mode-html.js"></script>
<script type="text/javascript" src="${ctx }/static/other/lib/js/ace/theme-github.js"></script>
<!-- Javascript -->
<script type="text/javascript" src="${ctx }/static/other/js/app.js"></script>
<script type="text/javascript" src="${ctx }/static/other/js/index.js"></script>
</body>
<script>
    function show() {
        $('.side-body').append('<%@include file="../bbm/user/userList.jsp"%>')
    }
</script>
</html>

