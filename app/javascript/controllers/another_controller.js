// app/javascript/controllers/another_controller.js

import { Controller } from "@hotwired/stimulus";

// Define the controller class
export default class extends Controller {
  static targets = ["toggle"]; // Define targets within the controller

  // Action to toggle a class on the target element
  toggle() {
    this.toggleTarget.classList.toggle("active");
  }
}
