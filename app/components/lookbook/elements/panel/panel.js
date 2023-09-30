import Component from "@js/component";

export default Component("panel", () => {
  return {
    panel: null,

    init() {
      this.panel = this;
    },

    showAction() {
      return this.isSelected;
    },

    registerAction() {
      this.$dispatch("panel:register-action", {
        panel: this.id,
        target: this.$el,
      });
    },
  };
});
