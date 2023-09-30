import Component from "@js/component";

export default Component("tabPanel", () => {
  return {
    id: null,

    init() {
      this.id = this.$el.getAttribute("data-tab-panel-id");
    },

    get isSelected() {
      return this.selectedPanel === this.id;
    },
  };
});
