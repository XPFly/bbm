<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="pagination" class="dataTables_paginate paging_simple_numbers clearfix pull-right"  >

</div>

<script>
    var str = "";


    var total = ${pageInfo.total};
    var pages = ${pageInfo.pages};
    if(total > 0 && pages <= 0){
        pages = parseInt(Math.ceil(total/${pageInfo.pageSize}));
    }

    var max = ${pageInfo.pageSize};
    var offset = ${pageInfo.pageNum -1}*max;
    var maxsteps = 5;

    if (!offset) offset = 0;
    if (!max) max = 100;

    var linkParams = [];


    var steps = maxsteps > 0;
    var currentstep = (offset / max) + 1;
    var firststep = 1;
    var laststep = pages;

    var disabledPrev = (currentstep > firststep) ? "" : "disabled";

    str += '<ul  class="pagination no-padding" >';
    str += "<li class='prev ${disabledPrev}'><a href='#' onclick='page(1)'> 首页</a>";
    str += "</li>";

    if (steps && laststep > firststep) {

        var beginstep = currentstep - Math.round(maxsteps / 2) + (maxsteps % 2)
        var endstep  = currentstep + Math.round(maxsteps / 2) - 1
        if (beginstep < firststep) {
            beginstep = firststep
            endstep = maxsteps
        }
        if (endstep > laststep) {
            beginstep = laststep - maxsteps + 1
            if (beginstep < firststep) {
                beginstep = firststep
            }
            endstep = laststep
        }

        for (var x = beginstep; x <= endstep ;x++){
            if (currentstep == x) {
                str+= "<li class='active'><a href='#'  onclick='page("+x+ ") ;return false ;'>"+x+"</a></li>"
            }
            else {
                str+= "<li> <a href='#'  onclick='page("+x+ ") ;return false ;'>";
                str+=x;
                str+="</a> </li>";
            }
        }

        if (endstep < laststep) {
            linkParams.offset = (laststep -1) * max
            str+= '<li class="disabled"><a href="#">…</a></li>';
            str+= "<li> <a href='#' onclick='page("+laststep+ ") ;return false ;'>";
            str+= laststep;
            str+= "</a></li>";
        }
    }

    var disabledNext = (currentstep < laststep) ? "" : "disabled"
    str+= "<li class='next ${disabledNext}'>";
    str+= "<a href='#' onclick='page("+laststep+ ") ;return false ;'>尾页</a>";
    str+= "</li>";

   str+='<div class="input-group pull-right col-sm-2">';
   str+='<input type="number" min="1" class="form-control p" style="height:30px;width:50px">'
   str+='<a href="$" class="input-group-addon"  onclick="page($(\'.p\').val());return false;">跳转</a>'
   str+='</div>'
	   str+= "</ul>";

    document.getElementById("pagination").innerHTML=str;


    function page(currentPage){
    	if(currentPage == undefined || currentPage == null || currentPage == ''){
    		alert('请输入跳转页码！');
    		$('.p').focus();
    		return;
    	}
        $("#searchForm input[name='pageNum']").val(currentPage);
        document.getElementById("searchForm").submit();
        return true ;
    }
    document.getElementById("dynamic-table_info").parentNode.parentNode.className="row no-margin";    
    document.getElementById("pagination").parentNode.className="col-sm-6 pull-right no-padding";
    document.getElementById("dynamic-table_info").parentNode.className="col-sm-4 hidden-480 left no-padding";
    
   str='<div class="inline">';
   str+='<select id="_pSize"  class=" form-control " style="width:65px ;height:30px" onchange="onChange4PageSize(this)">';
   str+='<option>10</option>';
   str+='<option>20</option>';
   str+='<option>50</option>';
   str+='<option>100</option>';
   str+='</select>';
   str+='</div>';
    if(pages > 0)
         document.getElementById("dynamic-table_info").parentNode.innerHTML = ("<div class='inline'>记录数:"+ (offset+1) +"-"+(offset+max) +" 共 "+total +"条  共:"+pages +"页。每页数量:</div>" + str);
    else
        document.getElementById("dynamic-table_info").innerHTML = ("记录数:0");

   document.getElementById("_pSize").value=max;
   function onChange4PageSize(e){
        $("#searchForm input[name='pageSize']").val(e.value);
        document.getElementById("searchForm").submit();
        return true ;

  }
</script>