// app/javascript/controllers/index.js

import { application } from "./application"

// Explicitly import each controller
import HelloController from "./hello_controller"
import AnotherController from "./another_controller"

// Register each controller with Stimulus
application.register("hello", HelloController)
application.register("another", AnotherController)
