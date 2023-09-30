import tippy, { roundArrow, createSingleton } from "tippy.js";

const hideOnEsc = {
  name: "hideOnEsc",
  defaultValue: true,
  fn({ hide }) {
    function onKeyDown(event) {
      if (event.keyCode === 27) {
        hide();
      }
    }
    return {
      onShow() {
        document.addEventListener("keydown", onKeyDown);
      },
      onHide() {
        document.removeEventListener("keydown", onKeyDown);
      },
    };
  },
};

tippy.setDefaultProps({
  theme: null,
  allowHTML: true,
  arrow: roundArrow,
  plugins: [],
});

export default tippy;
export { tippy, hideOnEsc, createSingleton, roundArrow };
