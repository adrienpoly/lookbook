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
      "@components": resolve(__dirname, "app/components"),
      "@assets": resolve(__dirname, "app/assets"),
      "@css": resolve(__dirname, "app/assets/css"),
      "@js": resolve(__dirname, "app/assets/js"),
      "@helpers": resolve(__dirname, "app/assets/js/helpers"),
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
