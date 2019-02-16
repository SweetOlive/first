<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			部门分配用户<small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">部门管理</a> <i class="fa fa-angle-right"></i></li>
	<li><a target="ajax" rel="page-content"
		href="${pageContext.request.contextPath}/admin/seaDepartment/list">部门管理</a> <i
		class="fa fa-angle-right"></i></li>
	<li><span class="active">部门分配用户</span></li>
</ul>
<!-- END PAGE BREADCRUMB -->

<!-- Main content -->

<div class="row">
	<div class="col-md-3">
		<div class="portlet light bordered" id="roleUser">
			<div class="box box-solid">
				<div class="box-header with-border">
					<h4 class="box-title" style="margin-bottom: 18px;">${seaDepartmentDTO.name}已分配用户</h4>
				</div>
				<div class="box-body">
					<table class="table table-bordered table-hover dataTable">
						<thead>
							<tr>
								<th>用户名(真实姓名)</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${leftPageList}">
								<tr>
									<td>${item.username}[${item.realName }]</td>
									<td><a
										href="${pageContext.request.contextPath}/admin/seaDepartment/deleteUserDepartment?userId=${item.id}&departmentId=${item.userDepartmentId}"
										class="btn red btn-sm" target="ajaxTodo" todoMsg="是否确定删除这个用户？"><i
											class="fa fa-trash-o"></i>&nbsp;删除</a></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-9">
		<div class="portlet light bordered">
			<div class="box box-success">
				<div class="box-header">
					<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/admin/seaDepartment/loadDepartmentUser" onsubmit="return divSearch(this,'page-content')">
						<input type="hidden" id="departmentId" name="id" value="${departmentId}" />
						<input type="hidden" id="_pageNum" name="rightPageNum" value="${pageList.pageNum}" /> 
			            <input type="hidden" id="_pageSize" name="rightPageSize" value="${pageList.pageSize}" />
						<table>
							<tr>
								<td style="padding-left: 10px">
									<h4 class="box-title">用户名（真实姓名）</h4> 
								</td>
								<td style="padding-left: 10px">
								<input type="text" id="username" name="username" value="${rightUser.username}"
									class="form-control" /></td>
								<td style="padding-left: 10px">
									<button type="submit"
										class="btn btn-block green m-grid-col-right">
										搜索&nbsp;<i class="m-icon-swapright m-icon-white"></i>
									</button> 
								</td>
							</tr>
						</table>
					</form>

				</div>
				<div class="portlet-body">
					<div class="table-responsive table-container">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th></th>
									<th>用户名</th>
									<th>状态</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${pageList.data}">
									<tr>
									<td>
									  <input type="checkbox" id="user_${item.id}"  name="userId"
									     <c:if test="${not empty addUserMap[item.id]}">checked="checked"</c:if>
											   value="${item.id}" 
											   onchange="changeRoleUser('${departmentId}','${item.id}');" 
									  />
									</td>
									<td>${item.username}[${item.realName }]</td>
									<td>
									    <c:if test="${item.status eq 'V' }">正常</c:if> 
									    <c:if test="${item.status eq 'I' }">禁用</c:if></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row">
						<c:import url="../common/pageBar.jsp"></c:import>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.col -->
</div>
<!-- /.row -->
<script type="text/javascript">
	function changeRoleUser(departmentId, id) {
		var document = $("#user_" + id);
		var url = "";
		//alert("document:"+document.get(0).checked);
		//alert("id:"+id);
		if (document.get(0).checked) {
			url = "${pageContext.request.contextPath}/admin/seaDepartment/saveUserDepartment";
		} else {
			url = "${pageContext.request.contextPath}/admin/seaDepartment/deleteUserDepartment";
		}

		var rightPageNum = $("#_pageNum").val();
		var rightPageSize = $("#_pageSize").val();
		var username = $("#username").val();
		$.ajax({
				type : 'post',
				url : url,
				cache : false,
				dataType : 'json',
				data : {
					userId : id,
					departmentId : departmentId
				},
				success : function(json) {
					$("#page-content")
							.ajaxUrl(
									{
										type : "POST",
										url : "${pageContext.request.contextPath}/admin/seaDepartment/loadDepartmentUser",
										data : {
											id : departmentId,
											rightPageNum : rightPageNum,
											rightPageSize : rightPageSize,
											username : username
										}
									});
				},
				error : function() {
					bootbox.alert(json.msg);
				}
			});
	}
</script>


