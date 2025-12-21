import starlight from "@astrojs/starlight";
import { defineConfig } from "astro/config";
import rehypeKatex from "rehype-katex";
import remarkMath from "remark-math";

export default defineConfig({
  integrations: [
    starlight({
      credits: true,
      customCss: ["katex/dist/katex.css", "./src/styles/code-blocks.css", "./src/styles/math-blocks.css"],
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
            // Shorthands.
            "\\dv": "\\frac{d #1}{d #2}", // First degree derivative.
            "\\dvn": "\\frac{d^{#1} #2}{d #3^{#1}}", // Arbitrary degree derivative.
            "\\pdv": "\\frac{\\partial #1}{\\partial #2}", // First degree partial derivative.
            "\\pdvn": "\\frac{\\partial^{#1} #2}{\\partial #3^{#1}}", // Arbitrary degree partial pure derivative.
            "\\C": "\\mathbb{C}", // Complex numbers set.
            // Various operators.
            "\\Re": "\\text{Re}\\left[#1\\right]", // Real part of complex number.
            "\\Im": "\\text{Im}\\left[#1\\right]", // Immaginary part of complex number.
            "\\Z0": "Z_0\\left[#1\\right]", // Response of a circuit.
            "\\arg": "\\text{arg}\\left(#1\\right)", // Argument of a complex number.
            // Various functions.
            "\\fRectangle": "\\Pi\\!\\left(#1\\right)", // Rectangle from signal processing.
            "\\fThriangle": "\\Lambda\\!\\left(#1\\right)", // Thriangle from signal processing.
            "\\fSign": "s\\!\\left(#1\\right)", // Sign function.
            "\\fStep": "\\theta\\!\\left(#1\\right)", // Step function.
            "\\fDelta": "\\delta\\!\\left(#1\\right)", // Dirac delta function.
            "\\fLog": "\\text{log}\\!\\left(#1\\right)", // Logarithm.
            "\\fLogn": "\\text{log}_{#1}\\!\\left(#2\\right)", // Logarithm.
            "\\fLn": "\\text{log}\\!\\left(#1\\right)", // Natural logarithm.
            "\\fP": "\\mathbb{P}\\!\\left(#1\\right)", // Probability.
            // Angular functions with adaptive parentheses.
            "\\fArctan": "\\text{arctan}\\!\\left(#1\\right)",
            "\\fCos": "\\text{cos}\\!\\left(#1\\right)",
            "\\fSinc": "\\text{sinc}\\!\\left(#1\\right)",
            "\\fSin": "\\text{sin}\\!\\left(#1\\right)",
            "\\fTan": "\\text{tan}\\!\\left(#1\\right)",
            // Transform notation with double arrow.
            "\\trFourierA": "\\xleftrightarrow{\\mathcal{F}}",
            "\\trFourierB": "\\mathcal{F}\\left\\{#1\\right\\}",
            "\\trLaplaceA": "\\xleftrightarrow{\\mathcal{L}}",
            "\\trLaplaceB": "\\mathcal{L}\\left\\{#1\\right\\}",
          },
        },
      ],
    ],
    remarkPlugins: [remarkMath],
  },
  site: "https://ice-notes.zarantonello.dev",
});
