import starlight from "@astrojs/starlight";
import { defineConfig } from "astro/config";
import rehypeKatex from "rehype-katex";
import remarkMath from "remark-math";

export default defineConfig({
  integrations: [
    starlight({
      credits: true,
      customCss: ["katex/dist/katex.css"],
      description:
        "Notes taken while I attend software engineering lessons at the University of Trento.",
      editLink: {
        baseUrl: "https://git.zarantonello.dev/davide/ice-notes/_edit/main",
      },
      social: [
        {
          href: "https://git.zarantonello.dev/davide/ice-notes",
          icon: "seti:git",
          label: "Source code",
        },
      ],
      title: "ICE notes",
    }),
  ],
  markdown: {
    rehypePlugins: [rehypeKatex],
    remarkPlugins: [remarkMath],
  },
});
