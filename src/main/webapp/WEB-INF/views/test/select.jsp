<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
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
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true"></button>
			<h4 class="modal-title">任教老师</h4>
		</div>
		<form id="userForm"
			action="${pageContext.request.contextPath}/admin/seaClazzTeacher/save"
			method="post" class="form-horizontal" id="form_sample_1"
			enctype="multipart/form-data">
			<div class="modal-body">
				<input type="hidden" id="id" name="id"
					value="${seaClazzTeacherDTO.id}"
					>

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

					<div class="form-group form-md-line-input">
						<label class="col-md-3 control-label" for="form_control_1">教师<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<div class="btn-group bootstrap-select bs-select form-control">
                                  <select title="输入人员名称或工号"  data-selectNameUrl="${pageContext.request.contextPath}/admin/user/getUserList"  id="select-manager" name="userId"  class="bs-select form-control" data-live-search="true" data-size="8" tabindex="-98">
                                 	<c:if test="${not empty  seaClazzTeacherDTO}"><option value="${seaClazzTeacherDTO.userId}" selected>${seaClazzTeacherDTO.realName}(${seaClazzTeacherDTO.staffNumber})</option></c:if>
                                 </select>
                              </div>
							<div class="form-control-focus"></div>
						</div>
					</div>


					<div id="gradeSelect" class="form-group form-md-line-input">
						<label class="col-md-3 control-label" for="form_control_1">年级
							<span class="required">*</span>
						</label>
						<div class="col-md-8">
							<select id="gradeSelect" name="gradeId"
								class="form-control required">
								<c:forEach var="seaGradeDTO" items="${seaGradeDTOList}">
									<option value="${seaGradeDTO.id}"
										<c:if test="${seaClazzTeacherDTO.gradeId eq seaGradeDTO.id }">selected</c:if>>
										
										${gradeNameMap[seaGradeDTO.id]}
										(${seaGradeDTO.division}届)
										
										</option>
								</c:forEach>
							</select>
							<div class="form-control-focus"></div>
						</div>
					</div>

					<div id="calzzSelect" class="form-group form-md-line-input">
						<label class="col-md-3 control-label" for="form_control_1">班级
							<span class="required">*</span>
						</label>
						<input type="hidden" id="clazzOldId" name="clazzOldId"value="${seaClazzTeacherDTO.clazzId}">
						<div class="col-md-8">
							<select id="clazzSelect" name="clazzId"
								class="form-control required">
								<!--  
								<c:forEach var="seaClazzDTO" items="${seaClazzDTOList}">
									<option value="${seaGradeDTO.id}"
										<c:if test="${seaClazzTeacherDTO.clazzId eq seaClazzDTO.id }">selected</c:if>>${seaClazzDTO.name}</option>
								</c:forEach>
								-->
							</select>
							<div class="form-control-focus"></div>
						</div>
					</div>

					<div id="calzzSelect" class="form-group form-md-line-input">
						<label class="col-md-3 control-label" for="form_control_1">科目
							<span class="required">*</span>
						</label>
						<input type="hidden" id="subjectOldId" name="subjectOldId"value="${seaClazzTeacherDTO.subjectId}">
						<div class="col-md-8">
							<select id="subjectSelect" name="subjectId"
								class="form-control required">
								<!--  
								<c:forEach var="seaSubjectDTO" items="${seaSubjectDTOList}">
									<option value="${seaSubjectDTO.id}"
										<c:if test="${seaClazzTeacherDTO.subjectId eq seaSubjectDTO.id }">selected</c:if>>${seaSubjectDTO.subjectName}</option>
								</c:forEach>
								--> 
							</select>
							<div class="form-control-focus"></div>
						</div>
					</div>


					<div class="form-group form-md-line-input ">
						<label class="col-md-3 control-label" for="form_control_1">描述
							<span class="required"></span>
						</label>
						<div class="col-md-8">
							<textarea class="form-control" placeholder="" name="description"
								rows="3">${seaPositionDTO.description}</textarea>
							<input type="hidden" id="createUserId" name="createUserId"
								value="${seaPositionDTO.createUserId}" />
							<div class="form-control-focus"></div>
							<span class="help-block"></span>
						</div>
					</div>


					<!-- END FORM-->

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

