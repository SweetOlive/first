<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<link href="${pageContext.request.contextPath}/static/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />

<div class="modal-dialog ">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">角色[${sysRole.name}]赋予权限</h4>
		</div>
		<form id="rolePermissionForm" action="${pageContext.request.contextPath}/sysPermission/editRolePermission" method="post" class="form-horizontal" id="form_sample_1"
		onsubmit="return ajaxSubmitCallback(this, dialogAjaxDone)"
		 enctype="multipart/form-data">
			<div class="modal-body">
				<input type="hidden" id="roleId" name="roleId" value="${sysRole.id}">
			    <input type="hidden" id="permissionIds" name="permissionIds" value="">
				<input type="hidden" name="nowId" value="${nowUser.id}">
				<!-- BEGIN FORM-->
				<div class="form-body">
					<div id="permissionTree"></div>
					<!-- END FORM-->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
				<button type="button" onclick="submitForm()" class="btn green">保存</button>
			</div>
		</form>
	</div>
	<!-- /.modal-content -->
</div>
<script src="${pageContext.request.contextPath}/static/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#permissionTree').jstree({
		  "core" : {
			    "animation" : 0,
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
		  "plugins" : ["contextmenu", "dnd", "search","state", "types", "wholerow", "checkbox"]
	})
	.on('ready.jstree', function (e, data) {
		var checkNodelds = new Array();
		<c:forEach var="item" items="${sysPermissionList}">
		checkNodelds.push(${item.id});
		</c:forEach> 
		$('#permissionTree').jstree("uncheck_all");
		$('#permissionTree').jstree("open_all");
		$('#permissionTree').find("li").each(function() {
			for (var i = 0; i < checkNodelds.length; i++) {
				if ($(this).attr("id") == checkNodelds[i]) {  //如果节点的ID等于checkNodeIds[i]，
					if(!$('#permissionTree').jstree("is_parent", $(this))) {
						$('#permissionTree').jstree("check_node", $(this));
					}
				}
			}
		});
		
	});

});

function submitForm(){   
	 var ids = "";
     var nodes = $("#permissionTree").jstree("get_checked",true); //使用get_checked方法 
     $.each(nodes, function(i, n) { 
     	ids += $(n).attr("id")+",";
     }); 
     $("#permissionTree").find(".jstree-undetermined").each(function (i, element) {
    	ids += $(element).closest('.jstree-node').attr("id") + ",";
     });
     ids = ids.substring(0,(ids.length-1));
     $("#permissionIds").attr("value", ids);
     $("#rolePermissionForm").submit();
}

</script>