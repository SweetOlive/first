<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog ">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">发料</h4>
		</div>
		<form id="userForm" action="${pageContext.request.contextPath}/storageSending/save" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
			<div class="modal-body">
				<input type="hidden" name="id" value="${storageSending.id}">
				<input type="hidden" name="nowId" value="${nowUser.id}">
				<!-- BEGIN FORM-->
				<div class="form-body">
					<%--<div class="form-group form-md-line-input ">--%>
						<%--<label class="col-md-3 control-label">物资--%>
							<%--<span class="required">*</span>--%>
						<%--</label>--%>
						<%--<div class="col-md-8">--%>
							<%--<select name="goodsId" class="form-control required">--%>
								<%--<option value="">-请选择物资-</option>--%>
								<%--<c:forEach items="${priceGoodsContactList}" var="item">--%>
									<%--<option value="${item.id}" <c:if test="${storageSending.goodsId eq item.id }">selected</c:if> >${item.name}</option>--%>
								<%--</c:forEach>--%>
							<%--</select>--%>
							<%--<div class="form-control-focus"></div>--%>
							<%--<span class="help-block"></span>--%>
						<%--</div>--%>
					<%--</div>--%>

						<div class="form-group form-md-line-input ">
							<label class="col-md-3 control-label">物资目录
								<span class="required">*</span>
							</label>
							<div class="col-md-8">
								<select id="parentSelect" name="catalogId" class="form-control required">
									<option value="">-请物资目录-</option>
									<c:forEach items="${priceGoodsCatalogList}" var="item">
										<option value="${item.id}" <c:if test="${item.id eq priceGoodsContact.catalogId }">selected</c:if> >${item.name}</option>
									</c:forEach>
								</select>
								<div class="form-control-focus"></div>
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group form-md-line-input">
							<label class="col-md-3 control-label" for="form_control_1">物资<span class="required">*</span>
							</label>
							<div class="col-md-8">
								<div class="btn-group bootstrap-select bs-select form-control">
									<select title="输入物资名称或编号"  data-selectNameUrl="${pageContext.request.contextPath}/purchaseInquiry/getGoodsList"  id="select-manager" name="goodsId"  class="bs-select form-control" data-live-search="true" data-size="8" tabindex="-98">
										<c:if test="${not empty  priceGoodsContact}"><option value="${priceGoodsContact.id}" selected>${priceGoodsContact.name}(${priceGoodsContact.code})</option></c:if>
									</select>
								</div>
								<div class="form-control-focus"></div>
							</div>
						</div>

					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">接收部门
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<select name="departmentId" class="form-control required">
								<option value="">-请选择接收部门-</option>
								<c:forEach items="${sysDepartmentList}" var="item">
									<option value="${item.id}" <c:if test="${storageSending.departmentId eq item.id }">selected</c:if> >${item.name}</option>
								</c:forEach>
							</select>
							<div class="form-control-focus"></div>
							<span class="help-block"></span>
						</div>
					</div>

					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">发料数量
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<input type="number" class="form-control" placeholder="" value="${storageSending.number}" name="number">
							<div class="form-control-focus"></div>
							<span class="help-block">请输入数字</span>
						</div>
					</div>

					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label">备注
						</label>
						<div class="col-md-8">
							<textarea class="form-control" name="remark" rows="2">${storageIncoming.remark}</textarea>
							<div class="form-control-focus"></div>
							<span class="help-block">补充内容</span>
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

<script src="${pageContext.request.contextPath}/static/global/plugins/arttemplate/art-template-web.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/pages/scripts/components-bootstrap-select.js" type="text/javascript"></script>

<script type="text/javascript">
    //键入字符触发事件:动态获得后台传入select选项数据
    //请求的url
    var selectNameUrl = $("#select-manager").attr("data-selectNameUrl");
    //选择得到搜索栏input，松开按键后触发事件
    $("#select-manager").prev().find('.bs-searchbox').find('input').keyup(function () {
        //键入的值
        var inputManagerName =$('#userForm .open input').val();  //判定键入的值不为空，才调用ajax
        var parentId=$('#parentSelect option:selected').val();
        if (parentId == ''){
            alert("请选择物资目录！");
        }
        if(inputManagerName != ''){
            $.ajax({
                type: 'post',
                url: selectNameUrl,
                data: {
                    name:inputManagerName,
                    id: parentId
                },
                dataType: "json",
                success : function(data) {
                    //清除select标签下旧的option签，根据新获得的数据重新添加option标签
                    $("#select-manager").empty();
                    if (data.items != null) {
                        $.each(data.items, function (i,Selectmanager) {
                            $("#select-manager").append(" <option value=\"" + Selectmanager.id + "\">" + Selectmanager.name + "（"+Selectmanager.code+"）</option>");
                        })                                    //必不可少的刷新
                        $("#select-manager").selectpicker('refresh');
                    }
                },
                error : function() {
                    if (json != null) {
                        bootbox.alert(json.msg);
                    }
                }
            })
        }else
        //如果输入的字符为空，清除之前option标签
            $("#select-manager").empty();
        $("#select-manager").selectpicker('refresh');
    });

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
                            departmentId : {
                                required : true,
                            },
                            number : {
                                required : true,
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
	$.validator.addMethod("checkName",function(value,element,params){
		var checkName = /^[ ]*$/;
		return this.optional(element)||(! checkName.test(value));
	},"输入不能为空！");
</script>
