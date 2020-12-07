module.exports = {
  purge: {
    mode: "all",
    content: ["./Web/View/**/*.hs", "./assets/**/*.css", "./styles/**/*.css"],
  },
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {
      backgroundColor: ["hover"],
    },
  },
  plugins: [],
};
