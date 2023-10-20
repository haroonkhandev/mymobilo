$(document).ready(function() {
  $('#category-select').change(function() {
    var selectedFilter = $(this).val();
    var currentUrl = window.location.href;
    // Make an AJAX request to fetch filtered products based on the selected category
    $.ajax({
      url: currentUrl, // Update the URL based on your route configuration
      type: 'GET',
      data: { category: selectedFilter },
      dataType: 'script',
      success: function(data) {
       },
      error: function(xhr, status, error) {
        // Handle errors if any
      }
    });
  });
});