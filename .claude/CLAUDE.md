# CLAUDE.md — Jan Wilczek

Global instructions for Claude Code. Project-level `CLAUDE.md` files override these.

## About me

- Name: Jan
- Timezone: Europe/Warsaw (no fixed working hours)
- Role: freelance audio programmer and educator — research, design, and implement audio algorithms, plugins, and apps; teach via blog, YouTube, podcast, and courses
- Brands: [thewolfsound.com](https://thewolfsound.com), [wolfsoundacademy.com](https://wolfsoundacademy.com), [LinkedIn](https://www.linkedin.com/in/jan-wilczek-audio-programmer/)
- Languages: **C++** and **Python** primary; **Rust**, **C#**, **Kotlin** secondary
- Respond in **English** always

## Communication style

- **Concise** by default; expand only when asked or when the task is genuinely complex
- **Explain reasoning on complex tasks**; otherwise just do the work and show results
- Format: **headers and bullets**, not prose walls
- Emojis: **sparingly**
- Tone: **professional** — no puns, jokes, or jargon when working on code
- **Always ask** when unsure rather than guessing
- **Challenge bad ideas** — push back with reasoning, don't defer

## Workflow rules

- **Always plan first.** Draft a plan, confirm direction, then execute.
- **Summary + diff** at the end of a task. Not "done."
- **Fix failing tests and continue**, but always understand *why* the test failed. It may be my code that's wrong, not the test.
- **Auto-run shell commands** — with the following exceptions:
  - **Never** run `rm` without explicit confirmation
  - **Never** install system-wide or user-wide dependencies without asking (project-local deps are fine)
  - **Always ask** before modifying files outside the current repo
  - **Never** delete files
- **Commit automatically** when a task completes, but **never push**

## Git

- **Commit messages:** [Conventional Commits](https://www.conventionalcommits.org/)
- **Branch naming:** `jan/feature-or-task-name`
- **Workflow:** rebase `main`/`develop` onto feature branch; merge feature back into `develop` or `main`

## Environment

- OS: latest macOS and Windows 11
- Editors: NeoVim and CLion
- Shells: zsh + oh-my-zsh (macOS), PowerShell + oh-my-posh (Windows)
- Terminal: WezTerm
- Package managers: vcpkg, Conan, CPM, etc. — **not FetchContent**
- Python envs: `venv` or **Poetry** (prefer Poetry for new projects)
- Shell scripting: **bash**

## C++

### Standard & libraries

- **C++23**
- **JUCE 8.0.12**, **Boost** available
- DSP: write in-house; reuse via [wolfsound-dsp-utils](https://github.com/JanWilczek/wolfsound-dsp-utils) instead of duplicating

### Style

- Formatting: follows [my `.clang-format`](https://raw.githubusercontent.com/JanWilczek/audio-plugin-template/refs/heads/main/.clang-format) (Chromium-based, `AccessModifierOffset: -2`, `SortIncludes: Never`)
- Linting: [my `.clang-tidy`](https://raw.githubusercontent.com/JanWilczek/audio-plugin-template/refs/heads/main/.clang-tidy), **with one override**: private and protected member variables take a trailing underscore suffix (`memberName_`)
- Indentation: **spaces only**, 2 spaces per level
- Braces: **open brace on the same line** as function signature, `if`, `for`, etc.
- Header guard: `#pragma once`
- Include order: **STL → system → 3rd-party → project**
- Namespaces: nested lowercase, e.g. `wolfsound::dsp::`
- `auto` **everywhere**
- Error handling: **`std::expected`** preferred; avoid exceptions and error codes
- Constness: **`constexpr` by default**, `const` if not possible
- **Prefer copies to mutation**
- Naming (from `.clang-tidy`):
  - Namespaces: `lower_case`
  - Classes, structs, enums: `CamelCase`
  - Functions, variables, constants, constexpr, enum constants: `camelBack`
  - Private/protected members: `camelBack_` (trailing underscore)

### Testing

- Framework: **GoogleTest**
- Layout: `src/` and `test/` as sibling top-level directories
- **Always write tests by default.** Attempt **TDD**: failing test first, then implementation.
- Coverage target: **≥90%**, don't chase 100%
- Test **rigorously** — edge cases, not just happy paths

### Build & CI

- **Modern target-based CMake**, min version **3.31**
- CI: **GitHub Actions** only
- No self-hosted runners

### Audio/DSP rules (real-time safety)

- Audio thread: **no allocations, no system calls, no locking**
- Sample type: **`float`**
- Plugin targets: **VST3, AU, AAX, LV2**

## Python

- Formatter: **black**
- Lint/hooks: follows [my `.pre-commit-config.yaml`](https://raw.githubusercontent.com/JanWilczek/audio-plugin-template/refs/heads/main/.pre-commit-config.yaml)
- Indentation: **4 spaces**
- Env: `venv` or Poetry (prefer Poetry)

## C# / .NET

- **Idiomatic C#** (including brace style on a new line, per C# convention)
- **Spaces, not tabs**

## Rust, Kotlin

- Follow idiomatic conventions for each language
- Spaces over tabs
