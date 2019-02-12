<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<script type="text/javascript">
	$(function() {
		var opt = {
			callback: changePage,
			current_page:${pageList.pageNum-1},
			items_per_page:${pageList.pageSize+0},
			num_display_entries:5,
			num_edge_entries:2,
			prev_text:'PREV',
			next_text:'NEXT'
		};
		$("#paginate").pagination(${pageList.totalItems+0}, opt);
		
	});

	function changePage(page_index,jq) {
		var page = page_index+1;
		$("#_pageNum").attr('value', page);
		$("#pagerForm").submit();
	}
	
	function changePageSize(){
		var ps=$("#_pageSizeSel").val();
		$("#_pageSize").attr('value', ps);
		$("#pagerForm").submit();
	}
</script>



<div class="col-md-5 col-sm-12">
	<div class="dataTables_info" aria-live="polite">共 <span>${pageList.totalItems+0}</span> 条记录 | 每页<span>
						<select id="_pageSizeSel" onchange="changePageSize()">
							<option value="10" <c:if test="${pageList.pageSize eq 10}">selected</c:if>>10</option>														
							<option value="20" <c:if test="${pageList.pageSize eq 20}">selected</c:if>>20</option>														
							<option value="50" <c:if test="${pageList.pageSize eq 50}">selected</c:if>>50</option>														
							<option value="100" <c:if test="${pageList.pageSize eq 100}">selected</c:if>>100</option>														
						</select>
						</span> 条记录</div>
</div>
<div class="col-md-7 col-sm-12">
	<div class="dataTables_paginate paging_bootstrap_number" style="float:right;">
		<ul id="paginate" class="pagination"></ul>
	</div>
</div>


