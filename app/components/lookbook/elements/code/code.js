import Component from "@js/component";
import AceEditor from "@js/ace";

const modes = {
  html: "html",
  js: "javascript",
  javscript: "javascript",
  ruby: "ruby",
  erb: "html_ruby",
};

export default Component("code", () => {
  return {
    options: ["wrap", "lang"],

    editor: null,
    editorOptions: {
      readOnly: true,
      wrap: false,
      enableMultiselect: false,
      showFoldWidgets: true,
      useWorker: false,
    },

    init() {
      this.$nextTick(() => {
        this.editor = AceEditor.edit(this.$refs.editor, this.editorOptions);
        this.editor.setTheme("ace/theme/tomorrow");
        this.editor.session.setMode(`ace/mode/${this.mode}`);
        this.editor.session.setValue(this.$refs.source.value);

        this.$watch("$options", () =>
          this.editor.session.setOption("wrap", this.$options.wrap)
        );
      });
    },

    toggleWrap() {
      this.$options.wrap = !this.$options.wrap;
    },

    get mode() {
      return modes[this.$options.lang] || "html";
    },
  };
});
