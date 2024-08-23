// app/javascript/controllers/hello_controller.js

import { Controller } from "@hotwired/stimulus";

// Define the controller class
export default class extends Controller {
  static targets = ["output"]; // Define targets within the controller

  // Action to be triggered by a button click
  greet() {
    this.outputTarget.textContent = "Hello, Stimulus!";
  }
}
