module.exports = {
  content: ["./app/views/**/*.erb", "./app/components/**/*.{erb,js}"],
  safelist: [
    {
      pattern: /tippy-.+/,
    },
    {
      pattern: /cm-.+/,
    },
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
