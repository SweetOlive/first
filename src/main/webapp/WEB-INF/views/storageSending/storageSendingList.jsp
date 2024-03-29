<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			发料管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">仓储管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">发料列表</span></li>
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
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/storageSending/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="form-group">
						<label>物资名称</label>
						<input type="text" class="form-control" name="goodsName" value="${goodsName}" />
					</div>
					<div class="form-group">
						<label>接收部门</label>
						<input type="text" class="form-control" name="departmentName" value="${departmentName}" />
					</div>
					<div class="form-group">
						<label>发料编号</label>
						<input type="text" class="form-control" name="code" value="${storageSending.code}" />
					</div>
					<div class="form-group">
						<label>发料状态</label>
						<select class="form-control" name="status">
							<option value="">全部</option>
							<option value="A" <c:if test="${storageSending.status eq 'A' }">selected</c:if>>审核</option>
							<option value="P" <c:if test="${storageSending.status eq 'P' }">selected</c:if>>通过</option>
							<option value="F" <c:if test="${storageSending.status eq 'F' }">selected</c:if>>退回</option>
						</select>
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
					<span class="caption-subject sbold uppercase">发料列表</span>
				</div>
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/storageSending/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							    <th>发料编号</th>
								<th width="10%">物资名</th>
								<th width="15%">接收部门</th>
								<th width="10%">发料状态</th>
								<th>创建时间</th>
								<th width="22%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>${item.code}</td>
									<td>
										<a href="${pageContext.request.contextPath}/priceGoodsCatalog/look?id=${item.goodsId}" target="dialog"  rel="page-content">${item.goodsName}</a>
									</td>
									<td>${item.departmentName}</td>
									<td>
										<c:if test="${item.status eq 'A' }"><span class="font-yellow">审核</span></c:if>
										<c:if test="${item.status eq 'P' }"><span class="font-green">通过</span></c:if>
										<c:if test="${item.status eq 'F' }"><span class="font-red">退回</span></c:if>
									</td>
									<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:ss" /></td>
									<td>
										<c:if test="${item.status eq 'A'}">
											<a href="${pageContext.request.contextPath}/storageSending/loadStorageSending?id=${item.id}" target="dialog" class="btn yellow-lemon btn-sm"><i class="fa fa-edit"></i>&nbsp;审核</a>
										    <a href="${pageContext.request.contextPath}/storageSending/load?id=${item.id}" target="dialog" class="btn yellow btn-sm"><i class="fa fa-asterisk"></i>&nbsp;修改</a>
										    <a target="ajaxTodo" todoMsg="是否确定删除这个发料信息？" href="${pageContext.request.contextPath}/storageSending/delete?id=${item.id}" class="btn red btn-sm"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
										</c:if>
										<c:if test="${item.status eq 'P' || item.status eq 'F'}">
											<a href="${pageContext.request.contextPath}/storageSending/loadStorageSending?id=${item.id}" target="dialog" class="btn blue btn-sm"><i class="fa fa-edit"></i>&nbsp;查看</a>
										</c:if>
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