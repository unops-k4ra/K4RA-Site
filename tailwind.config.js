/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{html,md,liquid,erb,serb,rb}",
    "./frontend/javascript/**/*.js",
  ],
  theme: {
    extend: {
      colors: {
        kra: {
          blue: "#0092D1",
          darkblue: "#00205B",
          "darkblue-lightest": "#E6E9EF",
          "darkblue-lighter": "#99A6BD",
          red: "#FF0000",
          darkred: "#C8102E",
          offblack: "#333F44",
          offwhite: "#E6E9EF",
          text: "#0092D1",
          success: "#73BC76",
          button: "#0092D1",
          border: "#E6E9EF",
        },
      },
    },
  },
  plugins: [],
};
