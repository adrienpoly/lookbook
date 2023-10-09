import Alpine from "./alpine-csp";
import morph from "@alpinejs/morph";
import { registerComponents } from "@helpers/alpine";
import options from "@js/alpine/plugins/options";
import * as components from "../../../app/components/lookbook/**/*.js";

window.Alpine = Alpine;

// Third party plugins

Alpine.plugin(morph);

// Bespoke plugins

Alpine.plugin(options);

// Register components

registerComponents(components);

// Start

Alpine.start();
