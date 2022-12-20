import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["trigger", "container", "opened", "closed"];

  initialize() {
    window.addEventListener("click", this.clickAway.bind(this));
    this.triggerTarget.addEventListener("click", this.toggleOpen.bind(this));

    if (this.isOpen()) {
      this.open();
    } else {
      this.close();
    }
  }

  toggleOpen() {
    if (this.isOpen()) {
      this.close();
    } else {
      this.open();
    }
  }

  clickAway(event) {
    if (
      !this.isTrigger(event.target) &&
      (!this.isContainer(event.target) || this.autoclose())
    ) {
      this.close();
    }
  }

  open() {
    this.element.classList.add("open");
    this.element.classList.remove("closed");

    this.containerTarget.classList.remove("hidden");
    this.closedTargets.forEach((el) => el.classList.add("hidden"));
    this.openedTargets.forEach((el) => el.classList.remove("hidden"));
  }

  close() {
    this.element.classList.remove("open");
    this.element.classList.add("closed");

    this.containerTarget.classList.add("hidden");
    this.closedTargets.forEach((el) => el.classList.remove("hidden"));
    this.openedTargets.forEach((el) => el.classList.add("hidden"));
  }

  isOpen() {
    return !this.containerTarget.classList.contains("hidden");
  }

  autoclose() {
    return "autoclose" in this.element.dataset;
  }

  isContainer(element) {
    return (
      this.containerTarget === element || this.containerTarget.contains(element)
    );
  }

  isTrigger(element) {
    return (
      this.triggerTarget === element || this.triggerTarget.contains(element)
    );
  }
}
