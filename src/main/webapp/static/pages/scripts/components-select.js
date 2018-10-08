var ComponentsSelect1 = function() {

	var handleDemo = function() {
		//键入字符触发事件:动态获得后台传入select选项数据 
		//请求的url
		var selectNameUrl = $("#select-manager").attr("data-selectNameUrl");
		//选择得到搜索栏input，松开按键后触发事件
		$("#select-manager")
				.prev()
				.find('.bs-searchbox')
				.find('input')
				.keyup(
						function() {
							//键入的值
							var inputManagerName = $('#userForm .open input').val(); //判定键入的值不为空，才调用ajax
							if (inputManagerName != '') {
								$.ajax({
											type : 'post',
											url : selectNameUrl,
											data : {
												name : inputManagerName
											},
											dataType : "Json",
											success : function(data) {
												//清除select标签下旧的option签，根据新获得的数据重新添加option标签
												$("#select-manager").empty();
												if (data.items != null) {
													$
															.each(
																	data.items,
																	function(i,
																			Selectmanager) {
																		$(
																				"#select-manager")
																				.append(
																						" <option value=\""
																								+ Selectmanager.id
																								+ "\">"
																								+ Selectmanager.username
																								+ "</option>");
																	}) //必不可少的刷新
													$("#select-manager")
															.selectpicker(
																	'refresh');
												}
											},
											error : function() {
												if (json != null) {
													bootbox.alert(json.msg);
												}
											}
										})
							} else
								//如果输入的字符为空，清除之前option标签
								$("#select-manager").empty();
							alert("as" + $("#select-manager"))
							$("#select-manager").selectpicker('refresh');
						});
	}
	return {
		//main function to initiate the module
		init : function() {
			handleDemo();
		}
	};
}();

jQuery(document).ready(function() {
	ComponentsSelect1.init();
});