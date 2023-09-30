import paneGroupItem from "../pane_group_item/pane_group_item";
import Component from "@js/component";

export default Component("pane", () => {
  return {
    ...paneGroupItem("pane", {
      rows: "1fr",
      columns: "1fr",
    }),

    actions: {},

    init() {
      this.id = this.$el.getAttribute("data-pane-id");

      const defaultSize = this.$el.getAttribute("data-default-size");
      if (defaultSize) {
        this.size.rows = this.size.columns = defaultSize;
      }
    },
  };
});
