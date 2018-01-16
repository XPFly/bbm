<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户信息展示列表页面</title>
    <%
        pageContext.setAttribute("ctx", request.getContextPath());
    %>
    <link rel="stylesheet" href="${ctx }/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/static/css/main.css">
    <script type="text/javascript" src="${ctx }/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${ctx }/static/bootstrap/js/bootstrap.min.js"></script>

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
    <div class="main-content ">
        <div class="main-content-inner ">
            <div class="page-content ">
                <div class="row">
                    <div class=" widget-container-col ui-sortable  ">
                        <div class="widget-box widget-color-normal3" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 查询条件
                                </h5>
                                <span class="widget-toolbar">
                                    <a data-action="collapse" href="#"> <i class="ace-icon fa fa-chevron-up"></i></a>
								</span>
                            </div>
                            <div class="widget-body">
                                <div class="widget-main no-padding ">
                                    <div class="widget-main ">
                                        <form class="form-inline form-horizontal" action="${ctx}/bbm/user/list?entry=1"
                                              id="searchForm" method="post">
                                            <%--<input type="hidden" name="pageNum" value="${pageInfo.getPageNum()}"/>--%>
                                            <%--<input type="hidden" name="pageSize" value="${pageInfo.getPageSize()}">--%>
                                            <div class="col-xs-12">

                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">账号:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                        <input type="text" name="name" value="${user.account}" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6">
                                                    </div>
                                                </div>
                                                <div class="form-group form-group-sm width-300px">
                                                    <label for="form-field-6" class="col-sm-4 control-label widget-color-normal5 width-100px no-padding-left">昵称:</label>
                                                    <div class="col-sm-8  no-padding"  >
                                                        <input type="text" name="age" value="${user.nickName}" class="form-control input-small width-200px" data-placement="bottom" title=""  id="form-field-6">
                                                    </div>
                                                </div>
                                            </div>

                                            <button class="btn btn-normal btn-sm" type="submit">
                                                <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                查询
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="resetMecForm()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>
                                                重置
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="downloadExcel()">
                                                <span class="ace-icon fa fa-refresh icon-on-right bigger-110"></span>
                                                导出Excel
                                            </button>
                                            <button class="btn btn-normal btn-sm" type="button" id="statistics">
                                                <span class="ace-icon fa fa-search-plus icon-on-right bigger-110"></span>
                                                统计
                                            </button>
                                            <button class="btn btn-info btn-sm" type="button" onclick="show('add','')">
                                                <span class="ace-icon fa fa-plus icon-on-right bigger-110"></span>
                                                添加内容
                                            </button>
                                            <button class="btn btn-danger btn-sm" type="button" id="del_all_btn">
                                                <span class="ace-icon fa fa-plus icon-on-right bigger-110"></span>
                                                全删
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div id="td" style="display: none">
                            总条数：
                            <c:choose>
                                <c:when test="${countAll eq 0 || empty countAll}">0</c:when>
                                <c:otherwise>${countAll}</c:otherwise>
                            </c:choose>
                        </div>--%>

                        <div class="widget-box widget-color-normal2" style="opacity: 1;">
                            <div class="widget-header">
                                <h5 class="widget-title bigger lighter">
                                    <i class="ace-icon fa fa-table"></i> 查询结果
                                </h5>
                            </div>
                            <c:if test="${empty userList}">
                                <div align="center">未查询到数据</div>
                            </c:if>
                            <c:if test="${!empty userList}">
                                <div class="widget-body">
                                    <div class="widget-main no-padding table-responsive">
                                        <table class="table  table-condensed table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                                            <thead class="thin-border-bottom">
                                            <tr>
                                                <th>
                                                    <input type="checkbox" id="checkAll">
                                                </th>
                                                <th align="center">序号</th>
                                                <th align="center">账号</th>
                                                <th align="center">昵称</th>
                                                <th align="center">性别</th>
                                                <th align="center">邮箱</th>
                                                <th align="center">权限</th>
                                                <th align="center">创建时间</th>
                                                <th align="center">更新时间</th>
                                                <th align="center">最近登录时间</th>
                                                <th align="center">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody>
                                            <c:forEach var="user" items="${userList}" varStatus="status">
                                                <tr>
                                                    <td align="center">
                                                        <input type="checkbox" class="checkItem" value="${user.uuid}" id="uuid">
                                                    </td>
                                                    <td align="center">${status.count}</td>
                                                    <td>${user.account}</td>
                                                    <td>${user.nickName}</td>
                                                    <td align="center">
                                                        <c:if test="${user.gender == 0}">男</c:if>
                                                        <c:if test="${user.gender == 1}">女</c:if>
                                                    </td>
                                                    <td>${user.mail}</td>
                                                    <td>
                                                        <c:if test="${user.authority==0}">管理员</c:if>
                                                        <c:if test="${user.authority==1}">普通用户</c:if>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${user.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                                    </td>
                                                    <td align="center">
                                                        <a href="javascript:show('detail','${user.uuid }')" >
                                                            查看</a>
                                                        <a href="javascript:show('edit','${user.uuid }')" >
                                                            修改</a>
                                                        <a href="javascript:del('${user.uuid }')" >
                                                            删除</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="row col-sm-12    ">
                        <div class="col-sm-4 hidden-480 left">
                            <label class="dataTables_info " id="dynamic-table_info" role="status" aria-live="polite"></label>
                        </div>
                        <%--<div class="col-sm-8 right">
                            <%@include file="pagination.jsp"%>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.main-content -->
</div>
<script type="text/javascript">
    function resetMecForm(){
        $(':input','#searchForm')
            .not(':button, :submit, :reset, :hidden')
            .removeAttr('checked')
            .removeAttr('selected')
            .val("");
    }

    //全选、全不选
    $("#checkAll").click(function(){
        $(".checkItem").prop("checked",$(this).prop("checked"));
    });

    //当本页的checkItem全部选中，checkAll也为选中状态
    $(document).on("click",".checkItem",function(){
        var flag = $(".checkItem:checked").length == $(".checkItem").length;
        $("#checkAll").prop("checked",flag);
    });

    //批量删除

    $("#del_all_btn").click(function(){
        var userNames = "";
        var del_idstr = "";
        $.each($(".checkItem:checked"),function(){
            //组装员工姓名字符串
            userNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("#uuid").val()+"-";
        });
        //去除empNames多余的：逗号(,)
        userNames = userNames.substring(0, userNames.length-1);
        //去除删除的id多余的：短横线(-)
        del_idstr = del_idstr.substring(0, del_idstr.length-1);
        if(confirm("确认删除【"+userNames+"】吗？")){
            //发送ajax请求删除
            $.ajax({
                url:"${ctx}/bbm/user/delete/"+del_idstr,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    $("#searchForm").submit();
                }
            });
        }
    });

    function del(uuid){
        var url="${ctx}/demo/user/delete?uuid="+uuid;
        confirm("确认删除吗？").on(function(e){
            if(e){
                $.post(url,function(data){
                    data = eval("(" + data + ")")
                    Modal.alert({msg: data.message}).on( function(e){
                        if(data.message == "删除成功"){
                            $("#searchForm").submit();
                        }
                    });
                });
            }
        });
    }

    /**
     * 添加、查看、编辑功能
     */
    function show(type,uuid){
        $.fancybox.open({
            href : '${ctx}/bbm/user/'+type+'?uuid='+uuid,
            type: 'iframe',
            padding: 5,
            scrolling: 'no',
            fitToView: true,
            width: 900,
            height: 800,
            autoSize: false,
            closeClick: false,
            afterClose:function(){
                location.reload();
            }
        });
    }

    /**
     * 导出Excel
     */
    function downloadExcel(){
        var params=$("#searchForm").serialize();
        window.location.href="${ctx}/bbm/user/excelExport?"+params;
    }

    /**
     * 统计展示模块
     */
    $(function() {
        $('#statistics').click(function() {
            $('#td').css('display', 'block');
        })
    });

    /**
     * 提交表单
     * @returns {boolean}
     */
    function subForm() {
        var startTime = $("#dateCreatedBegin").val();
        var endTime = $("#dateCreatedEnd").val();
        if (endTime < startTime) {
            Modal.alert({
                msg : '创建开始时间不能大于结束时间'
            });
            return false;
        }
        $('#searchForm').submit();
    }
</script>
</body>
</html>
