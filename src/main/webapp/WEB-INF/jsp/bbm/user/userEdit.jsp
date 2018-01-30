<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@include file="../../layout/common.jsp"%>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>在线业务管理平台</title>
    <%
        pageContext.setAttribute("ctx", request.getContextPath());
    %>
    <link rel="stylesheet" href="${ctx }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <script type="text/javascript" src="${ctx }/static/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx }/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctx }/static/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="${ctx }/static/js/formValidation.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/fancy/jquery.fancybox.js?"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/fancy/jquery.fancybox.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/fancy/helpers/jquery.fancybox-buttons.css?">
    <script type="text/javascript" src="${ctx}/static/js/fancy/helpers/jquery.fancybox-buttons.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/js/fancy/helpers/jquery.fancybox-thumbs.css?">
    <script type="text/javascript" src="${ctx}/static/js/fancy/helpers/jquery.fancybox-thumbs.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/fancy/helpers/jquery.fancybox-media.js"></script>

</head>
<body class="no-skin ">
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-content ">
        <div class="main-content-inner ">
            <div class="page-content ">
                <div class="row">
                    <div class=" widget-container-col ui-sortable  ">
                        <div class="widget-box widget-color-normal3" style="opacity: 1;">

                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 编辑
                                </h5>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal" >
                                            <input type="hidden" name="uuid" value="${user.uuid}"/>
                                            <div class="col-xs-12">
                                                <div class="tabbable">
                                                    <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                        <li class="active"><a href="#home4" data-toggle="tab" aria-expanded="true">编辑内容</a></li>
                                                    </ul>
                                                    <div class="tab-content ">
                                                        <div class="tab-pane active no-padding" id="home4">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账号:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <input class="form-control input-small width-200px view-control" name="account"
                                                                               value="${user.account}" data-placement="bottom" data-trigger="hover" data-rel="popover" maxlength="15" onkeyup="value=value.replace(/[^\w\/]/ig,'')">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">昵称:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <input class="form-control input-small width-200px view-control" name="nickName"
                                                                               value="${user.nickName}" data-placement="bottom" data-trigger="hover" data-rel="popover" maxlength="120">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">性别:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <input type="radio" value="0" name="gender" checked="checked" />
                                                                            <span class="lbl">&nbsp;男</span>
                                                                        <input type="radio" value="1" <c:if test="${user.gender=='1'}">checked="checked" </c:if> name="gender" />
                                                                            <span class="lbl">&nbsp;女</span>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮箱:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <input class="form-control input-small width-200px view-control" name="mail"
                                                                               value="${user.mail}" data-placement="bottom" data-trigger="hover" data-rel="popover" maxlength="15" onkeyup="value=value.replace(/[^\w\/]/ig,'')">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">角色:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <select data-placeholder="请选择" name="authority" class="form-control width-200px">
                                                                            <option value="1"
                                                                                    <c:if test="${user.authority=='0'}">selected</c:if>>管理员</option>
                                                                            <option value="2"
                                                                                    <c:if test="${user.authority=='1'}">selected</c:if>>普通用户</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div style="text-align: center;">
                                                    <button class="btn btn-info btn-sm btn-update" type="submit">
                                                        <span class="ace-icon fa fa-close icon-on-right bigger-110"></span>
                                                        修改
                                                    </button>
                                                    <button id="close" class="btn btn-info btn-sm" type="button" onclick="javascript:parent.$.fancybox.close();">
                                                        <span class="ace-icon fa fa-close icon-on-right bigger-110"></span>
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
    <!-- /.main-content -->
</div>
<!-- /.main-container -->
<%--<%@include file="../../layout/common.js.jsp"%>--%>
<script type="text/javascript">
    $("#btn-update").click(function(){
        alert("123");

        console.info("result:",$("form").serialize());

        /*$.ajax({
            url : "${ctx}/bbm/user/update/",
            type : "POST",
            data : $("form").serialize()+"&_method=PUT",
            success : function(result){

            }
        });*/
    });
</script>
</body>
</html>