document.addEventListener('DOMContentLoaded', function() {
  // Retrieve the saved tab from sessionStorage
  const activeTab = sessionStorage.getItem('activeTab') || 'bookmarked'; // Default to 'bookmarked'
  
  // Activate the correct tab based on saved state
  const tabLinks = document.querySelectorAll('.nav-link');
  tabLinks.forEach(link => {
    const id = link.getAttribute('href').substring(1);
    if (id === activeTab) {
      link.classList.add('active');
      document.querySelector(`#${id}`).classList.add('show', 'active');
    } else {
      link.classList.remove('active');
      document.querySelector(`#${id}`).classList.remove('show', 'active');
    }
  });

  // Listen for tab changes
  tabLinks.forEach(link => {
    link.addEventListener('click', function() {
      const id = this.getAttribute('href').substring(1);
      sessionStorage.setItem('activeTab', id);
    });
  });
});