import starlight from "@astrojs/starlight";
import { defineConfig } from "astro/config";
import rehypeKatex from "rehype-katex";
import remarkMath from "remark-math";

export default defineConfig({
  integrations: [
    starlight({
      credits: true,
      customCss: [
        "katex/dist/katex.css",
        "./src/styles/code-blocks.css",
        "./src/styles/math-blocks.css",
      ],
      description:
        "Notes taken while I attend Information, Communications and Electronics (ICE) engineering lessons at the University of Trento.",
      editLink: {
        baseUrl: "https://git.zarantonello.dev/university/notes/_edit/main",
      },
      social: [
        {
          href: "https://git.zarantonello.dev/university/notes",
          icon: "seti:git",
          label: "Source code",
        },
      ],
      title: "ICE notes",
      logo: {
        src: "./public/favicon.svg",
      },
    }),
  ],
  markdown: {
    rehypePlugins: [
      [
        rehypeKatex,
        {
          macros: {
            // Sinc function.
            "\\sinc": "\\text{sinc}",
            // Derivative and partial derivative.
            "\\dv": "\\frac{d #1}{d #2}",
            "\\dvn": "\\frac{d^{#1} #2}{d #3^{#1}}",
            "\\pdv": "\\frac{\\partial #1}{\\partial #2}",
            "\\pdvn": "\\frac{\\partial^{#1} #2}{\\partial #3^{#1}}",
            // Various operators.
            "\\opRe": "\\text{Re}\\left[#1\\right]",
            // Vorious functions.
            "\\fnRect": "#1 \\Pi\\left(#2\\right)",
          },
        },
      ],
    ],
    remarkPlugins: [remarkMath],
  },
  site: "https://ice-notes.zarantonello.dev",
});
