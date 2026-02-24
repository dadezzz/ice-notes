import { defineCollection } from "astro:content";
import { docsLoader } from "@astrojs/starlight/loaders";
import { docsSchema } from "@astrojs/starlight/schema";
import { glob } from "astro/loaders";
import { z } from "astro/zod";

export const collections = {
  courses: defineCollection({
    loader: glob({ pattern: "*/*/*/course.json", base: "./src/content/docs" }),
    schema: z.object({
      code: z.string().length(6),
      name: z.string().nonempty(),
      professors: z.array(z.string().nonempty()),
    }),
  }),
  docs: defineCollection({
    loader: docsLoader(),
    schema: docsSchema({ extend: z.object({ lang: z.optional(z.string()) }) }),
  }),
};
