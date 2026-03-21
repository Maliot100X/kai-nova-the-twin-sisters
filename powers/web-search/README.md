# web-search

Type: bash

Purpose: Run Kai&Nova's web search helper using DuckDuckGo to search a topic, gather snippets, and deliver a brief summary.

Usage:
1. Kai&Nova write the search prompt into `workspace/powers/web-search/query.txt` (or call the script manually).
2. The helper runs `curl` against DuckDuckGo, collects the page titles, and returns a short list of relevant results.
3. Feed the summary back into Kai&Nova's context if a deeper dive is required.
