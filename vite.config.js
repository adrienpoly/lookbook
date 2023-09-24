import { resolve } from "path";
import { defineConfig } from "vite";
import RubyPlugin from "vite-plugin-ruby";
import FullReload from "vite-plugin-full-reload";

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload([
      "config/routes.rb",
      "app/views/**/*",
      "app/components/**/*.{rb,erb}",
    ]),
  ],
  resolve: {
    alias: {
      "@components": resolve(__dirname, "app/components/lookbook"),
      "@assets": resolve(__dirname, "assets"),
      "@css": resolve(__dirname, "assets/css"),
      "@js": resolve(__dirname, "assets/js"),
      "@helpers": resolve(__dirname, "assets/js/helpers"),
      "@npm": resolve(__dirname, "node_modules"),
    },
  },
  css: {
    postcss: {
      plugins: [
        require("tailwindcss/nesting"),
        require("tailwindcss"),
        require("autoprefixer"),
      ],
    },
  },
});
