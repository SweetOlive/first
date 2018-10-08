var Login = function () {

	var handleLogin = function() {
		$('.login-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	            	schoolCode: {
	                    required: true
	                },
	                username: {
	                    required: true
	                },
	                password: {
	                    required: true
	                },
	                code: {
	                    required: true
	                }
	            },

	            messages: {
	            	schoolCode: {
	                    required: "请输入您的机构代码。"
	                },
	                username: {
	                    required: "请输入您的用户账号。"
	                },
	                password: {
	                    required: "请输入您的密码"
	                },
	                code: {
	                    required: "请输入验证码"
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-danger', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },


				errorPlacement : function(error, element) {
					if (element.is('#code')) {
						error.insertAfter(element.parent().parent());
					} else if (element.is(':radio')) {
						error
								.insertAfter(element
										.closest(".md-radio-list, .md-radio-inline, .radio-list,.radio-inline"));
					} else {
						error.insertAfter(element); // for other inputs, just perform default behavior
					}
				},

	            submitHandler: function (form) {
	                form.submit();
	            }
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                    $('.login-form').submit();
	                }
	                return false;
	            }
	        });
	}

    
    return {
        //main function to initiate the module
        init: function () {
        	
            handleLogin();   

            // init background slide images
		    $.backstretch([
	        		        "static/pages/media/bg/7.jpg",
	        		        "static/pages/media/bg/8.jpg",
	        		        "static/pages/media/bg/3.jpg",
	        		        "static/pages/media/bg/4.jpg"
		        ], {
		          fade: 1000,
		          duration: 8000
		    	}
        	);
        }
    };

}();

jQuery(document).ready(function() {
    Login.init();
});