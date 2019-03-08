<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			询价单管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">采购管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">询价单列表</span></li>
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
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/purchaseInquiry/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>供应商名称</label>
							<input type="text" class="form-control" name="companyName" value="${companyName}" />
						</div>
						<div class="form-group">
							<label>物资名</label>
							<input type="text" class="form-control" name="goodsName" value="${goodsName}" />
						</div>
						<div class="form-group">
							<label>询价单状态</label>
							<select class="form-control" name="status">
								<option value="">全部</option>
								<option value="N" <c:if test="${purchaseInquiry.status eq 'N' }">selected</c:if>>未使用</option>
								<option value="Y" <c:if test="${purchaseInquiry.status eq 'Y' }">selected</c:if>>已使用</option>
							</select>
						</div>
						<div class="form-group">
							<label>结算方式</label>
							<select class="form-control" name="paied">
								<option value="">全部</option>
								<option value="A" <c:if test="${purchaseInquiry.paied eq 'A' }">selected</c:if>>现金</option>
								<option value="B" <c:if test="${purchaseInquiry.paied eq 'B' }">selected</c:if>>微信</option>
								<option value="C" <c:if test="${purchaseInquiry.paied eq 'C' }">selected</c:if>>支付宝</option>
								<option value="D" <c:if test="${purchaseInquiry.paied eq 'D' }">selected</c:if>>网银</option>
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
					<span class="caption-subject sbold uppercase">询价单列表</span>
				</div>
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/purchaseInquiry/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
			</div>

			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>编号</th>
							    <th>供应商</th>
								<th>物资</th>
								<th width="7%">数量</th>
								<th width="10%">价格</th>
								<th width="7%">单位</th>
								<th width="10%">状态</th>
								<th width="15%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>${item.code}</td>
									<td>
										<a href="${pageContext.request.contextPath}/supplierCompany/loadSupplierCompany?id=${item.companyId}&s=3" target="dialog">${item.companyName}</a>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/priceGoodsCatalog/look?id=${item.goodsId}" target="dialog"  rel="page-content">&nbsp;${item.goodsName}</a>
									</td>
									<td>${item.number}</td>
									<td>${item.price}</td>
									<td>${item.unit}</td>
									<td>
										<c:if test="${item.status eq 'Y' }"><span class="font-green">已使用</span></c:if>
										<c:if test="${item.status eq 'N' }"><span class="font-yellow">未使用</span></c:if>
									</td>
									<td>
											<c:if test="${item.status eq 'N'}">
												<a href="${pageContext.request.contextPath}/purchaseInquiry/load?id=${item.id}" target="dialog" class="btn yellow btn-sm"><i class="fa fa-asterisk"></i>&nbsp;修改</a>
												<a target="ajaxTodo" todoMsg="是否确定删除这个询价单？" href="${pageContext.request.contextPath}/purchaseInquiry/delete?id=${item.id}" class="btn red btn-sm"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
											</c:if>
											<c:if test="${item.status eq 'Y'}">
												<a href="${pageContext.request.contextPath}/purchaseInquiry/loadPurchaseInquiry?id=${item.id}" target="dialog" class="btn blue btn-sm"><i class="fa fa-edit"></i>&nbsp;查看详情</a>
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