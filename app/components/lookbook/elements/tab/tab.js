import Component from "@js/component";

export default Component("tab", () => {
  return {
    id: null,

    options: ["orientation"],

    $options: {},

    init() {
      this.id = this.$el.getAttribute("data-tab-id");
    },

    get isSelected() {
      return this.selectedTab === this.id;
    },

    root: {
      "x-options": "options",
      "@click": "selectTab",
      "@mousedown.prevent": true,
      [":class"]() {
        return {
          "tab-selected": this.isSelected,
        };
      },
    },
  };
});
