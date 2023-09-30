import { getComponent } from "@helpers/alpine";
import Component from "@js/component";

export default Component("tabPanelGroup", () => {
  return {
    groupId: null,
    panels: [],
    selectedPanel: null,

    init() {
      this.groupId = this.$el.getAttribute("data-tab-panel-group-id");
    },

    registerPanel() {
      const panel = getComponent(this.$el);
      this.panels.push(panel);
    },

    selectPanel(id) {
      this.selectedPanel = id;
    },

    root: {
      ["@tab:selected.window"](event) {
        const { group, tab } = event.detail;
        if (group === this.groupId) {
          this.selectPanel(tab);
        }
      },
    },
  };
});
