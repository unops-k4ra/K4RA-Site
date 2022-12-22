const defaultTheme = require('tailwindcss/defaultTheme');


/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,md,liquid,erb,serb,rb}",
    "./frontend/javascript/**/*.js",
  ],
  theme: {
    extend: {
      fontFamily: {
        display: ['VF Sans', ...defaultTheme.fontFamily.sans],
        sans: ['Open Sans', ...defaultTheme.fontFamily.sans],
      },
      maxWidth: {
        "screen-default": "1440px",
      },
      colors: {
        kra: {
          blue: "#0092D1",
          darkblue: "#00205B",
          "darkblue-light": "#4D638C",
          "darkblue-lightest": "#E6E9EF",
          "darkblue-lighter": "#99A6BD",
          red: "#FF0000",
          darkred: "#C8102E",
          offblack: "#333F44",
          offwhite: "#E6E9EF",
          text: "#333F44",
          success: "#73BC76",
          button: "#0092D1",
          border: "#E6E9EF",
        },
      },
    },
  },
  plugins: [require("@tailwindcss/typography")],
};
