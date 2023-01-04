import { Controller } from "@hotwired/stimulus";
export default class extends Controller {
  static targets = ["tabContent", "tab"];

  connect() {}

  click(event) {
    this.tabTargets.forEach((t) => this.activate_tab(t, event.params));

    this.tabContentTargets.forEach((t) => {
      t.classList.add("hidden");
      if (t.id == event.params["tab"]) {
        t.classList.remove("hidden");
      }
    });
  }

  activate_tab(tab, params) {
    tab.dataset["active"] =
      tab.dataset["resource-tabs-tab-param"] == params["tab"];
  }
}