<script
	src="${pageContext.request.contextPath}/static/global/plugins/arttemplate/art-template-web.js"
	type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/static/pages/scripts/components-bootstrap-select.js" type="text/javascript"></script>

<script id="clazzLoad-template" type="text/html">
	{{each items item index}}
	<option value="{{item.id}}"  {{if item.id ==clazzOldId}}selected{{/if}}>{{item.name}}</option>
	{{/each}}
</script>
<script id="subject-template" type="text/html">
	{{each items item index}}
	<option value="{{item.id}}" {{if item.id ==subjectOldId}}selected{{/if}}>
{{item.subjectName}}{{if item.stage ==1}}(小学){{else if item.stage ==2}}(初中){{else if item.stage ==3}}(高中){{/if}}</option>
	{{/each}}
</script>


<script type="text/javascript">
//键入字符触发事件:动态获得后台传入select选项数据 
//请求的url
var selectNameUrl = $("#select-manager").attr("data-selectNameUrl");              
//选择得到搜索栏input，松开按键后触发事件
$("#select-manager").prev().find('.bs-searchbox').find('input').keyup(function () {                   
 //键入的值
 var inputManagerName =$('#userForm .open input').val();  //判定键入的值不为空，才调用ajax
 if(inputManagerName != ''){
     $.ajax({
           type: 'post',
           url: selectNameUrl,
           data: {
          	 name:inputManagerName
           },
           dataType: "Json",
           success : function(data) {
          	 //清除select标签下旧的option签，根据新获得的数据重新添加option标签
             	$("#select-manager").empty();                         
               if (data.items != null) {               
                       $.each(data.items, function (i,Selectmanager) {
                           $("#select-manager").append(" <option value=\"" + Selectmanager.id + "\">" + Selectmanager.realName + "（"+Selectmanager.staffNumber+"）</option>");
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


	function change(gradeId){
		$.ajax({
			type : 'post',
			async: false, //ajax变为同步
			url : '${pageContext.request.contextPath}/admin/seaClazz/findByGradeId',
			dataType : 'json',
			data : {					
				gradeId : gradeId
			},
			success : function(json) {
				var clazzOldId=$('#clazzOldId').val();
				console.log('subjectOldId ' + subjectOldId);
				var html = template('clazzLoad-template', {
				    items: json,
				    clazzOldId:clazzOldId
				});
				document.getElementById('clazzSelect').innerHTML = html;
			},
			error : function() {
				if (json != null) {
						bootbox.alert(json.msg);
					}
				}
		});
		$.ajax({
			type : 'post',
			async: false, //ajax变为同步
			url : '${pageContext.request.contextPath}/admin/seaSubject/findByGradeId',
			dataType : 'json',
			data : {					
				gradeId : gradeId
			},
			success : function(json) {
				var subjectOldId=$('#subjectOldId').val();
				console.log('subjectOldId ' + subjectOldId);
				var html = template('subject-template', {
				    items: json,
				    subjectOldId:subjectOldId
				});
				document.getElementById('subjectSelect').innerHTML = html;
			},
			error : function() {
				if (json != null) {
						bootbox.alert(json.msg);
					}
				}
		});
	};
	
	$(document).ready(function(){
		var gradeId=$('#gradeSelect option:selected').val();
		change(gradeId);
		$("#gradeSelect").change(function(){
			var gradeId=$('#gradeSelect option:selected').val();
			change(gradeId);
		});
		

	});

	$('#userForm')
			.validate(
					{
						errorElement : 'span', //default input error message container
						errorClass : 'help-block help-block-error', // default input error message class
						focusInvalid : false, // do not focus the last invalid input
						ignore : "", // validate all fields including form hidden input
						messages : {		
							
						},
						rules : {

							name : {
								minlength : 2,
								required : true
							},
							type : {
								required : true,
							},
							userId: {
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
	
	
	
</script>
