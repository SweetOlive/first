<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			供应商管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">供应商管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">供应商列表</span></li>
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
				<form id="pagerForm" method="post" action="${pageContext.request.contextPath}/supplierCompany/passAndFailList" onsubmit="return divSearch(this,'page-content')">
					<input type="hidden" id="_pageNum" name="pageNum" value="${pageList.pageNum}" /> 
					<input type="hidden" id="_pageSize" name="pageSize" value="${pageList.pageSize}" />
					<div class="box-body">
						<div class="form-group">
							<label>供应商名称</label>
							<input type="text" class="form-control" name="name" value="${supplierCompany.name}" />
						</div>
						<div class="form-group">
							<label>供应商编号</label>
							<input type="text" class="form-control" name="code" value="${supplierCompany.code}" />
						</div>
						<div class="form-group">
						<label>信用等级</label>
						<select class="form-control" name="creditRating">
							<option value="">全部</option>
							<option value="A" <c:if test="${supplierCompany.creditRating eq 'A' }">selected</c:if>>A</option>
							<option value="B" <c:if test="${supplierCompany.creditRating eq 'B' }">selected</c:if>>B</option>
							<option value="C" <c:if test="${supplierCompany.creditRating eq 'C' }">selected</c:if>>C</option>
						</select>
					    </div>
						<div class="form-group">
							<label>合作状态</label>
							<select class="form-control" name="status">
								<option value="">全部</option>
								<option value="P" <c:if test="${supplierCompany.status eq 'P' }">selected</c:if>>通过</option>
								<option value="F" <c:if test="${supplierCompany.status eq 'C' }">selected</c:if>>作废</option>
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
					<span class="caption-subject sbold uppercase">供应商列表</span>
				</div>
			</div>
			<div class="portlet-body">
				<div class="table-responsive table-container">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>名称</th>
								<th>编号</th>
								<th>信用等级</th>
								<th>合作状态</th>
								<th width="30%">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${pageList.data}">
								<tr>
									<td>${item.name}</td>
									<td>${item.code}</td>
									<td>${item.creditRating}</td>
									<td>
										<c:if test="${item.status eq 'P' }"><span class="font-green">通过</span></c:if>
										<c:if test="${item.status eq 'F' }"><span class="font-red">作废</span></c:if>
									</td>
									<td>
										<c:if test="${item.status eq 'P'}">
										     <a href="${pageContext.request.contextPath}/supplierCompany/loadSupplierCompany?id=${item.id}&s=2" target="dialog" class="btn yellow-lemon btn-sm"><i class="fa fa-edit"></i>&nbsp;作废</a>
										</c:if>
										<c:if test="${item.status eq 'F'}">
											<a href="${pageContext.request.contextPath}/supplierCompany/loadSupplierCompany?id=${item.id}&s=2" target="dialog" class="btn blue btn-sm"><i class="fa fa-edit"></i>&nbsp;查看详情</a>
										    <a target="ajaxTodo" todoMsg="是否确定删除 ${item.name} 这个供应商？" href="${pageContext.request.contextPath}/supplierCompany/delete?id=${item.id}" class="btn red btn-sm"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
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