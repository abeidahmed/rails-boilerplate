export default class extends ApplicationController {
  static targets = ['output']

  connect() {
    this.outputTarget.textContent = 'Hello, Stimulus!'
  }
}
