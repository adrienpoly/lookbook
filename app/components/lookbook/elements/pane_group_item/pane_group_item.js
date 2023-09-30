export default function paneGroupItem(type, sizes) {
  return {
    type,
    id: null,
    hidden: false,

    size: {
      ...sizes,
    },

    getSize(layout) {
      return this.hidden ? "1px" : this.size[layout];
    },

    setSize(layout, size) {
      this.size[layout] = size;
    },

    root: {
      [":class"]() {
        return {
          "pane-group-hidden": this.hidden,
        };
      },

      [":style"]() {
        return {
          "grid-area": this.id,
        };
      },
    },
  };
}
