document.addEventListener('DOMContentLoaded', function () {
  function activateTabFromHash() {
    const urlHash = window.location.hash;

    if (urlHash) {
      // Check if the hash corresponds to a tab within the Products section
      const targetTabLink = document.querySelector(`a[href="${urlHash}"]`);
      const productsTab = document.querySelector('#products-tab');

      if (targetTabLink) {
        // Activate the Products tab if it is not already active
        if (!productsTab.classList.contains('active')) {
          new bootstrap.Tab(productsTab).show();
        }

        // Activate the specific sub-tab
        new bootstrap.Tab(targetTabLink).show();
      } else {
        // Activate the 'All' tab if the hash does not match any sub-tab
        const allTabLink = document.querySelector('a[href="#all"]');
        if (!allTabLink.classList.contains('active')) {
          new bootstrap.Tab(allTabLink).show();
        }
      }
    }
  }

  // Call the function to activate the correct tab based on URL hash on page load
  activateTabFromHash();

  // Update the URL hash when tabs are changed
  const productTabLinks = document.querySelectorAll('#product-tabs a[data-bs-toggle="pill"]');
  productTabLinks.forEach(tabLink => {
    tabLink.addEventListener('shown.bs.tab', function (event) {
      const target = event.target.getAttribute('href');
      window.location.hash = target;
    });
  });

  const mainTabLinks = document.querySelectorAll('#tab a[data-bs-toggle="pill"]');
  mainTabLinks.forEach(tabLink => {
    tabLink.addEventListener('shown.bs.tab', function (event) {
      const target = event.target.getAttribute('href');
      window.location.hash = target;
    });
  });

  // Handle hash change when navigating directly to a category or tab from URL
  window.addEventListener('hashchange', function () {
    activateTabFromHash();
  });

  // Optional: Smooth scroll to the selected tab section on page load
  const urlHash = window.location.hash;
  if (urlHash) {
    const scrollTarget = document.querySelector(urlHash);
    if (scrollTarget) {
      scrollTarget.scrollIntoView({ behavior: 'smooth' });
    }
  }

  // Bookmark button handler (example for bookmarks in the shop section)
  const bookmarkButtons = document.querySelectorAll('.removeBookmark');
  bookmarkButtons.forEach(btn => {
    btn.addEventListener('click', function (e) {
      e.preventDefault();
      const icon = this.querySelector('i');
      if (icon.classList.contains('mdi-bookmark')) {
        icon.classList.remove('mdi-bookmark');
        icon.classList.add('mdi-bookmark-outline');
        // Additional logic for handling bookmark removal can go here
      } else {
        icon.classList.remove('mdi-bookmark-outline');
        icon.classList.add('mdi-bookmark');
        // Additional logic for handling bookmark addition can go here
      }
    });
  });
});
