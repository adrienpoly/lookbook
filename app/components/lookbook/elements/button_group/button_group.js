import { createSingleton } from "@js/tippy";
import { getComponent } from "@helpers/alpine";

export default function buttonGroup() {
  return {
    _tooltip: null,

    get buttons() {
      const buttons = this.$refs.buttons.children;
      return Array.from(buttons).map((el) => getComponent(el));
    },

    init() {
      this.$nextTick(() => {
        const tippys = this.buttons.map((button) => button._tooltip);

        this._tooltip = createSingleton(tippys, {
          offset: [0, 3],
          theme: "tooltip",
          moveTransition: "transform 0.15s ease-out",
        });
      });
    },

    addAction(event) {
      const pane = this.$root.closest("[data-component='pane']");
      if (pane && pane.contains(event.detail.target)) {
        this.$refs.buttons.appendChild(event.detail.target);
      }
    },
  };
}
