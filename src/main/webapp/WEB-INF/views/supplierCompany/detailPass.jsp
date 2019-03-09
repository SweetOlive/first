<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog ">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">供应商</h4>
		</div>
		<form id="userForm" action="${pageContext.request.contextPath}/supplierCompany/saveDetail" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
			<div class="modal-body">
				<input type="hidden" name="id" value="${supplierCompany.id}">
				<input type="hidden" name="nowId" value="${nowUser.id}">
				<input type="hidden" name="status" value="P">
				<!-- BEGIN FORM-->
				<div class="form-body">

					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">营业执照</label>
						<div class="fileinput fileinput-new col-md-3" data-provides="fileinput">
							<div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
								<c:choose>
									<c:when test="${not empty supplierCompany.productionCapacity}">
										<img class="" src="${pageContext.request.contextPath}/admin/imgView?path=${supplierCompany.productionCapacity}" alt="" style="width: 150px; height: 150px;">
									</c:when>
									<c:otherwise>
										<img class="" src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>


					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">名称</label>
						<div class="col-md-8">
							<input readonly type="text" class="form-control" placeholder="" value="${supplierCompany.name}">
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">邮箱</label>
						<div class="col-md-8">
							<input readonly type="email" class="form-control" placeholder="" value="${supplierCompany.mail}">
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">联系电话</label>
						<div class="col-md-8">
							<input readonly type="tel" class="form-control" placeholder="" value="${supplierCompany.tel}">
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">信用等级</label>
						<div class="col-md-8">
							<select class="form-control" readonly="">
								<option value="A" <c:if test="${supplierCompany.creditRating eq 'A' }">selected</c:if>>A</option>
								<option value="B" <c:if test="${supplierCompany.creditRating eq 'B' }">selected</c:if>>B</option>
								<option value="C" <c:if test="${supplierCompany.creditRating eq 'C' }">selected</c:if>>C</option>
							</select>
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">详细地址</label>
						<div class="col-md-8">
							<textarea readonly class="form-control" rows="2">${supplierCompany.address}</textarea>
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">介绍</label>
						<div class="col-md-8">
							<textarea readonly class="form-control" rows="3">${supplierCompany.remark}</textarea>
						</div>
					</div>
					<!-- END FORM-->
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
				<c:if test="${not empty supplierCompany.productionCapacity}">
					<a href="${pageContext.request.contextPath}/supplierCompany/downLoad?path=${supplierCompany.productionCapacity}&name=${supplierCompany.name}"  class="btn green-meadow"><i class="fa fa-arrow-down"></i>&nbsp;下载执照</a>
				</c:if>
				<button type="submit" class="btn green">审核通过</button>
			</div>
		</form>
	</div>
	<!-- /.modal-content -->
</div>

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
                    name : {
                        maxlength : 30,
                        required : true,
                        checkName : true
                    },
                    mail : {
                        required : true,
                    },
                    tel : {
                        required : true,
                    },
                    address : {
                        required : true,
                    },
                    creditRating : {
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
                    ajaxSubmitCallback($('#userForm'), myDialogAjaxDone);
                }
            });

    //处理刷新未处理数目
    function myDialogAjaxDone(json){
        dialogAjaxDone(json);
        refreshSideBarRedPointByType("COMPANY_APPROVER_NUM");
    }

    $.validator.addMethod("checkName",function(value,element,params){
        var checkName = /^[ ]*$/;
        return this.optional(element)||(! checkName.test(value));
    },"输入不能为空！");
</script>
