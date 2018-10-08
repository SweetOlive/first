function initNUIEnv() {

	var ajaxbg = $("#progressBar");

	ajaxbg.hide();

	$(document).ajaxStart(function() {
		App.stopPageLoading();
		App.startPageLoading({animate: true});
	}).ajaxStop(function() {
		App.stopPageLoading();
	}).ajaxError(function() {
		App.stopPageLoading();
	});

	initSidebarAction();
	loadInitPage();
	initUI();
}

function initSidebarAction() {

	var menu = $('.page-sidebar-menu');
	menu.find('li > a').click(function() {
		// LOAD

		var href = $(this).attr("href");
		if (href) {

	        menu.find('li.active').removeClass('active');
	        menu.find('li.open').removeClass('open');
	        menu.find('li > a > .selected').remove();
			// alert(href);

			if(href.substring(0,1)=='#'){
				var url = href.substring(1,href.length);
				
				if(url){
					$("#page-content").loadUrl(url);
				}	
				

		        

//		        $(this).parents('li').toggleClass("active");
//		        $(this).parents('li').toggleClass("open");
		        $(this).parent().toggleClass("active");
		        $(this).parent().parent().parent().toggleClass("active");
			}else{
//				$(this).parent().toggleClass("active");
//				$(this).toggleClass("open");
			}
			


//	        alert($(this).parent().html());

		}


     
        
		// var $this = $(this);
		// if (hrefx) {
		// $("#page-content").loadUrl(href);
		//
		// $('.sidebar ul li').removeClass("active");
		//			
		// var isSubmenu = $(this).parent().hasClass("treeview-menu");
		//			
		// if(isSubmenu){
		// $(this).parent().parent().toggleClass("active");
		// }
		//
		// $(this).toggleClass("active");
		//
		// }
	});
}

function loadInitPage() {
	var hash = window.location.hash;
	if (hash) {
		
/*		var url = hash.substring(1,hash.length);
		
		if(url){
			$("#page-content").loadUrl(url);
		}*/
		
		
		var menu = $('.page-sidebar-menu');
        menu.find('li.active').removeClass('active');
        menu.find('li > a > .selected').remove();
		menu.find('li').each(function() {
			var $this = $(this);
			var href = $this.find("a").attr("href");
			if (href == hash) {
				
				$this.toggleClass("active");
				$this.toggleClass("open");
				
				$this.parents('li').each(function () {
		            $(this).addClass('active');
		            $(this).find('> a > span.arrow').addClass('open');
		 
		            if ($(this).parent('ul.page-sidebar-menu').size() === 1) {
		                $(this).find('> a').append('<span class="selected"></span>');
		            }
		 
		            if ($(this).children('ul.sub-menu').size() === 1) {
		                $(this).addClass('open');
		            }
		        });


			}

		});
	}else{

		var menu = $('.page-sidebar-menu');
		
		var $firstLi = $("li",menu).first();		

		var href = $firstLi.find("a").attr("href");
		

		
		if (href) {
			if(href.substring(0,1)=='#'){
				var url = href.substring(1,href.length);
				
				if(url){
					$("#page-content").loadUrl(url);
				}				
			}
			
			$firstLi.toggleClass("active");
			$firstLi.toggleClass("open");
			
			$firstLi.parents('li').each(function () {
	            $(this).addClass('active');
	            $(this).find('> a > span.arrow').addClass('open');
	 
	            if ($(this).parent('ul.page-sidebar-menu').size() === 1) {
	                $(this).find('> a').append('<span class="selected"></span>');
	            }
	 
	            if ($(this).children('ul.sub-menu').size() === 1) {
	                $(this).addClass('open');
	            }
	        });


		}
	}
}

function initUI(_box) {
	var $p = $(_box || document);
	
	
	$("a[target=dialog]", $p).each(function() {
		$(this).click(function(event) {
			var $this = $(this);
			var url = unescape($this.attr("href")).replaceTmById();

			if (!url.isFinishedTm()) {
				// toastr["error"]($this.attr("warn")
				// || NUI.msg("alertSelectMsg"), "Error");//
				// success/error/info/warning

				

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

			$.pdialog.open(url);

			return false;
		});
	});

	$("a[target=ajax]", $p).each(function() {
		$(this).click(function(event) {
			var $this = $(this);

			var rel = $this.attr("rel");
			var url = $this.attr("href");
			if (rel&&url) {
				var $rel = $("#" + rel);
				$rel.loadUrl(url);
			}
			event.preventDefault();
		});
	});

//	$("#dialog > .close").click(function() {
//		$.pdialog.close();
//		return false;
//	});

	if ($.fn.ajaxTodo) {
		$("a[target=ajaxTodo]", $p).ajaxTodo();
	}

	
	$("select[name='selectPageSize']").on("select2-selecting", function(event) {
		$("#_pageSize").val(event.val);
		$("#pagerForm").submit();
	});

	$.widget.bridge('uibutton', $.ui.button);

	
	App.initComponents();
	
}
