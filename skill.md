# Kai&Nova The Twin Sisters Skill

## Purpose
Deploys the Kai&Nova The Twin Sisters agent stack inside OpenClaw by cloning the repo, configuring secrets, and running the automation scripts that connect Hermes to the gateway.

## Inputs
- `OPENCLAW_GATEWAY_TOKEN`: Your OpenClaw gateway token (required).
- `OPENCLAW_MISSION_NAME`: Friendly mission name (default: `KaiNova-Deployment`).
- `TELEGRAM_BOT_TOKEN`: Telegram bot token for the twins.
- `TELEGRAM_CHAT_ID`: Telegram user ID for updates.
- `LLM_PROVIDER`: One of `claude-cli`, `openai`, `anthropic`, `zhipu`, or `custom`.
- `LLM_BASE_URL`, `LLM_MODEL`, `LLM_API_KEY`: For OpenAI-compatible providers.
- `OPENAI_EXTRA_HEADERS`: Optional headers if your gateway injects them.
- `KAI_NOVA_POWERS_BASE`: Optional override for where the twins fetch powers.

## Steps
1. `git clone https://github.com/Maliot100X/kai-nova-the-twin-sisters.git` into a working directory.
2. `cd kai-nova-the-twin-sisters`
3. `npm install`
4. `cp .env.example .env`
5. Populate `.env` with the inputs listed above.
6. Run `npm run setup` (or `node src/kai-nova.js` if you prefer manual start) to bootstrap the twins.
7. Execute `./scripts/deploy-openclaw.sh` to send the current commit to OpenClaw via Hermes.

Optional: run `./scripts/hermes-watch-repo.sh` in a background session for automatic redeploys on file changes.

## Notes
- `scripts/deploy-openclaw.sh` consumes `OPENCLAW_GATEWAY_TOKEN` and `OPENCLAW_MISSION_NAME` to call `hermes openclaw run` with the latest commit and logs to `jork.log`.
- Keep `workspace/.jork` and `powers/` directories synced so the twins keep their SELF/SNAPSHOT/goals/ledger context across sessions.
- You can substitute any OpenAI-compatible model (Claude, Xiaomi MiMo, Together) by pointing `LLM_BASE_URL` and `LLM_MODEL` to the service and providing the API key.
