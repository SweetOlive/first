<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			物资目录管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">价格目录管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">物资目录列表</span></li>
</ul>
<!-- END PAGE BREADCRUMB -->

<div class="row">
	<div class="col-md-3">
		<div class="portlet light bordered">
			<div class="portlet-title">
				<div class="caption">
					<i class="icon-magnifier font-dark"></i>
					<span class="caption-subject font-dark bold uppercase">搜索</span>
				</div>
				<div class="actions"></div>
			</div>
			<div class="portlet-body">
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/priceGoodsCatalog/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>目录名</label>
							<input type="text" class="form-control" name="name" value="${priceGoodsCatalog.name}" />
						</div>
						<div class="form-group">
							<label>目录编号</label>
							<input type="text" class="form-control" name="code" value="${priceGoodsCatalog.code}" />
						</div>
						<div class="form-group">
							<label>状态</label>
							<select class="form-control" name="status">
								<option value="">全部</option>
								<option value="S" <c:if test="${priceGoodsCatalog.status eq 'S' }">selected</c:if>>申请</option>
								<option value="A" <c:if test="${priceGoodsCatalog.status eq 'A' }">selected</c:if>>审核</option>
								<option value="F" <c:if test="${priceGoodsCatalog.status eq 'F' }">selected</c:if>>发布</option>
								<option value="D" <c:if test="${priceGoodsCatalog.status eq 'D' }">selected</c:if>>作废</option>
							</select>
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
					<span class="caption-subject sbold uppercase">物资目录列表</span>
				</div>
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/priceGoodsCatalog/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
			</div>

			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							    <th>目录名</th>
								<th>编号</th>
								<th>创建时间</th>
								<th>状态</th>
								<th width="30%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>${item.name}</td>
									<td>${item.code}</td>
									<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:ss" /></td>
									<td>
										<c:if test="${item.status eq 'S' }"><span class="font-yellow">申请</span></c:if>
										<c:if test="${item.status eq 'A' }"><span class="font-blue">审核</span></c:if>
										<c:if test="${item.status eq 'F' }"><span class="font-green">发布</span></c:if>
										<c:if test="${item.status eq 'D' }"><span class="font-red">作废</span></c:if>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/priceGoodsCatalog/loadCatalog?id=${item.id}" target="ajax" class="btn blue btn-sm" rel="page-content"><i class="fa fa-edit"></i>&nbsp;目录详情</a>
										<a href="${pageContext.request.contextPath}/priceGoodsCatalog/load?id=${item.id}" target="dialog" class="btn yellow btn-sm">
											<i class="fa fa-asterisk"></i>&nbsp;修改
										</a>
										<a target="ajaxTodo" todoMsg="是否确定删除 ${item.name} 这个目录？ 以及其所有物资信息？" href="${pageContext.request.contextPath}/priceGoodsCatalog/delete?id=${item.id}" class="btn red btn-sm">
											<i class="fa fa-trash-o"></i>&nbsp;删除
										</a>
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