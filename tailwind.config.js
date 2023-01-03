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
        display:  ['VF Sans', ...defaultTheme.fontFamily.sans],
        sans:     ['Open Sans', ...defaultTheme.fontFamily.sans],
      },
      maxWidth: {
        "screen-default": "1440px",
      },
      colors: {
        kra: {
          blue: {
            50:      '#E6F4FA',
            100:     '#99D3ED',
            300:     '#4DB3DF',
            DEFAULT: '#0092D1',
            700:     '#006692',
            900:     '#003A54',
          },
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

      //Set background and border color
      "th-bg":         'var(--color-bg)',
      "th-border":     'var(--color-border)',

      //Wells are used when you need to create a color variant
      "th-well":       'var(--color-well)',

      //Body fonts
      "th-primary":    'var(--color-primary)',

      //Headings or dividers
      "th-secondary":  'var(--color-secondary)',

      //Use this for links
      "th-accent": 'var(--color-accent)',

      //Use this to highlight important content
      "th-highlight":   'var(--color-highlight)',

      //Status colors
      "th-error":       'var(--color-error)',
      "th-alert":       'var(--color-alert)',
      "th-info":        'var(--color-info)',
      "th-success":     'var(--color-success)',



      kra2: {
        transparent:'transparent',
        white:      '#fff',
        black:      '#000', // Try not to use this

        neutral: {
          DEFAULT:  '#333f44',

          50:       '#f5f5f6',
          100:      '#ebecec',
          200:      '#cccfd0',
          300:      '#adb2b4',
          400:      '#70797c',
          500:      '#333f44',
          600:      '#2e393d',
          700:      '#262f33',
          800:      '#1f2629',
          900:      '#191f21',
        },
        blue : {
          DEFAULT:  '#0092D1',

          50:       '#f2fafd',
          100:      '#e6f4fa',
          200:      '#bfe4f4',
          300:      '#99d3ed',
          400:      '#4db3df',
          500:      '#0092D1',
          600:      '#0083bc',
          700:      '#006e9d',
          800:      '#00587d',
          900:      '#004866',
        },
        dblue: {
          DEFAULT:  '#00205b',

          50:       '#f2f4f7',
          100:      '#e6e9ef',
          200:      '#bfc7d6',
          300:      '#99a6bd',
          400:      '#4d638c',
          500:      '#00205b',
          600:      '#001d52',
          700:      '#001844',
          800:      '#001337',
          900:      '#00102d',
        },
        red: {
          DEFAULT:  '#ff0000',

          50:       '#fff2f2',
          100:      '#ffe6e6',
          200:      '#ffbfbf',
          300:      '#ff9999',
          400:      '#ff4d4d',
          500:      '#ff0000',
          600:      '#e60000',
          700:      '#bf0000',
          800:      '#990000',
          900:      '#7d0000',
        },
        dred: {
          DEFAULT:  '#c8102e',

          50:       '#fcf3f5',
          100:      '#fae7ea',
          200:      '#f1c3cb',
          300:      '#e99fab',
          400:      '#d9586d',
          500:      '#c8102e',
          600:      '#b40e29',
          700:      '#960c23',
          800:      '#780a1c',
          900:      '#620817',
        },
        success: {
          DEFAULT:  '#73bc76',

          300:      '#c7e4c8',
          500:      '#73bc76',
          700:      '#568d59',
        },
      },
    },
  },
  plugins: [require("@tailwindcss/typography")],
};
