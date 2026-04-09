# Forking This Repository

If you've forked this repository, follow this workflow to stay synchronized with upstream changes while maintaining your local customizations.

## Upstream Sync Workflow

This repository uses a branching strategy to manage upstream changes safely without overwriting local customizations.

### Branch Structure

- **`master`** — Tracks upstream paperclip (read-only, pull updates only)
- **`dev`** — Your local development branch (where you commit customizations)

### How to sync upstream changes

```bash
# 1. Switch to master and pull latest upstream
git checkout master
git pull origin master

# 2. Switch to dev and merge upstream changes
git checkout dev
git merge master

# 3. Resolve any conflicts (if they exist)
# Edit conflicted files, then:
git add .
git commit -m "merge: sync upstream changes into dev"

# 4. Push your merged dev back to GitHub
git push origin dev
```

### Key points

- Never push to `master` directly — it's upstream-only
- Always work on the `dev` branch
- When upstream changes arrive, `git merge master` brings them in safely without overwriting your work
- Your local customizations stay protected through merge commits
