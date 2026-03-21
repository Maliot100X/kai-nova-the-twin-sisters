# Kai&Nova Demo Preview

This folder is your production-ready landing page. It now features an animated hero, tabbed overview of every repo capability, automation timelines, trails, and social links (Twitter + GitHub). Deploy it to Vercel or host it anywhere static.

## Deploy to Vercel

1. Import the repo into Vercel.
2. Set the root directory to `preview/` so it serves this page exactly.
3. (Optional) Define `NEXT_PUBLIC_KAI_NOVA_TAG` to customize the hero subtitle.
4. Trigger a production deploy. Once live, `https://kai-nova-the-twin-sisters.vercel.app` will render this UI.

## Local preview

```bash
npx serve preview
# or
python3 -m http.server --directory preview 4190
```

## Tabs

- **Overview** — stacks the README narrative (Node, Telegram, LLM provider agnostic).
- **Automation & OpenClaw** — describes the deploy scripts, Hermes, OmniRoute, and trails.
- **Powers & Trails** — spells out each power plus observability + memory search.
- **Demos** — lists deployment commands and the sync pipeline cards.
- **Socials** — shows Twitter & GitHub links plus sponsor credits.
