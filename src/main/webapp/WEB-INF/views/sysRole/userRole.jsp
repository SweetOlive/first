<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			角色分配<small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">基础管理</a> <i class="fa fa-angle-right"></i></li>
	<li><a target="ajax" rel="page-content"
		href="${pageContext.request.contextPath}/sysRole/list">角色管理</a> <i
		class="fa fa-angle-right"></i></li>
	<li><span class="active">角色分配</span></li>
</ul>
<!-- END PAGE BREADCRUMB -->

<!-- Main content -->

<div class="row">
	<div class="col-md-3">
		<div class="portlet light bordered" id="roleUser">
			<div class="box box-solid">
				<div class="box-header with-border">
					<!-- <span class="caption-subject sbold uppercase">已分配用户</span> -->
					<h4 class="box-title" style="margin-bottom: 18px;">${sysRole.name}  已分配用户</h4>
				</div>
				<div class="box-body">
					<table class="table table-bordered table-hover dataTable">
						<thead>
							<tr>
								<th>用户名</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${listLeft}">
								<tr>
									<td>${item.userName}</td>
									<td><a
										href="${pageContext.request.contextPath}/sysRole/deleteUserRole?roleId=${item.roleId}&userIds=${item.userId}"
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
					<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/sysRole/loadSysRole" onsubmit="return divSearch(this,'page-content')">
						<input type="hidden" id="nowId" name="nowId" value="${nowUser.id}" />
						<input type="hidden" id="roleId" name="id" value="${roleId}" />
						<input type="hidden" id="_pageNum" name="rightPageNum" value="${pageList.pageNum}" /> 
			            <input type="hidden" id="_pageSize" name="rightPageSize" value="${pageList.pageSize}" />
						<table>
							<tr>
								<td style="padding-left: 10px">
									<h4 class="box-title">用户名</h4>
								</td>
								<td style="padding-left: 10px">
								<input type="text" id="username" name="name" value="${sysUser.name}"
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
									     <c:if test="${not empty roleUserMap[item.id]}">checked="checked"</c:if>
											   value="${item.id}" 
											   onchange="changeRoleUser('${roleId}','${item.id}','${nowUser.id}');"
									  />
									</td>
									<td>${item.name}</td>
									<td>
											<fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:ss" />
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
	function changeRoleUser(roleId, id,nowId) {
		var document = $("#user_" + id);
		var url = "";
		//alert("document:"+document.get(0).checked);
		//alert("id:"+id);
		if (document.get(0).checked) {
			url = "${pageContext.request.contextPath}/sysRole/addUserRole";
		} else {
			url = "${pageContext.request.contextPath}/sysRole/deleteUserRole";
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
					userIds : id,
					roleId : roleId,
					nowId : nowId
				},
				success : function(json) {
					$("#page-content")
							.ajaxUrl(
									{
										type : "POST",
										url : "${pageContext.request.contextPath}/sysRole/loadSysRole",
										data : {
											id : roleId,
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


