<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<link href="${pageContext.request.contextPath}/static/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />
<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			权限管理 <small></small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>
<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">系统管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">权限管理</span></li>
</ul>
<!-- END PAGE BREADCRUMB -->
<form class="form-horizontal" id="pagerForm" method="post" action="${pageContext.request.contextPath}/sysPermission/list" onsubmit="return divSearch(this,'page-content')">
</form>
<div class="row col-md-12">
	<div class="portlet light bordered">
		<div class="portlet-title">
			<div class="caption">
				<i class="icon-list"></i> <span class="caption-subject sbold uppercase">权限树</span>
			</div>
			<div class="actions">
				<a id="permissionCreate" class="btn green btn-sm" href="${pageContext.request.contextPath}/sysPermission/load?parentId=" target="dialog"><i class="fa fa-plus"></i>&nbsp;新增</a>
				<a id="permissionEdit"  class="btn yellow btn-sm" href="${pageContext.request.contextPath}/sysPermission/load?id=" target="dialog"><i class="fa fa-asterisk"></i>&nbsp;修改</a>
				<a id="permissionDelete"  class="btn red btn-sm" todoMsg="确定删除权限？" href="${pageContext.request.contextPath}/sysPermission/delete?id=" target="ajaxTodo"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
			</div>
		</div>
		<div class="portlet-body">
			<div id="permissionTree"></div>

		</div>

	</div>

</div>
<!-- /.row -->

<script src="${pageContext.request.contextPath}/static/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>

<script type="text/javascript">

var createUrl = $("#permissionCreate").attr("href");
var editUrl = $("#permissionEdit").attr("href");
var deleteUrl = $("#permissionDelete").attr("href");
$(document).ready(function(){
	$('#permissionTree').jstree({
		  "core" : {
			    "animation" : 0,
			    "open":-1,
			    "check_callback" : true,
			    "themes" : { "stripes" : true },
			    "data" : {
				      'url' : function (node) {
				        return '${pageContext.request.contextPath}/sysPermission/jsonList';
				      }
			    }
		  },
		  "types" : {
			    "#" : {
			      "max_children" : 1, 
			      "max_depth" : 5, 
			      "valid_children" : ["root"]
			    },
			    "root" : {
			      "valid_children" : ["default"]
			    },
			    "item" : {
			      "valid_children" : ["default"]
				},
			    "default" : {
			    "icon" : "fa fa-cube font-purple icon-lg",
				  "valid_children" : ["default","file"]
			    },
			    "file" : {
			      "valid_children" : []
			    }
		  },
		  "plugins" : ["contextmenu", "dnd", "search","state", "types", "wholerow"]
		})
		.on('changed.jstree', function (e, data) {
			if(data.selected && data.selected.length==1) {
				var id = data.selected;
				$("#permissionCreate").attr("href", createUrl + id);
				$("#permissionEdit").attr("href", editUrl + id);
				$("#permissionDelete").attr("href", deleteUrl + id);
			}
		});
});
</script>
