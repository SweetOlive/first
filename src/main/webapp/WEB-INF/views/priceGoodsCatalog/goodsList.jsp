<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<link
	href="${pageContext.request.contextPath}/static/global/plugins/jstree/dist/themes/default/style.min.css"
	rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			${priceGoodsCatalog.name} 管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">价格目录管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">物资目录管理</span></li>
	
</ul>
<!-- END PAGE BREADCRUMB -->
<form class="form-horizontal" id="pagerForm" method="post" action="${pageContext.request.contextPath}/priceGoodsCatalog/loadCatalog?id=${priceGoodsCatalog.id}" onsubmit="return divSearch(this,'page-content')">
</form>
<div class="">
		<div class="row col-md-12">
			<div class="portlet light bordered">
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-list"></i> <span
							class="caption-subject sbold uppercase">${priceGoodsCatalog.name} 所有物资</span>
					</div>
					<security:authorize ifAnyGranted="P_DEPARTMENT_MANAGE">
					<div class="actions">
						<%--<a id="seaDepartmentAddUser" href="${pageContext.request.contextPath}/admin/seaDepartment/loadDepartmentUser?id=" target="ajax" class="btn blue btn-sm" rel="page-content"><i class="fa fa-edit"></i>&nbsp;分配用户</a>--%>
						<a id="seaDepartmentCreate" class="btn green btn-sm"
							href="${pageContext.request.contextPath}/priceGoodsCatalog/goodsLoad?parentId="
							target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a> 
						<a
							id="seaDepartmentEdit" class="btn yellow btn-sm"
							href="${pageContext.request.contextPath}/priceGoodsCatalog/goodsLoad?id="
							target="dialog"><i class="fa fa-asterisk"></i>&nbsp;修改</a> 
						<a
							id="seaDepartmentDelete" class="btn red btn-sm" todoMsg="确定删除物资？"
							href="${pageContext.request.contextPath}/priceGoodsCatalog/goodsDelete?id="
							target="ajaxTodo"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
					</div>
					</security:authorize>
				</div>


				<div class="portlet-body">
					<div id="seaDepartmentTree"></div>

				</div>

			</div>

		</div>
</div>

<script src="${pageContext.request.contextPath}/static/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>

<script type="text/javascript">
    var addUserUrl = $("#seaDepartmentAddUser").attr("href");
	var createUrl = $("#seaDepartmentCreate").attr("href");
	var editUrl = $("#seaDepartmentEdit").attr("href");
	var deleteUrl = $("#seaDepartmentDelete").attr("href");
	$(document)
			.ready(
					function() {
						$('#seaDepartmentTree')
								.jstree(
										{
											"core" : {
												"animation" : 0,
												"open" : -1,
												"check_callback" : true,
												"themes" : {
													"stripes" : true
												},
												"data" : {
													'url' : function(node) {
														return '${pageContext.request.contextPath}/priceGoodsCatalog/jsonList?id=${priceGoodsCatalog.id}';
													}
												}
											},
											"types" : {
												"#" : {
													"max_children" : 1,
													"max_depth" : 5,
													"valid_children" : [ "root" ]
												},
												"root" : {
													"valid_children" : [ "default" ]
												},
												"item" : {
													"valid_children" : [ "default" ]
												},
												"default" : {
													"icon" : "fa fa-cube font-purple icon-lg",
													"valid_children" : [
															"default", "file" ]
												},
												"file" : {
													"valid_children" : []
												}
											},
											"plugins" : [ "contextmenu", "dnd",
													"search", "state", "types",
													"wholerow" ]
										})
								.on(
										'changed.jstree',
										function(e, data) {
											if (data.selected && data.selected.length == 1) {
												var id = data.selected;
												$("#seaDepartmentCreate").attr(
														"href", createUrl + id);
												$("#seaDepartmentEdit").attr(
														"href", editUrl + id);
												$("#seaDepartmentDelete").attr(
														"href", deleteUrl + id);
												$("#seaDepartmentAddUser").attr(
														"href", addUserUrl + id);
											}
										});
					});
</script>