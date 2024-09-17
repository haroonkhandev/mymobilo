document.addEventListener('DOMContentLoaded', function() {
  // Get all checkboxes
  const checkboxes = document.querySelectorAll('input[name="product_type[]"]');

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      // Create the query string from checked checkboxes
      const checkedTypes = Array.from(checkboxes)
        .filter(cb => cb.checked)
        .map(cb => cb.value);

      const queryString = checkedTypes.length
        ? `product_type[]=${checkedTypes.join('&product_type[]=')}`
        : '';

      // Redirect to the new URL
      window.location.search = queryString;
    });
  });
});