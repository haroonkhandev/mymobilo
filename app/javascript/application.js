// app/javascript/application.js

import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"
import Rails from "@rails/ujs";
Rails.start();

// Dark theme functionality
document.addEventListener("DOMContentLoaded", () => {
  if (localStorage.theme) {
    document.documentElement.setAttribute("data-theme", localStorage.theme);
  }

  const themeSwitch = document.getElementById('flexSwitchCheckDefault');
  if (themeSwitch) {
    themeSwitch.addEventListener('change', () => {
      const newTheme = themeSwitch.checked ? 'dark' : 'light';
      document.documentElement.setAttribute("data-theme", newTheme);
      localStorage.setItem("theme", newTheme);
    });
  }
});
