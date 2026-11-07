# DBMS Team Assessment Report (Team 4 - MongoDB)

LaTeX project for the final report. One file per section in `sections/`, so each member
edits their own part and merges stay clean.

## Layout

```
main.tex            # entry point (title, TOC, \input of sections, bibliography)
preamble.tex        # packages, code-listing style, macros (\code, \todo)
sections/           # 01-introduction ... 07-contributions
figures/            # images (png/pdf)
code/               # scripts / snippets you want to cite in the report
references.bib      # shared bibliography
.latexmkrc          # build config (output goes to build/)
build.ps1           # PowerShell helper
```

## 1. Install (Windows, once)

1. **LaTeX**: MiKTeX (`winget install MiKTeX.MiKTeX`) or TeX Live.
2. **Perl** (MiKTeX only, needed by `latexmk`): `winget install StrawberryPerl.StrawberryPerl`
3. **VS Code** + extension **LaTeX Workshop** (VS Code will suggest it).
4. Restart the terminal, then check: `latexmk -v`

MiKTeX installs missing packages on the fly; allow it when prompted
(Settings -> "Install missing packages: Always").

## 2. Build

```powershell
.\build.ps1          # -> build\main.pdf
.\build.ps1 -Watch   # rebuild on every save
.\build.ps1 -Clean
```

In VS Code, saving a `.tex` file auto-builds and shows the PDF in a tab.
If PowerShell blocks the script: `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned`.

## 3. Git workflow for the team

```powershell
git init
git add .
git commit -m "Initial LaTeX report skeleton"
git branch -M main
git remote add origin <your-repo-url>
git push -u origin main
```

Teammates: `git clone <your-repo-url>`.

Daily routine:

```powershell
git pull --rebase
# edit only your own sections\XX-*.tex (and add figures\, references.bib entries)
git add -A
git commit -m "indexing: add case 2 results"
git push
```

Rules to avoid conflicts:
- Edit only your own section file; touch `main.tex` / `preamble.tex` only after telling the team.
- Add bib entries at the end of `references.bib` with a unique key.
- Put every figure in `figures/` and reference it with `\includegraphics{name}` (no path).
- Search `\todo{` to find unfinished parts; remove them before submission.

## 4. Notes

- Default engine is `pdflatex`. For XeLaTeX/LuaLaTeX set `$pdf_mode = 5;` (xelatex) or `4;` (lualatex) in `.latexmkrc`.
- Vietnamese text: `T5` font encoding is already loaded; change `\usepackage[english]{babel}` to
  `\usepackage[vietnamese,english]{babel}` if the report is written in Vietnamese.
- Code listings: use `\begin{lstlisting}[language=mongosh]` for mongosh, `language=Python` for Python.
- Submission: zip the repo (without `build/`), include the demo scripts and the contribution table.
