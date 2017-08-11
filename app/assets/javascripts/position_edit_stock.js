$(document).ready(function() {
	$('.portfolio-show-left').on('click', '.link_edit_stock', function(event) {
		event.preventDefault();
		var $editStockLink = $(event.target);
		var stockUrl = $editStockLink.attr('href');
		var $divToAppend = $(document).find('.portfolio-show-right');
		$editStockLink.toggle();
		$.ajax({
			type: 'get',
			url: stockUrl
		}).done(function(responseData) {
			var stockHtml = responseData.page;
			$divToAppend.append(stockHtml);
		})
	});

	
})

