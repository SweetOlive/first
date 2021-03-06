<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			限价管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">价格目录管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">限价列表</span></li>
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
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/priceGoodsLimit/list" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>物资名</label>
							<input type="text" class="form-control" name="goodsName" value="${priceGoodsLimit.goodsName}" />
						</div>
						<div class="form-group">
							<label>物资编号</label>
							<input type="text" class="form-control" name="goodsCode" value="${priceGoodsLimit.goodsCode}" />
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
					<span class="caption-subject sbold uppercase">限价列表</span>
				</div>
				<div class="actions">
					<a class="btn green btn-sm" href="${pageContext.request.contextPath}/priceGoodsLimit/load" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				</div>
			</div>

			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
							    <th width="30%">物资名</th>
								<%--<th>物资编号</th>--%>
								<th>价格区间</th>
								<th>限价时间</th>
								<%--<th>创建时间</th>--%>
								<th width="25%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>
										<a href="${pageContext.request.contextPath}/priceGoodsCatalog/look?id=${item.goodsId}" target="dialog"  rel="page-content">${item.goodsName}</a>
									</td>
									<%--<td>${item.goodsCode}</td>--%>
									<td>${item.priceMin}-${item.priceMax}</td>
									<td>
										<fmt:formatDate value="${item.startTime}" pattern="yyyy-MM-dd" />
										-
										<fmt:formatDate value="${item.endTime}" pattern="yyyy-MM-dd" />
									</td>
									<%--<td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:ss" /></td>--%>
									<td>
										<a href="${pageContext.request.contextPath}/priceGoodsLimit/load?id=${item.id}" target="dialog" class="btn yellow btn-sm">
											<i class="fa fa-asterisk"></i>&nbsp;修改
										</a>
										<a target="ajaxTodo" todoMsg="是否确定删除这个限价？" href="${pageContext.request.contextPath}/priceGoodsLimit/delete?id=${item.id}" class="btn red btn-sm">
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