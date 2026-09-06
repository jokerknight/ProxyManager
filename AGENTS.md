# Repository Guidelines

## Project Structure & Module Organization

Shell-based proxy manager.

- `install.sh` downloads the runtime script, updates the user’s Bash or Zsh startup file, and handles removal.
- `src/proxy-setup.sh` is the runtime module sourced by the shell. It owns proxy detection, environment variables, and aliases (`pstart`, `pstop`, etc.).
- `README.md` and `README_CN.md` are the English and Chinese user guides. Keep command examples and behavior aligned with the scripts.
- `tests/test_proxy_setup.sh` contains offline regression tests for proxy state handling.
- `LICENSE` contains the project license. There are no asset directories.

Keep runtime behavior in `src/`; keep installation, shell-profile integration, and uninstall logic in `install.sh`.

## Build, Test, and Development Commands

No build step is configured. Validate shell changes before committing:

```bash
bash -n install.sh
bash -n src/proxy-setup.sh
bash tests/test_proxy_setup.sh
bash install.sh --help
```

`bash -n` performs a syntax-only check; the test script validates proxy state without network access. For behavior changes, use a disposable shell profile or manually source `src/proxy-setup.sh`, then exercise `pstart`, `pscan`, `pstop`, `ptoggle`, `pstatus`, `pset host:port`, and `pports`. Do not run the installer against a personal shell configuration unless you intend to modify it.

## Coding Style & Naming Conventions

Write portable Bash compatible with the existing Bash/Zsh usage. Use two-space indentation, `snake_case` for functions and variables, uppercase names for exported or configuration-style variables (for example, `PROXY_ADDRESS`), and descriptive function names such as `detect_proxy`.

Quote variable expansions, use `local` inside functions, and preserve the project’s bilingual comments and user-facing messages when modifying an existing area. Keep aliases named with the `p` prefix. There is no formatter or linter configured; use `bash -n` as the baseline check.

## Testing Guidelines

Run `bash tests/test_proxy_setup.sh` before submitting proxy changes. Add focused manual verification notes to a pull request when changing proxy behavior. Test both the active and inactive states, an unavailable proxy port, and a custom address. Avoid relying on real credentials or committing local shell configuration files.

## Commit & Pull Request Guidelines

Recent history uses short, imperative subjects such as `Update README.md`, `add emoji`, and `fix install error with zsh`. Follow that pattern: one concise subject describing the change; keep unrelated edits separate.

Pull requests should explain the user-visible effect, list validation commands run, link relevant issues when applicable, and update both READMEs for changed commands or installation behavior. Include terminal output or screenshots only when they clarify a shell interaction.
