$(document).ready(function() {
	$('.portfolio-show-left').on('click', '.link_edit_stock', function(event) {
		event.preventDefault();
		var $editStockLink = $(event.target);
		var $editPositionLink = $editStockLink.parent().find('.link_edit_position');
		var stockUrl = $editStockLink.attr('href');
		var $divToAppend = $(document).find('.portfolio-show-right');
		$editStockLink.toggle();
		$editPositionLink.toggle();
		$.ajax({
			type: 'get',
			url: stockUrl
		}).done(function(responseData) {
			var stockHtml = responseData.page;
			$divToAppend.append(stockHtml);
		})
	});

	$('.portfolio-show-right').on('submit', '#stock_form', function(event) {
		event.preventDefault();
		var $stockSubmitForm = $(event.target);
		var stockSubmitUrl = $stockSubmitForm.attr('action');
		var stockEditFormData = $stockSubmitForm.serialize();
		$.ajax({
			type: 'post',
			url: stockSubmitUrl,
			data: stockEditFormData
		}).done(function(stockData) {
			window.location.reload();
		}).fail(function(error) {
			alert('Failed');
		})
	});
})

