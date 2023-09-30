import tippy, { hideOnEsc } from "@js/tippy";
import Component from "@js/component";

export default Component("button", () => {
  return {
    _tooltip: null,
    _dropdown: null,

    init() {
      this._tooltip = this.initTooltip();
      if (this.$refs.dropdown) {
        this._dropdown = this.initDropdown();
      }
    },

    initTooltip() {
      return tippy(this.$refs.content, {
        theme: "tooltip",
        offset: [0, 3],
        aria: {
          content: null,
        },
        content: () => {
          return this.$refs.label.innerHTML;
        },
      });
    },

    initDropdown() {
      return tippy(this.$root, {
        theme: "dropdown",
        interactive: true,
        trigger: "click",
        placement: "bottom-end",
        offset: [0, 0],
        plugins: [hideOnEsc],
        content: () => {
          return this.$refs.dropdown.innerHTML;
        },
      });
    },
  };
});
