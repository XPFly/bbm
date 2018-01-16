<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <title>操作记录表</title>

</head>
<body>
<div class="widget-box widget-color-normal2" style="opacity: 1;">
    <div class="widget-header">
        <h5 class="widget-title bigger lighter">
            <i class="ace-icon fa fa-table"></i> 操作记录
        </h5>
    </div>
    <div class="widget-body">
        <div class="widget-main no-padding table-responsive">
            <table class="table  table-condensed table-striped table-bordered table-hover dataTable no-footer DTTT_selectable">
                <thead class="thin-border-bottom">
                <tr>
                    <th width="10%">序号</th>
                    <th width="10%">操作人</th>
                    <th width="10%">类型</th>
                    <th width="10%">备注</th>
                    <th width="10%">操作时间</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="operateRecord" items="${operateRecordList}" varStatus="status">
                    <tr>
                        <td align="center">${status.count }</td>
                        <td align="center">${operateRecord.operator }</td>
                        <td align="center">${operateRecord.operateType }</td>
                        <td align="center">${operateRecord.remark }</td>
                        <td align="center">
                            <fmt:formatDate value="${operateRecord.operateTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
