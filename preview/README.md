# Kai&Nova Demo Preview

This folder hosts the static landing page you can deploy to Vercel or any static host. It reads directly from `preview/index.html` and visualizes the key capabilities of your repository.

## Deployment instructions

1. Run `git push` so this folder is available on GitHub.
2. Import the repo into Vercel and set the Root Directory to `preview/`.
3. Optionally create environment variables such as `NEXT_PUBLIC_KAI_NOVA_TAG` to customize the hero text.
4. Trigger a Vercel deployment — the build step is just `vercel build` and the output is the static HTML/CSS you see here.

Want to preview locally?

```bash
npx serve preview
you can also run: python3 -m http.server --directory preview 4190
```

## What the page highlights

- Hero + CTA pointing back to the main README for setup instructions.
- Feature cards describing automation, powers, and multi-LLM readiness.
- Automation scripts section showing how to wire `deploy-openclaw.sh` and `hermes-watch-repo.sh`.
- Pipeline section that mirrors Hermes/ClawTeam operations so visitors see how commits trigger openclaw deployments.

Build more sections if you want to demo other pipelines (Droyd, OmniRoute, Observability). Once Vercel publishes, share the preview URL with teammates and showcase the Kai&Nova twins before the Telegram launch.