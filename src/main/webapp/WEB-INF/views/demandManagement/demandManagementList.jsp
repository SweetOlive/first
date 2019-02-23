<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			需求管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">预算管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">需求列表</span></li>
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
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/demandManagement/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>需求标题</label>
							<input type="text" class="form-control" name="name" value="${demandManagement.name}" />
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
					<span class="caption-subject sbold uppercase">需求列表</span>
				</div>
				<security:authorize ifAnyGranted="P_AREA_MANAGE">
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/demandManagement/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
				</security:authorize>
			</div>

			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							    <th>标题</th>
								<th>需求资金</th>
								<th>创建时间</th>
								<th width="30%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>${item.name}</td>
									<td>${item.usedCapital}</td>
									<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:ss" /></td>
									<security:authorize ifAnyGranted="P_AREA_MANAGE">
									<td>
										<a href="${pageContext.request.contextPath}/demandManagement/load?id=${item.id}" target="dialog" class="btn yellow btn-sm">
											<i class="fa fa-asterisk"></i>&nbsp;修改
										</a>
										<a target="ajaxTodo" todoMsg="是否确定删除 ${item.name} 这个需求？" href="${pageContext.request.contextPath}/demandManagement/delete?id=${item.id}" class="btn red btn-sm">
											<i class="fa fa-trash-o"></i>&nbsp;删除
										</a>
									</td>
									</security:authorize>
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