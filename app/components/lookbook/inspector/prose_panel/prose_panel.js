import basePanel from "../../elements/panel/panel";
import Component from "@js/component";

export default Component("prosePanel", () => {
  return {
    ...basePanel(),

    copyContent() {
      console.log("copied!", this.panel.$refs.content.innerHTML);
    },
  };
});
