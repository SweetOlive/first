<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			收料管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">采购管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">收料列表</span></li>
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
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/purchaseReceiving/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>订单标题</label>
							<input type="text" class="form-control" name="orderName" value="${orderName}" />
						</div>
					</div>
					<div class="form-group">
						<label>收料编号</label>
						<input type="text" class="form-control" name="code" value="${purchaseReceiving.code}" />
					</div>
					<div class="form-group">
						<label>收料状态</label>
						<select class="form-control" name="status">
							<option value="">全部</option>
							<option value="A" <c:if test="${purchaseReceiving.status eq 'A' }">selected</c:if>>审核</option>
							<option value="P" <c:if test="${purchaseReceiving.status eq 'P' }">selected</c:if>>通过</option>
							<option value="F" <c:if test="${purchaseReceiving.status eq 'F' }">selected</c:if>>回退</option>
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
					<span class="caption-subject sbold uppercase">收料列表</span>
				</div>
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/purchaseReceiving/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							    <th>收料编号</th>
								<th>订单</th>
								<th>收料状态</th>
								<th>创建时间</th>
								<th width="30%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>${item.code}</td>
									<td>${item.orderName}</td>
									<td>
										<c:if test="${item.status eq 'A' }"><span class="font-yellow">审核</span></c:if>
										<c:if test="${item.status eq 'P' }"><span class="font-green">通过</span></c:if>
										<c:if test="${item.status eq 'F' }"><span class="font-red">回退</span></c:if>
									</td>
									<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:ss" /></td>
									<td>
										<c:if test="${item.status eq 'A'}">
											<a href="${pageContext.request.contextPath}/purchaseReceiving/loadPurchaseReceiving?id=${item.id}" target="dialog" class="btn yellow-lemon btn-sm"><i class="fa fa-edit"></i>&nbsp;审核</a>
										    <a href="${pageContext.request.contextPath}/purchaseReceiving/load?id=${item.id}" target="dialog" class="btn yellow btn-sm"><i class="fa fa-asterisk"></i>&nbsp;修改</a>
										    <a target="ajaxTodo" todoMsg="是否确定删除这个收料信息？" href="${pageContext.request.contextPath}/purchaseReceiving/delete?id=${item.id}" class="btn red btn-sm"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
										</c:if>
										<c:if test="${item.status eq 'P' || item.status eq 'F'}">
											<a href="${pageContext.request.contextPath}/purchaseReceiving/loadPurchaseReceiving?id=${item.id}" target="dialog" class="btn blue btn-sm"><i class="fa fa-edit"></i>&nbsp;查看详情</a>
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