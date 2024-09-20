document.addEventListener("DOMContentLoaded", function() {
  const favoriteElements = document.querySelectorAll('.favorite-button, .unfavorite-button, .btn-outline-danger, .btn-outline-primary');

  // Initialize Bootstrap tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
  var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl);
  });

  favoriteElements.forEach(element => {
    element.addEventListener('click', function(event) {
      event.preventDefault(); // Prevent default anchor behavior
      const url = this.dataset.url;
      const method = this.dataset.method;
      const tooltip = bootstrap.Tooltip.getInstance(this); // Get tooltip instance

      fetch(url, {
        method: method,
        headers: {
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content,
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ favorite: {} })
      })
      .then(response => {
        if (!response.ok) throw new Error('Network response was not ok');
        return response.json();
      })
      .then(data => {
        // Update the UI based on the response
        if (data.status === 'favorited') {
          if (this.classList.contains('btn-outline-primary')) {
            // Button case
            this.classList.remove('btn-outline-primary');
            this.classList.add('btn-outline-danger');
            this.textContent = 'Remove from Favorite';
            this.dataset.method = 'delete';
            this.dataset.url = data.unfavoriteUrl;
          } else {
            // Icon case
            this.innerHTML = '<i class="fe fe-heart text-danger"></i>'; // Change to filled heart
            this.dataset.method = 'delete';
            this.dataset.url = data.unfavoriteUrl;
          }
          this.setAttribute('title', 'Remove from favorites'); // Update tooltip text
          tooltip.setContent({ '.tooltip-inner': 'Remove from favorites' }); // Update tooltip
        } else if (data.status === 'unfavorited') {
          if (this.classList.contains('btn-outline-danger')) {
            // Button case
            this.classList.remove('btn-outline-danger');
            this.classList.add('btn-outline-primary');
            this.textContent = 'Add to Favorite';
            this.dataset.method = 'post';
            this.dataset.url = data.favoriteUrl;
          } else {
            // Icon case
            this.innerHTML = '<i class="fe fe-heart"></i>'; // Change to empty heart
            this.dataset.method = 'post';
            this.dataset.url = data.favoriteUrl;
          }
          this.setAttribute('title', 'Add to favorites'); // Update tooltip text
          tooltip.setContent({ '.tooltip-inner': 'Add to favorites' }); // Update tooltip
        }
        tooltip.update(); // Refresh tooltip
      })
      .catch(error => {
        console.error('Error:', error);
      });
    });
  });
});