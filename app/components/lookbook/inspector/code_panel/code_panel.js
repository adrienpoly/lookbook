import basePanel from "../../elements/panel/panel";
import Component from "@js/component";

export default Component("codePanel", () => {
  return {
    ...basePanel(),

    codePanel: null,

    init() {
      this.codePanel = this;
    },

    toggleWrap() {
      this.codePanel.codeEditor.toggleWrap();
    },

    get codeEditor() {
      return Alpine.$data(this.$root.querySelector("[data-component='code']"));
    },
  };
});
