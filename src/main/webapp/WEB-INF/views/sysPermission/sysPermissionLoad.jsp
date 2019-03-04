<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">权限</h4>
		</div>
		<form id="pojoForm" action="${pageContext.request.contextPath}/sysPermission/save" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
			<div class="modal-body">
				<input type="hidden"  name="nowId" value="${nowUser.id}">
			<input type="hidden" id="id" name="id" value="${sysPermission.id}">
			<input type="hidden" id="parentId" name="parentId" value="${parentSysPermission.id}">
				<!-- BEGIN FORM-->
				<div class="form-body">
					<div class="row">
						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">父权限
							</label>
							<div class="col-md-8">
							<c:choose>
								<c:when test="${parentSysPermission.id == -1}">
									<input type="text" value="System management"class="form-control" disabled="disabled"/>
								</c:when>
								<c:otherwise>
									<input type="text" value="${parentSysPermission.name}"class="form-control" disabled="disabled"/>
								</c:otherwise>
							</c:choose>
								
								<div class="form-control-focus"></div>
								<span class="help-block"></span>
							</div>
						</div>
						
						
						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">权限名 <span class="required">*</span>
							</label>
							<div class="col-md-8">
								<input type="text" class="form-control required" placeholder="" value="${sysPermission.name}" name="name">
								<div class="form-control-focus"></div>
								<span class="help-block">权限名</span>
							</div>
						</div>
						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">CODE<span class="required">*</span>
							</label>
							<div class="col-md-8">
								<input type="text" class="form-control required" placeholder="" value="${sysPermission.code}" name="code">
								<div class="form-control-focus"></div>
								<span class="help-block">以'P_'开头</span>
							</div>
						</div>

						<%--<div class="form-group form-md-line-input">--%>
							<%--<label class="col-md-3 control-label">Links--%>
							<%--</label>--%>
							<%--<div class="col-md-8">--%>
								<%--<textarea class="form-control" name="links" rows="3">${sysPermission.links}</textarea>--%>
								<%--<div class="form-control-focus"></div>--%>
								<%--<span class="help-block">拦截的API</span>--%>
							<%--</div>--%>
						<%--</div>--%>
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label">介绍
							</label>
							<div class="col-md-8">
								<textarea class="form-control" name="remark" rows="3">${sysPermission.remark}</textarea>
								<div class="form-control-focus"></div>
								<span class="help-block">权限介绍</span>
							</div>
						</div>

					</div>

					<!-- END FORM-->

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

<script type="text/javascript">
	$('#pojoForm')
			.validate(
					{
						errorElement : 'span', //default input error message container
						errorClass : 'help-block help-block-error', // default input error message class
						focusInvalid : false, // do not focus the last invalid input
						ignore : "", // validate all fields including form hidden input
						messages : {},
						rules : {
							name : {
								required : true,
								checkName : true
							},
							code : {
								required : true,
							}
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
							ajaxSubmitCallback($('#pojoForm'), dialogAjaxDone);
						}
					});
	$.validator.addMethod("checkName",function(value,element,params){
		var checkName = /^[ ]*$/;
		return this.optional(element)||(! checkName.test(value));
	},"输入不能为空！");
</script>

