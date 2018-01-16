<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户信息详情页面</title>
    <%
        pageContext.setAttribute("ctx", request.getContextPath());
    %>
    <link rel="stylesheet" href="${ctx }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <script type="text/javascript" src="${ctx }/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctx }/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body class="no-skin ">
<div class="main-container" id="main-container">
    <div class="main-content ">
        <div class="main-content-inner ">
            <div class="page-content ">
                <div class="row">
                    <div class=" widget-container-col ui-sortable  ">
                        <div class="widget-box widget-color-normal3" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i>查看用户详情
                                </h5>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal">
                                            <div class="col-xs-12">
                                                <div class="tabbable">
                                                    <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                        <li class="active"><a href="#home4" data-toggle="tab" aria-expanded="true">信息详情</a></li>
                                                    </ul>
                                                    <div class="tab-content ">
                                                        <div class="tab-pane active no-padding" id="home4">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账号:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">${user.account}</label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">昵称:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">${user.nickName}</label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">性别:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">
                                                                            <c:if test="${user.gender==0}">男</c:if>
                                                                            <c:if test="${user.gender==1}">女</c:if>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮箱:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">${user.mail}</label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">权限:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">
                                                                            <c:if test="${user.authority==0}">管理员</c:if>
                                                                            <c:if test="${user.authority==1}">普通用户</c:if>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">创建时间:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">
                                                                            <fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">更新时间:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">${user.updateTime}</label>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">最近登录时间:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <label class="form-control label-small width-200px view-control"
                                                                               data-placement="bottom" data-trigger="hover"
                                                                               data-rel="popover">${user.lastLoginTime}</label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div style="text-align: center;">
                                                    <button class="btn btn-info btn-sm" type="button"
                                                            onclick="javascript:parent.$.fancybox.close();">
															<span
                                                                    class="ace-icon fa fa-close icon-on-right bigger-110"></span>
                                                        关闭
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>