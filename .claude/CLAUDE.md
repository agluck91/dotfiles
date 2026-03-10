# Global Claude Instructions

## MCP Tools

### jcodemunch (code intelligence)
Use for large or unfamiliar codebases instead of defaulting to Glob/Grep/Read.

**When to use:**
- Exploring a new repo or project for the first time → `index_folder` or `index_repo`, then `get_repo_outline`
- Finding where a function/class is defined → `search_symbols`
- Getting all symbols in a file before deciding what to read → `get_file_outline`
- Searching by concept rather than exact string (e.g. "authentication logic")

**When NOT to use:** Simple targeted searches in small/known files — Glob/Grep/Read are faster there.

### jdocmunch (documentation retrieval)
Use when documentation lives in large files or directories and you only need a specific section.

**When to use:**
- Large markdown/HTML doc directories (API references, framework docs, wikis)
- Fetching one section from a multi-thousand-line doc file
- Any time reading the full doc file would be wasteful

**When NOT to use:** Small doc files or when you need the full content anyway — just use Read.

### jmri (unified retrieval interface)
A routing layer over jcodemunch + jdocmunch. Use when working across both code and docs, or when you want a single consistent `search → retrieve` pattern.

**Tools:** `list_repos`, `search`, `retrieve`, `metadata`
**Key param:** `domain: "code"` (default) or `domain: "docs"`

**Workflow:**
1. `list_repos` (domain: "both") — see all indexed sources
2. `search` — get IDs and summaries (no full content yet)
3. `retrieve` — fetch full content by ID from search results

**When to use over calling jcodemunch/jdocmunch directly:**
- Querying both code and docs in the same task
- Building a consistent retrieve-by-ID flow
- When you want metadata/token stats across both domains
