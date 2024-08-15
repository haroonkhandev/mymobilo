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

  $('#product1Search').on('input', function() {
    var searchTerm = $(this).val().toLowerCase();

    // Send an AJAX request to the server to fetch product names
    $.ajax({
      url: '/compare_products/index',
      method: 'GET',
      data: { term: searchTerm },
      success: function(response) {
        // Update the select list with fetched product names
        var selectList = $('#product1Select');
        selectList.empty(); // Clear existing options

        response.forEach(function(product) {
          selectList.append('<option value="' + product + '">' + product + '</option>');
        });
      },
      error: function(error) {
        console.error('Error:', error);
      }
    });
  });

  $('#product2Search').on('input', function() {
    var searchTerm = $(this).val().toLowerCase();

    // Send an AJAX request to the server to fetch product names
    $.ajax({
      url: '/compare_products/index',
      method: 'GET',
      data: { term: searchTerm },
      success: function(response) {
        // Update the select list with fetched product names
        var selectList = $('#product2Select');
        selectList.empty(); // Clear existing options

        response.forEach(function(product) {
          selectList.append('<option value="' + product + '">' + product + '</option>');
        });
      },
      error: function(error) {
        console.error('Error:', error);
      }
    });
  });

    $('#compareButton').click(function() {
    var product1Id = $('#product1Select').val();
    var product2Id = $('#product2Select').val();

    // Send an AJAX request to the server to compare products
    $.ajax({
      url: '/compare_products/compare',
      method: 'GET',
      data: {
        product1_name: product1Id,
        product2_name: product2Id
      },
      success: function(response) {
        // Handle the comparison results (display in #comparisonResult)
        $('#comparisonResult').html(response);
      },
      error: function(error) {
        console.error('Error:', error);
      }
    });
  });
});
document.addEventListener('DOMContentLoaded', function () {
  const hash = window.location.hash || '#description';
  const targetTab = document.querySelector(`[href="${hash}"]`);
  
  if (targetTab) {
    targetTab.click();
  }
  document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function (e) {
      const selectedTabId = this.getAttribute('href');
      history.pushState(null, '', selectedTabId);
    });
  });
});