$(document).on('ready page:load', function() {
	var nextPageUrl;

	$(window).scroll(function() {
		if ($(window).scrollTop() > $(document).height() - $(window).height() - 100) {
			console.log($('.pagination span.next > a').attr('href'));
			
			var nextPage = $('.pagination span.next > a').attr('href')

			if ( nextPage !== nextPageUrl ) {
				nextPageUrl = nextPage

				if ( nextPageUrl ) {
					$.ajax({
            			url: nextPageUrl,
            			dataType: 'script',
            			type: 'GET'
         			 });
				}

			}

			
		}
	});

		$('#search-form').submit(function(event) {
		event.preventDefault();
		var searchValue = $('#search').val();

		// $.ajax({
		// 	url: '/products?search=' + searchValue,
		// 	type: 'GET',
		// 	dataType: 'html',
		// }).done(function(data){
		// 	$('#products').html(data);
		// });

		// get short-hand replaces ajax call above
		// $.get('/products?search=' + searchValue)
		// .done(function(data){
		// 	console.log(data);
		// 	$('#products').html(data);
		// });

		// .getScript replaces above code but now in my products controller I
		// need something to format JS and HTML responses and a new file called index.js.erb to receive that response
		$.getScript('/products?search=' + searchValue);


	});
});
