<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog ">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">询价单</h4>
		</div>
		<form id="userForm" action="${pageContext.request.contextPath}/purchaseInquiry/save" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
			<div class="modal-body">
				<input type="hidden" name="id" value="${purchaseInquiry.id}">
				<input type="hidden" name="nowId" value="${nowUser.id}">
				<!-- BEGIN FORM-->
				<div class="form-body">
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">供应商
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<select name="companyId" class="form-control required">
								<option value="">-请选择供应商-</option>
								<c:forEach items="${supplierCompanyList}" var="item">
									<option value="${item.id}" <c:if test="${purchaseInquiry.companyId eq item.id }">selected</c:if> >${item.name}</option>
								</c:forEach>
							</select>
							<div class="form-control-focus"></div>
							<span class="help-block"></span>
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">物资
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<select name="goodsId" class="form-control required">
								<option value="">-请选择物资-</option>
								<c:forEach items="${priceGoodsContactList}" var="item">
									<option value="${item.id }" <c:if test="${purchaseInquiry.goodsId eq item.id }">selected</c:if> >${item.name }</option>
								</c:forEach>
							</select>
							<div class="form-control-focus"></div>
							<span class="help-block"></span>
						</div>
					</div>

					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">价格
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<input type="text" class="form-control" placeholder="" value="${purchaseInquiry.price}" name="price">
							<div class="form-control-focus"></div>
							<span class="help-block">请填写数字</span>
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">数量
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<input type="number" class="form-control" placeholder="" value="${purchaseInquiry.number}" name="number">
							<div class="form-control-focus"></div>
							<span class="help-block">请填写数字</span>
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">发货地址
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<textarea class="form-control" name="address" rows="2">${purchaseInquiry.address}</textarea>
							<div class="form-control-focus"></div>
							<span class="help-block">请填写详细的发货地址</span>
						</div>
					</div>
					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">结算方式
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<select class="form-control" name="paied">
								<option value="">--请选择结算方式--</option>
								<option value="A" <c:if test="${purchaseInquiry.paied eq 'A' }">selected</c:if>>现金</option>
								<option value="B" <c:if test="${purchaseInquiry.paied eq 'B' }">selected</c:if>>微信</option>
								<option value="C" <c:if test="${purchaseInquiry.paied eq 'C' }">selected</c:if>>支付宝</option>
								<option value="D" <c:if test="${purchaseInquiry.paied eq 'D' }">selected</c:if>>网银</option>
							</select>
						</div>
					</div>

					<div class="form-group form-md-line-input ">
						   <label class="col-md-3 control-label" >选择日期
							   <span class="required">*</span>
							</label>
							<div class="col-md-8">
								<div class="input-append  date form_startTime">
		                               <div class="col-xs-11">
		                               	<input name="arriveTime" type="text" class="form-control" readonly value="<fmt:formatDate value="${purchaseInquiry.arrivetime}" pattern="yyyy-MM-dd"/>">
		                               </div>
		                               <span class="add-on" style="position: relative;padding-top:40px;">
		                                   <i class="fa fa-calendar"></i>
		                               </span>
		                           </div>
							</div>
						</div>

					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">其他
						</label>
						<div class="col-md-8">
							<textarea class="form-control" name="remark" rows="3">${purchaseInquiry.remark}</textarea>
							<div class="form-control-focus"></div>
							<span class="help-block">其他</span>
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
	$('#userForm')
			.validate(
					{
						errorElement : 'span', //default input error message container
						errorClass : 'help-block help-block-error', // default input error message class
						focusInvalid : false, // do not focus the last invalid input
						ignore : "", // validate all fields including form hidden input
						messages : {},
						rules : {
                            goodsId : {
								required : true,
							},
                            companyId : {
                                required : true,
                            },
                            number : {
                                required : true,
                            },
                            price : {
                                required : true,
                            },
                            arriveTime : {
                                required : true,
                            },
                            address : {
                                required : true,
                            },
                            paied : {
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
							ajaxSubmitCallback($('#userForm'), dialogAjaxDone);
						}
					});
	$.validator.addMethod("checkName",function(value,element,params){
		var checkName = /^[ ]*$/;
		return this.optional(element)||(! checkName.test(value));
	},"输入不能为空！");
</script>

<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/css/components.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/css/components.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/layouts/layout4/css/custom.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/static/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>

<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />

<script src="${pageContext.request.contextPath}/static/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>

<script type="text/javascript">
$(".form_startTime").datepicker({
format: "yyyy-mm-dd",
autoclose: true,
todayBtn: true,
language:'zh-CN',
pickerPosition:"bottom-right"
});
</script>
