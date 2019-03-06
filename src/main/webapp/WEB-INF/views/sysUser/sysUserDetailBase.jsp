<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="col-md-12">
		<div class="portlet light bordered">
			<div class="portlet-title tabbable-line">
				<div class="caption caption-md">
					<i class="icon-globe theme-font hide"></i> 
					<span class="caption-subject font-blue-madison bold uppercase">基础信息</span>
				</div>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab_1_1" data-toggle="tab"
						aria-expanded="true">基础信息</a></li>
					<li class=""><a href="#tab_1_2" data-toggle="tab"
						aria-expanded="false">修改头像</a></li>
				</ul>
			</div>
			<div class="portlet-body">
				<div class="tab-content">
					<!-- PERSONAL INFO TAB id="userForm" -->
					<div class="tab-pane active" id="tab_1_1">
						<form role="form" id="scUserUpdateForm"
							action="${pageContext.request.contextPath}/sysUser/saveDetail"
							method="post" class="form-horizontal"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="${sysUser.id}">
							<input type="hidden" name="nowId" value="${nowUser.id}">
									<div class="form-group form-md-line-input">
									   <div class="col-md-6 controls">
											<label class="col-md-3 controls">用户名:</label>
											<div class="col-md-8">
											  <input type="text" name="name" value="${sysUser.name}" class="form-control" />
											  <div class="form-control-focus"></div>
											  <span class="help-block">用户姓名</span>
											</div>
									   </div>
										<div class="col-md-6 controls">
											<label class="col-md-3 controls">电话:</label>
											<div class="col-md-8">
												<input type="tel" name="tel" value="${sysUser.tel}" class="form-control" />
												<div class="form-control-focus"></div>
												<span class="help-block">联系电话</span>
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
									    <div class="col-md-6 controls">
											<label class="col-md-3 controls">出生日期:</label>
											<div class="col-md-8">
											<input type="text" name="birthdayString"  id="birthday" value="${birthdayString}" class="form-control" />
											<div class="form-control-focus"></div>
											<span class="help-block">出生日期</span>
											</div>
										</div>
										
										<div class="col-md-6 controls">
											<label class="col-md-3 controls">性别:<span class="required"></span></label>
									        <div class="col-md-8">
										    <div class="md-radio-inline">
											<div class="md-radio">
												<input type="radio" id="radio15" name="gender" value="1" class="md-radiobtn"
													<c:if test="${sysUser.sex eq 'M' }">checked</c:if>>
												<label for="radio15"> <span class="inc"></span> <span class="check"></span> <span class="box"></span>男</label>
											</div>
											<div class="md-radio">
												<input type="radio" id="radio16" name="gender" value="0" class="md-radiobtn"
													<c:if test="${sysUser.sex eq 'N' }">checked</c:if>>
												<label for="radio16"> <span class="inc"></span> <span class="check"></span> <span class="box"></span>女 </label>
											</div>
										    </div>
									        </div>
							      	    </div>
									</div>
									<div class="form-group form-md-line-input">
										<div class="col-md-6 controls">
											<label class="col-md-3 controls" for="">证件类型:</label>
											  <div class="col-md-8">
											  <select id="idCardType" name="idCardType" class="form-control required">
												  <option value="">--请选择证件类型--</option>
								                <option value="1" <c:if test="${sysUser.idCardType eq '1' }">selected</c:if>>居民身份证</option>
								                <option value="2" <c:if test="${sysUser.idCardType eq '2' }">selected</c:if>>户口簿</option>
								                <option value="3" <c:if test="${sysUser.idCardType eq '3' }">selected</c:if>>军人身份证</option>
								                <option value="4" <c:if test="${sysUser.idCardType eq '4' }">selected</c:if>>武装警察身份证</option>
								                <option value="5" <c:if test="${sysUser.idCardType eq '5' }">selected</c:if>>港澳通行证</option>
								                <option value="6" <c:if test="${sysUser.idCardType eq '6' }">selected</c:if>>护照</option>
								                <option value="7" <c:if test="${sysUser.idCardType eq '7' }">selected</c:if>>其他</option>
							                  </select>
											  <div class="form-control-focus"></div>
											  <span class="help-block">证件类型</span>
											  </div>
										</div>
										<div class="col-md-6 controls">
											<label class="col-md-3 controls">证件号码:</label>
											<div class="col-md-8">
											<input class="form-control" id="idCardNumber" type="text" name="idCardNumber" value="${sysUser.idCardNumber}">
											<div class="form-control-focus"></div>
											<span class="help-block">证件号码</span>
											</div>
										</div>
									</div>
									
									<div class="form-group form-md-line-input">
										<div class="col-md-6 controls">
											<label class="col-md-3 controls" >民族:</label>
											   <div class="col-md-8">
										       <input type="text" name="nation" value="${sysUser.nation}" class="form-control" />
											  <div class="form-control-focus"></div>
											  <span class="help-block">民族</span>
										      </div>
										</div>
										<div class="col-md-6 controls">
											<label class="col-md-3 controls">政治面貌:</label>
											    <div class="col-md-8">
											      <input type="text" name="politicalStatus" value="${sysUser.politicalStatus}" class="form-control" />
											      <div class="form-control-focus"></div>
											      <span class="help-block">政治面貌</span>
											  </div>
										</div>
									</div>

									
									<div class="form-group form-md-line-input ">
								       <div class="col-md-12 controls">
									       <label class="col-md-1 controls">籍贯:<span class="required"></span></label>
									   <div class="col-md-3">
										  <select id="province" name="province" class="form-control required">
											 <option value="${sysUser.province}" selected>${sysUser.province}</option>
										  </select>
										  <div class="form-control-focus"></div><span class="help-block">省</span>
									   </div>
								       <div class="col-md-3">
										  <select id="city" name="city" class="form-control required">
											<option value="${sysUser.city}" selected>${sysUser.city}</option>
										  </select>
										  <div class="form-control-focus"></div><span class="help-block">市/区</span>
									   </div>
									   <div class="col-md-3">
										  <select id="area" name="area" class="form-control required">
											<option value="${sysUser.area}" selected>${sysUser.area}</option>
										  </select>
										<div class="form-control-focus"></div><span class="help-block">区/县</span>
									   </div>
								     </div>
							      </div>
									
									<div class="form-group form-md-line-input">
										<div class="col-md-10">
											<label class="col-md-3">家庭地址:</label>
											<div class="col-md-12">
											<textarea class="form-control" name="address" rows="4" >${sysUser.address}</textarea>
											<div class="form-control-focus"></div>
											<span class="help-block">家庭地址</span>
											</div>
										</div>
									</div>
							
							<div class="margiv-top-10">
							    <button type="submit" class="btn green">保存</button>
							</div>
						</form>
					    
					</div>
					
					<!-- END PERSONAL INFO TAB -->
					<!-- CHANGE AVATAR TAB -->
					<div class="tab-pane" id="tab_1_2">
						<form role="form" id="scUserHeadForm"
							action="${pageContext.request.contextPath}/sysUser/saveImg?id=${sysUser.id}"
							method="post" class="form-horizontal"
							enctype="multipart/form-data">
							<input type="hidden" name="id" value="${sysUser.id}">
							<div class="form-group" style="text-align: center;">
								<div class="fileinput fileinput-new" data-provides="fileinput">
									<div class="fileinput-new thumbnail"
										style="width: 150px; height: 150px;">
										<c:choose>
											<c:when test="${not empty sysUser.imgPath}">
												<img class="" src="${pageContext.request.contextPath}/admin/imgView?path=${sysUser.imgPath}" alt="">
											</c:when>
											<c:otherwise>
												<img class="" src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image" alt="">
											</c:otherwise>
										</c:choose>
									</div>
									<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 150px; max-height: 150px;"></div>
									<div>
										<span class="btn default btn-file"> 
										  <span class="fileinput-new"> 选择图片 </span> 
										  <span class="fileinput-exists"> 修改 </span> 
										  <input type="file" name="file">
										</span> 
										  <a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> 删除 </a>
									</div>
								</div>
							</div>
							<div class="margin-top-10">
								<a href="javascript:;" onclick="savaHeadImg();" class="btn green"> 提交 </a> 
							</div>
						</form>
					</div>
					<!-- END PRIVACY SETTINGS TAB -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- END PAGE BASE CONTENT -->
