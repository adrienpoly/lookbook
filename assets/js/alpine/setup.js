import Alpine from "./alpine-csp";
import morph from "@alpinejs/morph";
import { camelCase } from "lodash";
import options from "@js/alpine/plugins/options";

window.Alpine = Alpine;

// Third party plugins

Alpine.plugin(morph);

// Bespoke plugins

Alpine.plugin(options);

// Register components

const components = import.meta.globEager("@components/**/*.js");
for (const path in components) {
  const component = components[path];
  const name = path.split(/[\\/]/).pop().replace(".js", "");
  Alpine.data(camelCase(name), component.default);
}

// Start

Alpine.start();
