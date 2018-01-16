<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
<body>
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
                                    <i class="ace-icon fa fa-table"></i> 添加内容
                                </h5>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form id="form" class="form-inline form-horizontal">
                                            <div class="col-xs-12">
                                                <div class="tabbable">
                                                    <ul id="myTab4" class="nav nav-tabs padding-12 tab-color-blue background-blue">
                                                        <li class="active"><a href="#home4" data-toggle="tab" aria-expanded="true">内容</a></li>
                                                    </ul>
                                                    <div class="tab-content ">
                                                        <div class="tab-pane active no-padding" id="home4">
                                                            <div class="col-sm-12">
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账号:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <input class="form-control input-small width-200px view-control" name="name"
                                                                               value="${user.account}" data-placement="bottom" data-trigger="hover" data-rel="popover">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">昵称:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <input class="form-control input-small width-200px view-control" name="age"
                                                                               value="${user.nickName}" data-placement="bottom" data-trigger="hover" data-rel="popover">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">性别:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <select data-placeholder="请选择" name="gender" class="form-control width-200px">
                                                                            <option value="0">男</option>
                                                                            <option value="1">女</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group form-group-sm width-300px">
                                                                    <label class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">邮箱:</label>
                                                                    <div class="col-sm-8  no-padding">
                                                                        <input class="form-control input-small width-200px view-control" name="email"
                                                                               value="${user.mail}" data-placement="bottom" data-trigger="hover" data-rel="popover">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div style="text-align: center;">
                                                <button class="btn btn-info btn-sm" type="submit">
                                                    <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                    保存
                                                </button>
                                                <button id="close" class="btn btn-sm" type="button" onclick="javascript:parent.$.fancybox.close();">
                                                    <span class="ace-icon fa fa-save icon-on-right bigger-110"></span>
                                                    关闭
                                                </button>
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
    $('.chosen-select').chosen({});
    $('#form').formValidation({
        message : 'This value is not valid',
        container : 'popover',
        feedbackIcons : {
            valid : 'glyphicon glyphicon-ok',
            invalid : 'glyphicon glyphicon-remove',
            validating : 'glyphicon glyphicon-refresh'
        },

    }).on('success.form.fv', function(e) {
        e.preventDefault();
        var $form = $(e.target);
        var url='${ctx}/bbm/user/save';
        $.post(url,$form.serialize(),function(data){
            data = eval("(" + data + ")");
            Modal.alert({msg: data.message}).on( function(e){
                if('1'== data.result){
                    $("#close").click();
                }
            });
        });
        /*$.ajax({
            url:"${ctx}/bbm/user/save/",
            type:"DELETE",
            data:$form.serialize(),
            success:function(result){
                alert(result.msg);
                $("#close").click();
            }
        });*/
    });
</script>
</body>
</body>
</html>
