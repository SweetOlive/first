<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			用户管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">基础管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">用户列表</span></li>
</ul>
<!-- END PAGE BREADCRUMB -->

<div class="row">
	<div class="col-md-3">
		<div class="portlet light bordered">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-magnifier font-dark"></i> <span class="caption-subject font-dark bold uppercase">搜索</span>
				</div>
				<div class="actions"></div>
			</div>
			<div class="portlet-body">
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/sysUser/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>用户名</label>
							<input type="text" class="form-control" name="name" value="${sysUser.name}" />
						</div>
						<div class="form-group">
							<label>账号</label>
							<input type="text" class="form-control" name="accountNumber" value="${sysUser.accountNumber}" />
						</div>

					</div>
					<div class="box-footer m-grid">

						<button type="submit" class="btn btn-block green m-grid-col-right">
							搜索&nbsp;<i class="m-icon-swapright m-icon-white"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="col-md-9">
		<div class="portlet light bordered">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-list"></i>
					<span class="caption-subject sbold uppercase">用户列表</span>
				</div>
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/sysUser/importExcel" target="dialog"><i class="fa fa-upload"></i>&nbsp;导入</a>
					<a href="${pageContext.request.contextPath}/sysUser/exportExcel?name=${sysUser.name}&accountNumber=${sysUser.accountNumber}" class="btn green btn-sm"><i class="fa fa-download"></i>&nbsp;导出</a>
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/sysUser/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
			</div>

			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th width="15%">用户头像</th>
							    <th>用户名</th>
								<th>账号</th>
								<th>登录次数</th>
								<th width="30%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>
										<c:choose>
											<c:when test="${not empty item.imgPath}">
												<img id="img" src="${pageContext.request.contextPath}/admin/imgView?path=${item.imgPath}" class="img-responsive" alt="">
											</c:when>
											<c:otherwise>
												<img id="img" src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&text=no+image" class="img-responsive">
											</c:otherwise>
										</c:choose>
									</td>
									<td>${item.name}</td>
									<td>${item.accountNumber}</td>
									<td>${item.count}</td>
									<td>
										<a href="${pageContext.request.contextPath}/sysUser/loadDetail?id=${item.id}" target="ajax" rel="page-content" class="btn blue btn-sm"><i class="fa fa-search"></i>&nbsp;查看详情</a>
										<a href="${pageContext.request.contextPath}/sysUser/load?id=${item.id}" target="dialog" class="btn yellow btn-sm"><i class="fa fa-asterisk"></i>&nbsp;修改</a>
										<a target="ajaxTodo" todoMsg="是否确定删除 ${item.name} 这个用户？" href="${pageContext.request.contextPath}/sysUser/delete?id=${item.id}" class="btn red btn-sm"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
									</td>
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
	<!-- /.col -->
</div>
<!-- /.row -->