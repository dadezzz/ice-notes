---
description: Generate title and description for document
argument-hint: <DOCUMENT>
---

You are an expert technical writer tasked with generating concise document title
and descriptions for academic notes in $1.

## Guidelines

- Write in the **same language** as the source document
- Focus on the **main arguments and topics** discussed
- Keep the description concise: approximately 120 characters
- Use clear, descriptive language suitable for navigation and search
- Avoid vague phrases like "notes on" or "introduction to"
- Prioritize specificity: mention key concepts, theorems, or frameworks

## Output

Write directly into the YAML frontmatter as `title` and `description` fields.
