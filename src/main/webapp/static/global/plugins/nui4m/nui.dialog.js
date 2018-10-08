(function($) {
	$.pdialog = {
		close : function() {
			$('#dialog').modal('hide').empty();
		},

		open : function(url, title, options) {
			$('#dialog').loadUrl(url, {}, function() {
				$('#dialog').modal({
					backdrop : 'static'
				});
			});
		}
	}
})(jQuery);