<!-- PAGE LEVEL SCRIPTS-->

<script src="${pageContext.request.contextPath}/static/global/plugins/jquery.input-ip-address-control-1.0.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/address/address.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/arttemplate/art-template-web.js" type="text/javascript"></script>
	
<script  id="option-template" type="text/html">
	{{each items item index}}
	<option value="{{index}}" {{if index == optionIndex}} selected {{/if}}>{{item.name}}</option>
	{{/each}}
</script>
<script  id="area-template" type="text/html">
	{{each items as item index}}
	<option value="{{index}}" {{if index == optionIndex}} selected {{/if}}>{{item}}</option>
	{{/each}}
</script>
	

<script type="text/javascript">

$(document).ready(function(){
	var provinceIndex=$("#province").val();
	var cityIndex=$("#city").val();
	var areaIndex=$("#area").val();
	if(provinceIndex==""){
		provinceIndex=0;
	}
	if(cityIndex==""){
		cityIndex=0;
	}
	if(areaIndex==""){
		areaIndex=0;
	}
	
	var provinceHtml = template('option-template', {
	    items: provinceList,
	    optionIndex:provinceIndex
	});
	document.getElementById('province').innerHTML = provinceHtml;
	
	
	var cityHtml = template('option-template', {
	    items: provinceList[provinceIndex].cityList,
	    optionIndex:cityIndex
	});
	document.getElementById('city').innerHTML = cityHtml;
	
	var areaHtml = template('area-template', {
	    items: provinceList[provinceIndex].cityList[cityIndex].areaList,
	    optionIndex:areaIndex
	});
	document.getElementById('area').innerHTML = areaHtml;
	
	
	$("#province").change(function(){
		provinceIndex=$("#province").val();
		cityIndex=0;
		areaIndex=0;
		var cityHtml = template('option-template', {
		    items: provinceList[provinceIndex].cityList,
		    optionIndex:cityIndex
		});
		document.getElementById('city').innerHTML = cityHtml;
		
		
		var areaHtml = template('area-template', {
		    items: provinceList[provinceIndex].cityList[cityIndex].areaList,
		    optionIndex:areaIndex
		});
		document.getElementById('area').innerHTML = areaHtml;
	});
	
	$("#city").change(function(){

		cityIndex=$("#city").val();
		areaIndex=0;
		var areaHtml = template('area-template', {
		    items: provinceList[provinceIndex].cityList[cityIndex].areaList,
		    optionIndex:areaIndex
		});
		document.getElementById('area').innerHTML = areaHtml;
	});
	
	
});






	$('#scUserUpdateForm')
			.validate(
					{
						errorElement : 'span', //default input error message container
						errorClass : 'help-block help-block-error', // default input error message class
						focusInvalid : false, // do not focus the last invalid input
						ignore : "", // validate all fields including form hidden input
						messages : {},
						rules : {
							name : {
								maxlength : 10,
								required : true
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
							ajaxSubmitCallback($('#scUserUpdateForm'), dialogAjaxDone);
						}
					});
</script>
<script
	src="${pageContext.request.contextPath}/static/global/plugins/jquery.input-ip-address-control-1.0.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/static/global/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"
	type="text/javascript"></script>
<!-- END LEVEL SCRIPTS -->
<script type="text/javascript">
    $("#birthday").inputmask("y-m-d", {
	 autoUnmask : true
    });

   $("#enrolmentTime").inputmask("y-m-d", {
	 autoUnmask : true
     /* "placeholder": "yyyy/mm/dd" */
    });
	$("#mask_date").inputmask("y-m-d", {
		autoUnmask : true
	/* "placeholder": "yyyy/mm/dd" */
	});
	$("#mask_date_entry").inputmask("y-m-d", {
		autoUnmask : true
	/* "placeholder": "yyyy/mm/dd" */
	});
	$("#mask_date_quit").inputmask("y-m-d", {
		autoUnmask : true
	/* "placeholder": "yyyy/mm/dd" */
	});
	$('#scUserUpdateForm') .validate(
	{
		errorElement : 'span', //default input error message container
		errorClass : 'help-block help-block-error', // default input error message class
		focusInvalid : false, // do not focus the last invalid input
		ignore : "", // validate all fields including form hidden input
		messages : {
		},
		rules : {
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
			label.closest('.form-group').removeClass( 'has-error'); // set success class to the control group
		},

		submitHandler : function(form) {
			ajaxSubmitCallback($('#scUserUpdateForm'), dialogAjaxDone);
		}
	});
	
	function savaHeadImg(){
		
		ajaxSubmitCallback($('#scUserHeadForm'), refreshHead);
		
	}
	
	function refreshHead(json){
		NUI.ajaxDone(json);
		//hendle image refresh
		$("#img").attr('src',json.datas);
	}
</script>
