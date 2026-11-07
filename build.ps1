# Usage (PowerShell, in the repo folder):
#   .\build.ps1          # build build\main.pdf
#   .\build.ps1 -Watch   # rebuild on every save
#   .\build.ps1 -Clean   # delete build output
param([switch]$Watch, [switch]$Clean)

if (-not (Get-Command latexmk -ErrorAction SilentlyContinue)) {
    Write-Error "latexmk not found. Install MiKTeX or TeX Live first (see README.md)."
    exit 1
}
if ($Clean) { latexmk -C main.tex; exit $LASTEXITCODE }
if ($Watch) { latexmk -pvc main.tex } else { latexmk main.tex }
if ($LASTEXITCODE -eq 0 -and -not $Watch) { Write-Host "OK -> build\main.pdf" -ForegroundColor Green }
