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
    rehypePlugins: [rehypeKatex],
    remarkPlugins: [remarkMath],
  },
  site: "https://notes.zarantonello.dev",
});
