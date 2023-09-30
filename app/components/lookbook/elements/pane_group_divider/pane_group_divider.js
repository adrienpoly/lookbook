import paneGroupItem from "../pane_group_item/pane_group_item";
import Component from "@js/component";

export default Component("paneGroupDivider", () => {
  return {
    ...paneGroupItem("gutter", {
      rows: "1px",
      columns: "1px",
    }),

    init() {
      this.id = this.$el.getAttribute("data-gutter-id");
    },
  };
});
