import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Auto-register all controllers in this folder
const context = require.context(".", true, /_controller\.js$/)
context.keys().forEach((key) => {
  if (key === "./index.js") return
  application.register(
    key.replace("./", "").replace("_controller.js", ""),
    context(key).default
  )
})

export { application }
