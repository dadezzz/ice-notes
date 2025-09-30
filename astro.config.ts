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
        "./src/styles/scroll-display-math.css",
        "./src/styles/code-blocks.css",
      ],
      description:
        "Notes taken while I attend software engineering lessons at the University of Trento.",
      editLink: {
        baseUrl: "https://git.zarantonello.dev/university/notes/_edit/main",
      },
      sidebar: [
        {
          label: "1° anno",
          items: [
            {
              label: "1° semestre",
              collapsed: true,
              items: [
                {
                  label: "Geometria e algebra lineare",
                  autogenerate: {
                    directory: "anno-1/semestre-1/geometria-e-algebra-lineare",
                  },
                },
              ],
            },
            {
              label: "2° semestre",
              items: [
                {
                  label: "Analisi 2",
                  autogenerate: { directory: "anno-1/semestre-2/analisi-2" },
                },
              ],
            },
          ],
        },
        {
          label: "2° anno",
          items: [
            {
              label: "1° semestre",
              items: [
                {
                  label: "Fisica 2",
                  autogenerate: { directory: "anno-2/semestre-1/fisica-2" },
                },
                {
                  label: "Fondamenti di comunicazioni: reti",
                  autogenerate: { directory: "anno-2/semestre-1/reti" },
                },
                {
                  label:
                    "Fondamenti di comunicazioni: elaborazione dei segnali",
                  autogenerate: {
                    directory: "anno-2/semestre-1/elaborazione-dei-segnali",
                  },
                },
                {
                  label: "Fondamenti di elettronica: reti logiche",
                  autogenerate: { directory: "anno-2/semestre-1/reti-logiche" },
                },
                {
                  label:
                    "Sistemi di elaborazione: introduzione al machine learning",
                  autogenerate: {
                    directory:
                      "anno-2/semestre-1/introduzione-al-machine-learning",
                  },
                },
              ],
            },
          ],
        },
      ],
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
    rehypePlugins: [rehypeKatex],
    remarkPlugins: [remarkMath],
  },
  site: "https://notes.zarantonello.dev",
});
