/**
 * @author noside@126.com
 * 
 */

var NUI = {
	// sbar: show sidebar
	keyCode : {
		ENTER : 13,
		ESC : 27,
		END : 35,
		HOME : 36,
		SHIFT : 16,
		TAB : 9,
		LEFT : 37,
		RIGHT : 39,
		UP : 38,
		DOWN : 40,
		DELETE : 46,
		BACKSPACE : 8
	},
	statusCode : {
		ok : 200,
		info : 201,
		warn : 202,
		error : 300,
		timeout : 301
	},
	_msg : {}, // alert message
	_set : {
		loginUrl : "", // session timeout
		debug : false
	},
	msg : function(key, args) {
		var _format = function(str, args) {
			args = args || [];
			var result = str || "";
			for (var i = 0; i < args.length; i++) {
				result = result.replace(new RegExp("\\{" + i + "\\}", "g"),
						args[i]);
			}
			return result;
		}
		return _format(this._msg[key], args);
	},
	debug : function(msg) {
		if (this._set.debug) {
			if (typeof (console) != "undefined")
				console.log(msg);
			else
				alert(msg);
		}
	},
	loadLogin : function() {
		window.location = NUI._set.loginUrl;
	},
	jsonEval : function(data) {
		try {
			if ($.type(data) == 'string')
				return eval('(' + data + ')');
			else
				return data;
		} catch (e) {
			return {};
		}
	},
	ajaxError : function(xhr, ajaxOptions, thrownError) {
		var json = NUI.jsonEval(xhr.responseText);
		if (json.statusCode == NUI.statusCode.error) {
			if (json.message)
				

			$.bootstrapGrowl(json.message, {
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
		} else {

			
			var msg =  "<div>Http status: " + xhr.status + " "
			+ xhr.statusText + "</div>" + "<div>ajaxOptions: "
			+ ajaxOptions + "</div>" + "<div>thrownError: "
			+ thrownError + "</div>" + "<div>" + xhr.responseText
			+ "</div>";

			$.bootstrapGrowl(msg, {
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

		}
	},
	ajaxDone : function(json) {
		if (json != null) {
			if (json.statusCode === undefined && json.message === undefined) { // for iframeCallback
				//return toastr["error"](json, "Error");// success/error/info/warning
				return  $.bootstrapGrowl(json, {
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
			}

			if (json.statusCode == NUI.statusCode.error) {
				if (json.message)
				
				
				$.bootstrapGrowl(json.message, {
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
				
			} else if (json.statusCode == NUI.statusCode.timeout) {
				window.location = NUI._set.loginUrl;
			} else {
				if (json.message) {

					$.bootstrapGrowl(json.message, {
	                    ele: 'body', // which element to append to
	                    type: 'success', // (null, 'info', 'danger', 'success', 'warning')
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
				}

				if (json.formSubmit) {
					$('#' + json.formSubmit).submit();
//					divSearch($('#' + json.formSubmit), json.rel);
				}
				if (json.forwardUrl) {
					$('#' + json.rel).loadUrl(json.forwardUrl);
				}
			}
			;

		}
	},

	init : function(loginUrl) {
		this._set.loginUrl = loginUrl;
		initNUIEnv();
	}
};

(function($) {
	// NUI set regional
	$.setRegional = function(key, value) {
		if (!$.regional)
			$.regional = {};
		$.regional[key] = value;
	};

	$.fn.extend({
		/**
		 * @param {Object}
		 *            op: {type:GET/POST, url:ajax request path, data:ajax
		 *            request parameters, callback:callback function }
		 */
		ajaxUrl : function(op) {
			var $this = $(this);

			$.ajax({
				type : op.type || 'GET',
				url : op.url,
				data : op.data,
				cache : false,
				success : function(response) {
					var json = NUI.jsonEval(response);

					if (json.statusCode == NUI.statusCode.timeout) {
						NUI.loadLogin();
					}

					if (json.statusCode == NUI.statusCode.error) {
						if (json.message)
							//toastr["error"](json.message, "Error");


						$.bootstrapGrowl(json.message, {
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
						
					} else {
						$this.html(response).initUI();
						if ($.isFunction(op.callback))
							op.callback(response);
					}
				},
				error : NUI.ajaxError,
				statusCode : {
					503 : function(xhr, ajaxOptions, thrownError) {
						alert(NUI.msg("statusCode_503") || thrownError);
					}
				}
			});
		},
		loadUrl : function(url, data, callback) {
			$(this).ajaxUrl({
				url : url,
				data : data,
				callback : callback
			});
		},
		initUI : function() {
			return this.each(function() {
				if ($.isFunction(initUI))
					initUI(this);
			});
		},
		/**
		 * output firebug log
		 * 
		 * @param {Object}
		 *            msg
		 */
		log : function(msg) {
			return this.each(function() {
				if (console)
					console.log("%s: %o", msg, this);
			});
		}
	});

	/**
	 * extend String function
	 */
	$.extend(String.prototype, {
		replaceTm : function($data) {
			if (!$data)
				return this;
			return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})", "g"),
					function($1) {
						return $data[$1.replace(/[{}]+/g, "")];
					});
		},
		replaceTmById : function(_box) {
			var $parent = _box || $(document);
			return this.replace(RegExp("({[A-Za-z_]+[A-Za-z0-9_]*})", "g"),
					function($1) {
						var $input = $parent.find("#"
								+ $1.replace(/[{}]+/g, ""));
						return $input.val() ? $input.val() : $1;
					});
		},
		isFinishedTm : function() {
			return !(new RegExp("{[A-Za-z_]+[A-Za-z0-9_]*}").test(this));
		}
	});
})(jQuery);
