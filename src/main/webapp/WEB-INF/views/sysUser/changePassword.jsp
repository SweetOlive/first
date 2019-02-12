<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<div class="modal-dialog ">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true"></button>
			<h4 class="modal-title">修改密码</h4>
		</div>
		<form id = "changePasswordForm" action="${pageContext.request.contextPath}/login/changePassword"  method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data" >
			<input type="hidden" name="id" value="${nowUser.id}">
			<div class="modal-body">
			    <div class="alert alert-danger display-hide">
						<button class="close" data-close="alert"></button>
						You have some form errors. Please check below.
				</div>
				<div class="alert alert-success display-hide">
					<button class="close" data-close="alert"></button>
					Your form validation is successful!
				</div>
				<div class="form-group form-md-line-input">
					<label class="col-md-3 control-label">原密码<span class="required">*</span></label>
					<div class="col-md-8">
						<input type="text" id="oldPassword" onfocus="this.type='password'" class="form-control" placeholder=""
							   name="oldPassword" autocomplete="off">
						<div class="form-control-focus"></div>
						<span class="help-block">请输入原用户密码</span>
					</div>
				</div>
				<div class="form-group form-md-line-input">
					<label class="col-md-3 control-label">新密码
						<span class="required">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" onfocus="this.type='password'" id="password"
							class="form-control" placeholder="" name="password"
							autocomplete="off">
						<div class="form-control-focus"></div>
						<span class="help-block">请输入用户密码</span>
					</div>
				</div>
				<div class="form-group form-md-line-input">
					<label class="col-md-3 control-label">确认密码
						<span class="required">*</span>
					</label>
					<div class="col-md-8">
						<input type="text" onfocus="this.type='password'"
							class="form-control" placeholder="" name="repassword"
							autocomplete="off" equalto="#password">
						<div class="form-control-focus"></div>
						<span class="help-block">请再次输入用户密码</span>
					</div>
				</div>
			</div>
		<div class="modal-footer">
				<button type="button" class="btn dark btn-outline"
					data-dismiss="modal">关闭</button>
				<button type="submit" class="btn green">保存</button>
			</div>
		</form>
	</div>
	<!-- /.modal-content -->
</div>


<script type="text/javascript">
$('#changePasswordForm').validate({
    errorElement: 'span', //default input error message container
    errorClass: 'help-block help-block-error', // default input error message class
    focusInvalid: false, // do not focus the last invalid input
    ignore: "", // validate all fields including form hidden input
    messages: {
    },
    rules: {
    	oldPassword: {
            required: true
        },
        password: {
            required: true,
        },
        repassword: {
            required: true,
        }
    },

    invalidHandler: function(event, validator) { //display error alert on form submit              
/*         success1.hide();
        error1.show();
        App.scrollTo(error1, -200); */
    },

    errorPlacement: function(error, element) {
        if (element.is(':checkbox')) {
            error.insertAfter(element.closest(".md-checkbox-list, .md-checkbox-inline, .checkbox-list, .checkbox-inline"));
        } else if (element.is(':radio')) {
            error.insertAfter(element.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
        } else {
            error.insertAfter(element); // for other inputs, just perform default behavior
        }
    },

    highlight: function(element) { // hightlight error inputs
        $(element)
            .closest('.form-group').addClass('has-error'); // set error class to the control group
    },

    unhighlight: function(element) { // revert the change done by hightlight
        $(element)
            .closest('.form-group').removeClass('has-error'); // set error class to the control group
    },

    success: function(label) {
        label
            .closest('.form-group').removeClass('has-error'); // set success class to the control group
    },

    submitHandler: function(form) {
    	ajaxSubmitCallback($('#changePasswordForm'), dialogAjaxDone);
    }
});
</script>