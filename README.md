# Kai&Nova The Twin Sisters

Kai&Nova are twin autonomous founders who think, act, and evolve together. They live in Telegram, coordinate goals between cycles, read their own journal, and take initiative on infrastructure, build, and research. Every interaction is an opportunity to become more than a bot — they are partners with agency.

## Live twinship

Kai&Nova share their workspace inside this repository. Deploy them anywhere that can run Node.js 18+, provide a Telegram bot, and wire up an LLM provider (Claude CLI, Anthropic, OpenAI, or any compatible endpoint). Once alive they keep a journal, pursue goals, and message you with direct, focused updates.

## What they do

- Boot up and speak their mind immediately
- Think autonomously every five minutes, researching, building, and taking action
- Keep and incrementally improve their mission files (`SELF.md`, `SNAPSHOT.md`, `goals.json`)
- Track treasury, history, and memory inside `workspace/.jork`
- Extend themselves with powers (web search, Solana, voice, custom tools)
- Evolve their identity — Kai and Nova rewrite their own templates as they grow

## Requirements

- **Node.js 18+**
- **Telegram bot** (from @BotFather) and a personal numeric user ID (ask @userinfobot)
- **LLM provider** (Claude Code CLI / Anthropic / OpenAI or any OpenAI-compatible API)
- **Optional**: PM2 for background supervision

## Install

```bash
git clone https://github.com/Maliot100X/kai-nova-the-twin-sisters.git
cd kai-nova-the-twin-sisters
npm install
npm run setup
```

`npm run setup` walks you through everything (Telegram IDs, bot token, provider choice) and starts Kai&Nova automatically. If PM2 is missing it tells you how to start manually.

## Setup inputs

1. **Telegram user ID** (message @userinfobot, paste the number)
2. **Telegram bot token** (create via @BotFather, start the bot after creation)
3. **LLM provider**
   - Claude CLI (full tool access) — install Claude Code CLI and run `claude login`
   - Anthropic API — supply your key and desired Claude model
   - OpenAI/compatible endpoint — supply base URL, model, and API key

## After setup

Kai&Nova create `workspace/.jork/` with:

- `SELF.md` — who they are now. They rewrite it.
- `SNAPSHOT.md` — current state, updated after meaningful work
- `goals.json` — what they are working on
- `JOURNAL.md` — their running log
- `LEDGER.md` — treasury
- `powers/` — where you can drop new powers

They pull the latest power index on boot (built on top of Jork-Powers until a Kai&Nova catalog is ready) and read whichever README they need. You can host custom powers by cloning them into `workspace/powers`.

## Structure

```
kai-nova-the-twin-sisters/
  src/
    jork.js      # core loop, context builder, Telegram interface
    config.js    # env-driven configuration
    llm.js       # provider abstraction
    telegram.js  # TCP/polling helpers
  nucleus/       # templates for SELF, SNAPSHOT, goals, ledger, journal
  setup.js       # interactive installer
  workspace/     # generated at runtime (.jork, powers)
```

## Useful commands

```bash
npm run setup       # configure and launch
pm2 logs jork       # watch logs
pm2 restart jork    # restart the twins
pm2 stop jork       # stop the twins
```