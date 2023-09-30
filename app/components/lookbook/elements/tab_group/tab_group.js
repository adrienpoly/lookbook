import { getComponent } from "@helpers/alpine";
import Component from "@js/component";

export default Component("tabGroup", () => {
  return {
    $options: {},
    options: ["orientation"],

    groupId: null,
    tabs: [],
    selectedTab: null,

    init() {
      this.groupId = this.$el.getAttribute("data-tab-group-id");
      this.$nextTick(() => {
        this.tabs[0].selectTab();
      });
    },

    registerTab() {
      const tab = getComponent(this.$el);
      this.tabs.push(tab);
    },

    selectTab() {
      this.selectedTab = this.id;
      this.$dispatch("tab:selected", {
        group: this.groupId,
        tab: this.selectedTab,
      });
    },
  };
});
