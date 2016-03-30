// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).on('ready page:load', function(){

	$('.search-button').click(function(e){
		// Clear out any previous search results.
		$('.results').empty();
		// Ajax call returns JSON object based on query.
		$.ajax({
			method: 'GET',
			url: 'search_price_guides/' + $('#query').val(),
			success: function(result, status){
				$('.results').append(result)
			},
			error: function(status, error){
				console.log(status, error)
			}
			// End of AJAX call.
		});
		// Clear input.
		$('#query').val('')
		// End of search-button click function.
	});
	// End of document ready function/javascript file.
});
