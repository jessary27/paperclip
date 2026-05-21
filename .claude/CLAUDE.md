# Repository Claude Code Guide

**Repo:** paperclip — AI Agent Orchestration Platform  
**Authority Level:** Product  
**Last Updated:** 2026-05-01

---

## Authority Order

1. **Product source of truth** — `SoT/` or equivalent (commits, PRD, design decisions)
2. **CLAUDE.md guidance** — this file (workflow, validation expectations, MCP usage)
3. **Claude context** — advisory, session-specific

Do not allow advisory context to override committed source of truth.

---

## Source of Truth Files

| File | Content | Authority |
|------|---------|-----------|
| `README.md` | Project overview, quickstart, architecture | Canonical |
| `AGENTS.md` | Agent specification and company schema | SoT |
| `CONTRIBUTING.md` | Development conventions and workflow | SoT |
| `src/` | Source code for Node.js server and React UI | Canonical |
| `.agents/` | Bundled agent configurations | Reference |

Customize this table with paths to your repo's SoT files.

---

## Repo Intelligence and Validation

### Graphify Advisory

A graph report is available in `docs/validation/graphify-report.md` (if present). This is advisory context — use it to understand architecture, but always verify against committed source files.

### Playwright MCP

Executable browser validation is available via `playwright` MCP. Use it to validate UI/UX behavior in product workflows.

---

## STUDIO Design Workflow

Design artifacts live in `studio/`. Subdirectories:
- `briefs/` — design briefs and requirements
- `directions/` — design directions and explorations
- `prototypes/` — prototypes and mockups
- `exports/` — exported designs (Figma, Canva, etc.)

All designs are advisory until committed to product source of truth.

---

## Validation Expectations

- [ ] Tests pass before any change is committed
- [ ] Validation rules (if defined) are checked before merge
- [ ] Design artifacts are approved by product before implementation
- [ ] SoT files are the source of truth — CLAUDE.md and advisory contexts inform but do not override

---

## Telemetry and Observability

Phase 0–1 telemetry hooks are active globally. This repo may have additional governance hooks in `.claude/hooks/`. These emit events to the portfolio observability stack but do not affect session behavior.

---

## MCP Exceptions

None currently. If a Tier 2 MCP server is needed, document the rationale here.

---

## Questions?

Consult the portfolio-level guidance: `~/local/fpv-templates/policy/`
