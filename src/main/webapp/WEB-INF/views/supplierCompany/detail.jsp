<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/3/8
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<div class="modal-dialog ">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
            <h4 class="modal-title">供应商</h4>
        </div>
        <form class="form-horizontal" id="form_sample_1" enctype="multipart/form-data">
            <div class="modal-body">
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
            </div>
        </form>
    </div>
    <!-- /.modal-content -->
</div>
</script>
