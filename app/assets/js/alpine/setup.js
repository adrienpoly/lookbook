import Alpine from "alpinejs";
import morph from "@alpinejs/morph";
import options from "@js/alpine/plugins/options";

// Third party plugins

Alpine.plugin(morph);

// Bespoke plugins

Alpine.plugin(options);

// Register components

const components = import.meta.glob("@components/**/*.js", { eager: true });

for (const path in components) {
  const component = components[path];
  const name = path.split(/[\\/]/).pop().replace(".js", "");
  Alpine.data(name, component.default);
}

// Start

Alpine.start();
window.Alpine = Alpine;
