import Split from "split-grid";
import { getComponent } from "@helpers/alpine";
import Component from "@js/component";

export default Component("paneGroup", () => {
  return {
    layout: "columns",
    items: [],
    group: null,
    _splitter: null,

    init() {
      this.layout = this.$el.getAttribute("data-layout");

      this.$watch("layout", (layout) => {
        this.$el.setAttribute("data-layout", layout);
      });
    },

    switchLayout() {
      this.layout = this.layout === "rows" ? "columns" : "rows";
    },

    registerItem() {
      const item = getComponent(this.$el);
      this.items.push(item);
    },

    hidePane(event) {
      const pane = this.resolveEventPane(event);
      const gutter = this.items[this.itemIndex(pane) + 1];

      pane.hidden = true;
      if (gutter) gutter.hidden = true;
    },

    showPane(event) {
      const pane = this.resolveEventPane(event);
      const gutter = this.items[this.itemIndex(pane) + 1];

      pane.hidden = false;
      if (gutter) gutter.hidden = false;
    },

    split() {
      this.destroy();

      this._splitter = Split({
        [`${this.layout.replace("s", "")}Gutters`]: this.gutterData,

        writeStyle: (grid, gridTemplateProp, gridTemplateStyle) => {
          const sizes = gridTemplateStyle.split(" ");
          for (let i = 0; i < sizes.length; i++) {
            this.visibleItems[i].setSize(this.layout, sizes[i]);
          }
        },
      });
    },

    resolveEventPane(event) {
      const targetPaneId = event.target.getAttribute("data-target-pane");
      if (targetPaneId) {
        return this.items.find((item) => item.id === targetPaneId);
      } else if (this.type === "pane") {
        return this;
      }
    },

    itemIndex(item, visibleOnly = false) {
      const items = this[visibleOnly ? "visibleItems" : "items"];
      return items.findIndex((i) => i === item);
    },

    destroy() {
      if (this._splitter) {
        this._splitter.destroy();
      }
    },

    root: {
      ["x-effect"]: "split",
      [":style"]() {
        return {
          [`grid-template-${this.layout}`]: this.itemsSizeStr,
          ["grid-template-areas"]: this.gridTemplateAreas,
        };
      },
    },

    get gridTemplateAreas() {
      const ids = this.visibleItems.map((item) => item.id);
      if (this.layout === "columns") {
        return '"' + ids.join(" ") + '"';
      } else {
        return '"' + ids.join('" "') + '"';
      }
    },

    get visibleItems() {
      return this.items.filter((item) => !item.hidden);
    },

    get itemsSizeStr() {
      return this.visibleItems
        .map((item) => item.getSize(this.layout))
        .join(" ");
    },

    get gutterData() {
      return this.visibleItems
        .filter((item) => item.type === "gutter")
        .map((item) => {
          return {
            track: this.itemIndex(item, true),
            element: item.$root,
          };
        });
    },
  };
});
