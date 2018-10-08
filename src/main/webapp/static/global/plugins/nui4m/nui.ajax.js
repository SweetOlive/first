/**
 * ajax form submit
 * @param {Object} form
 * @param {Object} callback
 * @param {String} confirmMsg 
 */
function ajaxSubmitCallback(form, callback, confirmMsg) {
	var $form = $(form);
	var formData = new FormData($form[0]);
	
	var _submitFn = function() {
		$.ajax({
			type : form.method || 'POST',
			url : $form.attr("action"),
			data : formData,
			dataType : "json",
			async : true,
			cache : false,
			contentType : false,
			processData : false,

			success : callback || NUI.ajaxDone,
			error : NUI.ajaxError
		});
	}
	
	if (confirmMsg) {
		bootbox.confirm(confirmMsg, function(result) {
            if(result){
            	_submitFn();
            }
         }); 
	} else {
		_submitFn();
	}
	
	return false;
}

/**
 * dialog submit form callback function
 */
function dialogAjaxDone(json){
	NUI.ajaxDone(json);
	if (json.statusCode == NUI.statusCode.ok){

		
		if ("true" == json.closeDialog) {
			$.pdialog.close();
		}
	}
}

/**
 * @param {Object} form
 */
function divSearch(form, rel){
	var $form = $(form);
//	if (!$form.valid()) {
//		return false;
//	}
	if (rel) {
		var $box = $("#" + rel);
		$box.ajaxUrl({
			type:"POST", url:$form.attr("action"), data: $form.serializeArray()
		});
	}
	return false;
}


function ajaxTodo(url, callback){
	var $callback = callback || NUI.ajaxDone;
	if (! $.isFunction($callback)) $callback = eval('(' + callback + ')');
	$.ajax({
		type:'POST',
		url:url,
		dataType:"json",
		cache: false,
		success: $callback,
		error: NUI.ajaxError
	});
}



$.fn.extend({
	ajaxTodo:function(){
		return this.each(function(){
			var $this = $(this);
			$this.click(function(event){
				var url = unescape($this.attr("href")).replaceTmById();				
				NUI.debug(url);
				if (!url.isFinishedTm()) {
					//toastr["error"]($this.attr("warn") || NUI.msg("alertSelectMsg"),"Error");
									

					$.bootstrapGrowl($this.attr("warn") || NUI.msg("alertSelectMsg"), {
	                    ele: 'body', // which element to append to
	                    type: 'danger', // (null, 'info', 'danger', 'success', 'warning')
	                    offset: {
	                        from: 'top',
	                        amount: 100
	                    }, // 'top', or 'bottom'
	                    align: 'center', // ('left', 'right', or 'center')
	                    width: 'auto', // (integer, or 'auto')
	                    delay: 5000, // Time while the message will be displayed. It's not equivalent to the *demo* timeOut!
	                    allow_dismiss: true, // If true then will display a cross to close the popup.
	                    stackup_spacing: 10 // spacing between consecutively stacked growls.
	                });
					return false;
				}
				var title = $this.attr("todoMsg");
				
				if (title) {
					bootbox.confirm(title, function(result) {
			            if(result){
			            	ajaxTodo(url, $this.attr("callback"));
			            }
			         });
					
				} else {
					ajaxTodo(url, $this.attr("callback"));
				}
				event.preventDefault();
			});
		});
	}

});
