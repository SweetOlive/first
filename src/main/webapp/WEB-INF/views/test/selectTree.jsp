<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/global/plugins/nui4m/nui.selectTree.js"></script>
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet">
<style>
.dropdown-toggle{
    border: none;
    border-bottom: 1px solid #c2cad8;
    padding-left: 0;
}
</style>
<div class="modal-dialog ">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">部门职位</h4>
		</div>
		<form id="userForm" action="${pageContext.request.contextPath}/admin/seaUserDepartment/save" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
			<div class="modal-body">
				<div class="form-body">
					<div class="form-group form-md-line-input">
						<input type="hidden" id="userId" name="userId" value="${userId}">
						<label class="col-md-3 control-label" for="form_control_1">部门<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<select class="form-control selectTree" id="departmentId" name="departmentId" dataUrl="${pageContext.request.contextPath}/SysDepartment/departmentSelectTree"
									selectId="${seaUserDepartmentDTO.departmentId }">
							</select>
							<div class="form-control-focus"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
				<button type="submit" class="btn green">保存</button>
			</div>
		</form>
	</div>
	<!-- /.modal-content -->
</div>
<script src="${pageContext.request.contextPath}/static/pages/scripts/components-bootstrap-select.js" type="text/javascript"></script>

<script type="text/javascript">
	$('#userForm')
			.validate(
					{
						errorElement : 'span', //default input error message container
						errorClass : 'help-block help-block-error', // default input error message class
						focusInvalid : false, // do not focus the last invalid input
						ignore : "", // validate all fields including form hidden input
						messages : {},
						rules : {
							departmentId : {
								required : true,
								
							},
							userId : {
								required : true
								
							},
						},

						invalidHandler : function(event, validator) { //display error alert on form submit              
							/*         success1.hide();
							 error1.show();
							 App.scrollTo(error1, -200); */

						},

						errorPlacement : function(error, element) {
							if (element.is(':checkbox')) {
								error
										.insertAfter(element
												.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
							} else if (element.is(':radio')) {
								error
										.insertAfter(element
												.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
							} else {
								error.insertAfter(element); // for other inputs, just perform default behavior
							}
						},

						highlight : function(element) { // hightlight error inputs
							$(element).closest('.form-group').addClass(
									'has-error'); // set error class to the control group
						},

						unhighlight : function(element) { // revert the change done by hightlight
							$(element).closest('.form-group').removeClass(
									'has-error'); // set error class to the control group
						},

						success : function(label) {
							label.closest('.form-group').removeClass(
									'has-error'); // set success class to the control group
						},

						submitHandler : function(form) {
							ajaxSubmitCallback($('#userForm'), dialogAjaxDone);
						}
					});
	
	$( "#departmentId" ).selectTree();
</script>
