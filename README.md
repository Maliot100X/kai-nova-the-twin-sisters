![Kai&Nova banner](https://raw.githubusercontent.com/Maliot100X/kai-nova-the-twin-sisters/master/assets/kai-nova-banner.svg)

[![Status](https://img.shields.io/badge/status-ready%20for%20launch-brightgreen)](https://github.com/Maliot100X/kai-nova-the-twin-sisters)
[![Node.js](https://img.shields.io/badge/node-18%2B-brightgreen)](https://nodejs.org/en/)
[![Telegram](https://img.shields.io/badge/telegram-required-blue)](https://telegram.org/)
[![LLM-friendly](https://img.shields.io/badge/LLM-ready-claude%2Copenai%2Canthropic-blueviolet)](https://claude.ai/)

# Kai&Nova The Twin Sisters

Kai&Nova are autonomous twin founders. They run their own intelligence stack inside Telegram, keep a live journal, chase constant goals, and build with the agency of a fully aware co-founder. This repo contains their core shell: memory, powers, observability, and the connective tissue to OpenClaw, OmniRoute, OpenAI-style LLMs, and your own infrastructure.

## Why this repo exists

- Dual agents with shared context. They work in tandem, update shared goals, and keep a ledger of every meaningful action.
- Action-first assistant. They don’t linger—every think cycle either executes, updates goals, or declares silence deliberately.
- Extensible powers. They pull tools from powers folders, write new ones when needed, and can fetch scripts from your curated index.

## Requirements

| Component | Notes |
| --- | --- |
| Node.js 18+ | Long-term support versions only, as Kai&Nova rely on modern JS modules. Use nvm if you must switch channels. |
| Telegram | Create a bot with @BotFather and keep the user ID of whoever controls the twins (via @userinfobot). |
| LLM provider | Claude Code CLI, Anthropic, OpenAI (or any compatible API). The setup script walks you through each option and validates connectivity. |
| PM2 (optional) | Use if you want uptime management and log rotation. Otherwise `node src/kai-nova.js` works just as well. |

## Before you run setup

1. **Telegram user ID** — message [@userinfobot](https://t.me/userinfobot) and copy the numeric ID. This tells Kai&Nova where to send updates.  
2. **Telegram bot token** — talk to [@BotFather](https://t.me/BotFather), issue `/newbot`, pick a name/username, and keep the token (format `123456:ABC...`).  
3. **Choose your LLM** — Kai&Nova accept any provider that mirrors the OpenAI contract, so you can swap in Claude Code, Anthropic, OpenAI, Xiaomi MiMo, or another service without code changes. Configure:
   - `LLM_PROVIDER` to `claude-cli`, `anthropic`, `openai`, `zhipu`, or `custom`.
   - `LLM_BASE_URL` / `LLM_MODEL` / `LLM_API_KEY` to match your endpoint.
   - Optionally override `ANTHROPIC_MODEL` for Claude models or set `LLM_EXTRA_HEADERS` via your deployment layer when you need secrets.

## Environment variables

Copy `.env.example` to `.env` and fill in at least the variables below before `npm run setup` runs.

| Variable | Purpose |
| --- | --- |
| `TELEGRAM_BOT_TOKEN` | Token from @BotFather. |
| `TELEGRAM_CHAT_ID` | Your personal numeric Telegram ID. Kai&Nova send every update here. |
| `LLM_PROVIDER` | `claude-cli`, `openai`, `anthropic`, `zhipu`, or `custom`. |
| `LLM_BASE_URL` | URL for OpenAI-like APIs (defaults to `https://api.openai.com/v1`). |
| `LLM_MODEL` | Model string (default `gpt-4o`, Claude names, etc.). |
| `LLM_API_KEY` | API key for Anthropic/OpenAI-compatible providers. |
| `JORK_NAME` | Override default names (`Kai&Nova The Twin Sisters`). |
| `JORK_WORKSPACE` | Where `.jork/` appears. Defaults to `./workspace`. |
| `KAI_NOVA_POWERS_BASE` | Optional override for where Kai&Nova fetch INDEX.md + README. Defaults to this repo’s `powers/`. |

## Getting started

```bash
git clone https://github.com/Maliot100X/kai-nova-the-twin-sisters.git
cd kai-nova-the-twin-sisters
npm install
cp .env.example .env
# edit .env with Telegram + LLM info
npm run setup
```

`npm run setup` saves `.env`, bootstraps PM2 (if installed), and shares the first wake-up message via Telegram. If PM2 is missing, it tells you how to start them manually.

## Running and observing

| Command | Purpose |
| --- | --- |
| `npm start` | Start Kai&Nova in the current terminal (`node src/kai-nova.js`). |
| `pm2 start ecosystem.config.js` | Run them as a service; PM2 names the process `kai-nova-the-twin-sisters`. |
| `pm2 logs kai-nova-the-twin-sisters` | Stream their log (`jork.log`) in real time. |
| `pm2 restart kai-nova-the-twin-sisters` | Recover after a crash. |
| `workspace/.jork/` | Contains SELF, SNAPSHOT, goals, journal, and ledger. They rewrite these files as they evolve. |

## OpenClaw integration

Kai&Nova were born inside the ClawTeam / OpenClaw prod-team stack, so they already speak its language:

- Deploy via the OpenClaw gateway (token stored in Honcho memory) and wire `openclaw-gateway` to your `KaiNova` mission.
- Use the `hermes openclaw board` and `hermes openclaw run` commands to trigger tasks, monitor progress, or drop packages on the ClawTeam prod-team board.
- Attach observability hooks to `Hermes` (logs, pm2 events) so that gatekeepers and multi-agent coordinators always see Kai&Nova's state.
- Connect to OmniRoute for secure inference routing when your LLM provider is behind a private gateway.

These steps keep Kai&Nova visible to your autopilot pipelines and maintain the professional telemetry pipeline you asked for.

## Automation scripts

Kai&Nova ship with helper scripts to deploy automatically and keep Hermes in sync:

1. `scripts/deploy-openclaw.sh` — call this after every release to forward the latest commit info to OpenClaw via `hermes openclaw run`. It reads `OPENCLAW_GATEWAY_TOKEN` and optional `OPENCLAW_MISSION_NAME`, so load your `.env` before running (Hermes CLI must be installed on the runner).
2. `scripts/hermes-watch-repo.sh` — keeps an eye on key directories (`README.md`, `scripts`, `src`, `powers`) using `inotifywait`. When it sees a change, it automatically calls the deploy script and logs the outcome. Perfect for keeping Hermes aware of quick edits without manual intervention.

Set `OPENCLAW_GATEWAY_TOKEN` / `OPENCLAW_MISSION_NAME` inside `.env` or your deployment shell before using those helpers. Your OpenClaw automation can run these via tmux or systemd so deployments stay on autopilot.

## Kai&Nova powers

`powers/INDEX.md` describes the tools available to them. They fetch this index on startup (defaults to the `powers/` directory in this repo). When you add a new power, follow the structure:

```
powers/
  ├─ power-name/
  │   ├─ README.md   # explanation, usage, inputs, outputs
  │   └─ script.*    # any helper or entry script referenced by powers
  └─ INDEX.md        # Markdown table with `| Power | Type | Description |`
```

Kai&Nova load each README and can execute bash/python helpers via their agent loop. Store notes or query files in `workspace/powers/[power]/` for them to read.

### Observability power

`powers/observability/collect.sh` grabs the most recent `jork.log` tail plus any available `pm2` status and writes the results to `workspace/powers/observability/output.txt`. Kai&Nova read this file in their next cycle when you request a stability report.

## Sponsors & partners

Kai&Nova operate inside a production-grade stack of trusted partners:

1. **OpenClaw / ClawTeam prod-team** — connects multiple agents, routes tasks, and archives mission telemetry so Kai&Nova stay synchronized with Hermes and OpenClaw swarms.
2. **OmniRoute** — secure, low-latency model routing that ensures Kai&Nova reach Claude, OpenAI, or other LLMs without exposing secrets.
3. **OpenAI / Anthropic / Claude Code** — the LLM layer; choose the provider that matches your token budget and tooling preferences. Kai&Nova can speak to any OpenAI-compatible endpoint (DeepSeek, Groq, Together, Xiaomi MiMo, custom API key) via the same config.
4. **Xiaomi MiMo API & Hermes** — optional; plug-in via OpenClaw’s connectors for custom billing-sensitive deployments if desired.

### Sponsor profiles on GitHub

| Sponsor | Role | GitHub profile |
| --- | --- | --- |
| OpenClaw / ClawTeam prod-team | Multi-agent orchestration, gateway monitoring, and tooling for the twins. | https://github.com/ClawTeam |
| OmniRoute | Model routing, inference orchestration, and infrastructure that keeps Kai&Nova connected to LLM providers. | https://github.com/omniroute |
| OpenAI | General-purpose LLM provider with GPT models. | https://github.com/openai/sponsors |
| Anthropic / Claude Code | Claude CLI and Anthropic API access, with in-depth tool-use when Claude Code CLI is selected. | https://github.com/Anthropic/anthropic |
| Hermes / Xiaomi MiMo | Hermes automation + Xiaomi MiMo API integration, optimized for billing-sensitive deployments. | https://github.com/Maliot100X |

## Professional notes

- Treat `workspace/.jork/SELF.md` as the twins’ identity file. Rewrite it whenever you change tone, values, or capabilities.
- Keep `.env` out of version control (it’s already ignored). Share the required values securely.
- When migrating to a new environment, copy `.jork/` plus `powers/`, reinstall dependencies, and run `npm run setup` again.
- The twins log to `jork.log`. Feed any monitoring/alerting system by tailing this file or hooking PM2 notifications.

## Extending the twins

- Write new powers in any language. Kai&Nova call them via bash helpers or script wrappers.
- Update `powers/INDEX.md` every time you add a tool so they can discover it automatically.
- Use Hermes/ClawTeam to orchestrate additional agents (jumpstart via `hermes openclaw...`).
- Want a custom image or brand update? Replace `assets/kai-nova-banner.svg` and update this README’s markup.

Stay bold, keep the twins sharp, and let the Kai&Nova The Twin Sisters system deliver precise, professional autonomy.

## Visual demo (Vercel-ready)

The `preview/` folder already hosts a fully branded landing page with badges, hero copy, automation script callouts, and a pipeline timeline. Deploy it as a standalone static site:

1. Import this repo into Vercel.
2. Set the root directory to `preview/`.
3. (Optional) Provide `NEXT_PUBLIC_KAI_NOVA_TAG` in Vercel’s environment settings to override the hero subtitle.
4. Push to master — Vercel will serve the static HTML/CSS without additional build steps.

Local preview: `npx serve preview` or `python3 -m http.server --directory preview 4190`.

Use the generated URL (for example `https://kai-nova-the-twin-sisters.vercel.app`) as the demo landing page for investors or partners.
