# GitHub komandos

## Issue ir PR
- `gh issue create --title "..." --body "..."`
- `gh pr create --title "..." --body "..."` → aprašo pabaigoje `Closes #N` uždaro Issue po sujungimo
- `gh pr list --state all`
- `gh pr merge --merge`

## Apsauga
- Settings → Branches → `main` → Require a pull request before merging
- Tiesioginis `git push` į apsaugotą `main` atmetamas
- Vietinį nepriimtą commit'ą atšaukiate `git reset --soft HEAD~1`, tada `git restore .`
