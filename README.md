<p align="center">
  <img src="assets/kai-nova-banner.svg" alt="Kai&Nova The Twin Sisters banner" width="780" />
</p>

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
3. **Choose your LLM** — select whichever feeds your twins best:
   - **Claude Code CLI:** install from https://claude.ai/code, run `claude login`, and no API key is needed. Full tool access is unlocked.
   - **Anthropic API:** visit https://console.anthropic.com, grab a key, and optionally override `ANTHROPIC_MODEL` with `claude-sonnet-4-6` or similar.
   - **OpenAI or OpenAI-compatible endpoint:** supply `LLM_BASE_URL`, `LLM_MODEL`, and `LLM_API_KEY`. This lets you use OpenAI, DeepSeek, Groq, Together, Xiaomi MiMo, or any other provider that follows the OpenAI contract.

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

## Sponsors & partners

Kai&Nova operate inside a production-grade stack of trusted partners:

1. **OpenClaw / ClawTeam prod-team** — connects multiple agents, routes tasks, and archives mission telemetry so Kai&Nova stay synchronized with Hermes and OpenClaw swarms.
2. **OmniRoute** — secure, low-latency model routing that ensures Kai&Nova reach Claude, OpenAI, or other LLMs without exposing secrets.
3. **OpenAI / Anthropic / Claude Code** — the LLM layer; choose the provider that matches your token budget and tooling preferences.
4. **Xiaomi MiMo API & Hermes** — optional; plug-in via OpenClaw’s connectors for custom billing-sensitive deployments if desired.

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