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
