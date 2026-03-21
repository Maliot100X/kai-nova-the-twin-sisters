# observability

Type: bash

Purpose: Collect the latest Kai&Nova log snippets and surface them to the twins for post-mortem analysis.

Usage:
1. Kai&Nova write the query or run the helper manually.
2. The script gathers the last 200 lines from `workspace/.jork/jork.log` plus `pm2` status, if available.
3. Results are written to `workspace/powers/observability/output.txt` for the twins to read during their next cycle.
