<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">铁路物资</h4>
		</div>
		<form id="pojoForm" action="${pageContext.request.contextPath}/priceGoodsCatalog/goodsSave" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
			<div class="modal-body">
				<input type="hidden"  name="nowId" value="${nowUser.id}">
				<input type="hidden" id="id" name="id" value="${priceGoodsContact.id}">
				<!-- BEGIN FORM-->
				<div class="form-body">
					<div class="row">
						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">父级
							</label>
							<div class="col-md-8">
								<c:choose>
									<c:when test="${parentPriceGoodsContact.id == 1 && priceGoodsContact==null}">
										<input type="text" value="无"class="form-control" disabled="disabled"/>
									</c:when>
									<c:otherwise>
										<input type="text" value="${parentPriceGoodsContact.name}"class="form-control" disabled="disabled"/>
									</c:otherwise>
								</c:choose>
								<div class="form-control-focus"></div>
								<span class="help-block"></span>
							</div>
						</div>

						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">物资图片 <span class="required"></span></label>
							<div class="fileinput fileinput-new col-md-3" data-provides="fileinput">
								<div class="fileinput-new thumbnail" style="width: 150px; height: 150px;">
									<c:choose>
										<c:when test="${not empty priceGoodsContact.imgPath}">
											<img class="" src="${pageContext.request.contextPath}/admin/imgView?path=${priceGoodsContact.imgPath}" alt="" style="width: 150px; height: 150px;">
										</c:when>
										<c:otherwise>
											<img class="" src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>

						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">物资名
							</label>
							<div class="col-md-8">
								<input readonly type="text" class="form-control required" placeholder="" value="${priceGoodsContact.name}" name="name">
								<div class="form-control-focus"></div>
							</div>
						</div>

						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">编号
							</label>
							<div class="col-md-8">
								<input readonly type="text" class="form-control required" placeholder="" value="${priceGoodsContact.code}" name="name">
								<div class="form-control-focus"></div>
							</div>
						</div>

						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">库存
							</label>
							<div class="col-md-8">
								<input readonly type="text" class="form-control required" placeholder="" value="${priceGoodsContact.count}" name="name">
								<div class="form-control-focus"></div>
							</div>
						</div>
						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">物资尺寸
							</label>
							<div class="col-md-8">
								<input readonly type="text" class="form-control required" placeholder="" value="${priceGoodsContact.size}" name="size">
								<div class="form-control-focus"></div>
							</div>
						</div>
						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">计量单位
							</label>
							<div class="col-md-8">
								<input readonly type="text" class="form-control required" placeholder="" value="${priceGoodsContact.unit}" name="unit">
								<div class="form-control-focus"></div>
							</div>
						</div>
						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">价格
							</label>
							<div class="col-md-8">
								<input readonly type="text" class="form-control required" placeholder="" value="${priceGoodsContact.price}" name="name">
								<div class="form-control-focus"></div>
							</div>
						</div>

						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label">描述
							</label>
							<div class="col-md-8">
								<textarea readonly class="form-control" name="introduce" rows="3">${priceGoodsContact.introduce}</textarea>
								<div class="form-control-focus"></div>
							</div>
						</div>

					</div>

					<!-- END FORM-->

				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
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
							level : {
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

