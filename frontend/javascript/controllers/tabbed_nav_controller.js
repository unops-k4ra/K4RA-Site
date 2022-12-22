import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = ["tabContent", "tab", "showButton"];

  connect() {
    this.tabs = this.tabTargets.map((tab) => `#${tab.dataset.name}`);
    this.navigate(this.currentTab());
  }

  currentTab() {
    return Math.max(0, this.tabs.indexOf(window.location.hash));
  }

  click(event) {
    this.navigate(event.params["index"]);
    event.stopPropagation();
  }

  navigate(index) {
    this.tabTargets.forEach((tab) => (tab.dataset.active = false));
    this.tabContentTargets.forEach((tab) => (tab.dataset.active = false));
    this.tabTargets[index].dataset["active"] = true;
    this.tabContentTargets[index].dataset["active"] = true;
  }
}
