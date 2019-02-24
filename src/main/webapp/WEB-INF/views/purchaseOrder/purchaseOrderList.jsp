<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			订单管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">采购管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">订单列表</span></li>
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
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/purchaseOrder/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>订单标题</label>
							<input type="text" class="form-control" name="name" value="${purchaseOrder.name}" />
						</div>
					</div>
					<div class="form-group">
						<label>订单状态</label>
						<select class="form-control" name="status">
							<option value="">全部</option>
							<option value="A" <c:if test="${purchaseOrder.status eq 'A' }">selected</c:if>>申请</option>
							<option value="P" <c:if test="${purchaseOrder.status eq 'P' }">selected</c:if>>通过</option>
							<option value="F" <c:if test="${purchaseOrder.status eq 'F' }">selected</c:if>>作废</option>
							<option value="S" <c:if test="${purchaseOrder.status eq 'S' }">selected</c:if>>到货</option>
						</select>
					</div>
					<div class="form-group">
						<label>订单状态</label>
						<select class="form-control" name="transport">
							<option value="">全部</option>
							<option value="A" <c:if test="${purchaseOrder.transport eq 'A' }">selected</c:if>>铁路</option>
							<option value="B" <c:if test="${purchaseOrder.transport eq 'B' }">selected</c:if>>公路</option>
							<option value="C" <c:if test="${purchaseOrder.transport eq 'C' }">selected</c:if>>水路</option>
							<option value="D" <c:if test="${purchaseOrder.transport eq 'D' }">selected</c:if>>航空</option>
							<option value="E" <c:if test="${purchaseOrder.transport eq 'E' }">selected</c:if>>管道</option>
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
					<span class="caption-subject sbold uppercase">订单列表</span>
				</div>
				<security:authorize ifAnyGranted="P_AREA_MANAGE">
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/purchaseOrder/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
				</security:authorize>
			</div>
			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							    <th>标题</th>
								<th>供应商</th>
								<th>运输方式</th>
								<th>订单状态</th>
								<th>创建时间</th>
								<th width="30%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>${item.name}</td>
									<td>${item.companyName}</td>
									<td>
										<c:if test="${item.transport eq 'A' }">铁路</c:if>
										<c:if test="${item.transport eq 'B' }">公路</c:if>
										<c:if test="${item.transport eq 'C' }">水路</c:if>
										<c:if test="${item.transport eq 'D' }">航空</c:if>
										<c:if test="${item.transport eq 'E' }">管道</c:if>
									</td>
									<td>
										<c:if test="${item.status eq 'A' }"><span class="font-yellow">申请</span></c:if>
										<c:if test="${item.status eq 'P' }"><span class="font-green">通过</span></c:if>
										<c:if test="${item.status eq 'F' }"><span class="font-red">作废</span></c:if>
										<c:if test="${item.status eq 'S' }"><span class="font-blue">到货</span></c:if>
									</td>
									<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:ss" /></td>
									<security:authorize ifAnyGranted="P_AREA_MANAGE">
									<td>
										<c:if test="${item.status eq 'A'}">
										    <a href="${pageContext.request.contextPath}/purchaseOrder/loadPurchaseOrder?id=${item.id}" target="dialog" class="btn yellow-lemon btn-sm"><i class="fa fa-edit"></i>&nbsp;审核</a>
											<a href="${pageContext.request.contextPath}/purchaseOrder/load?id=${item.id}" target="dialog" class="btn yellow btn-sm"><i class="fa fa-asterisk"></i>&nbsp;修改</a>
										</c:if>
										<c:if test="${item.status eq 'P'}">
											<a href="${pageContext.request.contextPath}/purchaseOrder/loadPurchaseOrder?id=${item.id}" target="dialog" class="btn yellow-lemon btn-sm"><i class="fa fa-edit"></i>&nbsp;确认到货</a>
										</c:if>
										<c:if test="${item.status eq 'A' || item.status eq 'F'}">
										     <a target="ajaxTodo" todoMsg="是否确定删除 ${item.name} 这个需求？" href="${pageContext.request.contextPath}/purchaseOrder/delete?id=${item.id}" class="btn red btn-sm"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
										</c:if>
										<c:if test="${item.status eq 'S'}">
											<a href="${pageContext.request.contextPath}/purchaseOrder/loadPurchaseOrder?id=${item.id}" target="dialog" class="btn blue btn-sm"><i class="fa fa-edit"></i>&nbsp;查看信息</a>
										</c:if>
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