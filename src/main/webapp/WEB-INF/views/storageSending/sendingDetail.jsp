<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog ">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 class="modal-title">发料</h4>
        </div>
        <form id="userForm" action="${pageContext.request.contextPath}/storageSending/saveDetail" method="post" class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
            <div class="modal-body">
                <input type="hidden" name="id" value="${storageSending.id}">
                <input type="hidden" name="nowId" value="${nowUser.id}">
                <input type="hidden" id="operate" name="operate" value="">
                <!-- BEGIN FORM-->
                <div class="form-body">

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
                        <label class="col-md-3 control-label">物资
                        </label>
                        <div class="col-md-8">
                            <select readonly name="goodsId" class="form-control required">
                                <option value="">-请选择物资-</option>
                                <c:forEach items="${priceGoodsContactList}" var="item">
                                    <option value="${item.id}" <c:if test="${storageSending.goodsId eq item.id }">selected</c:if> >${item.name}</option>
                                </c:forEach>
                            </select>
                            <div class="form-control-focus"></div>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group form-md-line-input ">
                        <label class="col-md-3 control-label">接收部门
                        </label>
                        <div class="col-md-8">
                            <select readonly name="departmentId" class="form-control required">
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
                        <label class="col-md-3 control-label">库存数量
                        </label>
                        <div class="col-md-8">
                            <input readonly type="number" class="form-control" placeholder="" value="${priceGoodsContact.count}">
                            <div class="form-control-focus"></div>
                        </div>
                    </div>

                    <div class="form-group form-md-line-input ">
                        <label class="col-md-3 control-label">发料数量
                        </label>
                        <div class="col-md-8">
                            <input readonly type="number" class="form-control" placeholder="" value="${storageSending.number}" name="number">
                            <div class="form-control-focus"></div>
                            <span class="help-block">请输入数字</span>
                        </div>
                    </div>

                    <div class="form-group form-md-line-input ">
                        <label class="col-md-3 control-label">备注
                        </label>
                        <div class="col-md-8">
                            <textarea readonly class="form-control" name="remark" rows="2">${storageIncoming.remark}</textarea>
                            <div class="form-control-focus"></div>
                            <span class="help-block">补充内容</span>
                        </div>
                    </div>
                    <!-- END FORM-->
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn dark btn-outline" data-dismiss="modal">关闭</button>
                <button id="saveUserInfo"   type="submit" class="btn green"  style="display:none">保存</button>
                <c:if test="${storageSending.status eq 'A'}">
                    <a href="javascript:;saveUserInfo('P')" class="btn green button-submit">通过 </a>
                    <a href="javascript:;saveUserInfo('F')" class="btn red button-submit">退回 </a>
                </c:if>
            </div>
        </form>
    </div>
    <!-- /.modal-content -->
</div>
<script type="text/javascript">
    function saveUserInfo(tag){
        $('#operate').val(tag);
        $("#saveUserInfo").trigger("click")
    }
</script>
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
