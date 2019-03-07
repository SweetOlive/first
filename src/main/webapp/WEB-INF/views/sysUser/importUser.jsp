<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog ">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">导入用户</h4>
		</div>
		<form id="userForm" action="${pageContext.request.contextPath}/sysUser/saveImportUser" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
			<input type="hidden" name="nowId" value="${nowUser.id}">
			<div class="modal-body">
				<!-- BEGIN FORM-->
				<div class="form-body">
					<div class="alert alert-danger display-hide">
						<button class="close" data-close="alert"></button>
						You have some form errors. Please check below.
					</div>
					<div class="alert alert-success display-hide">
						<button class="close" data-close="alert"></button>
						Your form validation is successful!
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">Excel文件 <span class="required">*</span>
						</label>
						<div class="col-md-8">
							<input type="file" class="form-control" placeholder=""  name="file" >
							<div class="form-control-focus"></div>
							<span class="help-block">Excel文件</span>
							<span class="help-block"></span>
						</div>
					</div>
					<!-- END FORM-->

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
				<button id="saveUserInfo"   type="submit" class="btn green"  style="display:none">保存</button>
				<a href="javascript:;saveUserInfo(0)" class="btn green button-submit"> 保存 </a>
				<a href="${pageContext.request.contextPath}/static/file/用户导入模板.xlsx" download="用户导入模板.xlsx" class="btn green button-submit">下载模板</a>
			</div>
		</form>
	</div>
	<!-- /.modal-content -->
</div>

<script type="text/javascript">
function saveUserInfo(tag){
	$('#tag').val(tag);
	$("#saveUserInfo").trigger("click")
}
	$('#userForm')
			.validate(
					{
						errorElement : 'span', //default input error message container
						errorClass : 'help-block help-block-error', // default input error message class
						focusInvalid : false, // do not focus the last invalid input
						ignore : "", // validate all fields including form hidden input
						messages : {},
						rules : {
							file : {
								required : true,
								checkPicSize : true
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
	
					$.validator.addMethod("checkPicSize", function(value,element) {
						    if(element.files.length == 0) return true;
						    var fileSize=element.files[0].size;
						    var maxSize = 10*1024*1024;
						    if(fileSize > maxSize){
						        return false;
						    }else{
						        return true;
						    }
						}, "请上传大小在10M以下的文件");
</script>
