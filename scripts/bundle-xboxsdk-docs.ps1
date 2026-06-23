# Bundle xboxsdk/ into xboxsdk.tar.gz (same layout as RXDK-VSCode docs/xboxsdk.tar.gz).
param(
    [string]$RepoRoot = (Join-Path $PSScriptRoot '..')
)
$ErrorActionPreference = 'Stop'
$RepoRoot = [IO.Path]::GetFullPath($RepoRoot)
$docsSrc = Join-Path $RepoRoot 'xboxsdk'
$archive = Join-Path $RepoRoot 'xboxsdk.tar.gz'

foreach ($required in @(
        (Join-Path $docsSrc 'toc.json')
        (Join-Path $docsSrc 'xbox_pk_welcome.htm')
    )) {
    if (-not (Test-Path -LiteralPath $required)) {
        throw "Missing $required - restore xboxsdk/ before bundling."
    }
}

Push-Location $RepoRoot
try {
    if (Test-Path -LiteralPath 'xboxsdk.tar.gz') {
        Remove-Item -LiteralPath 'xboxsdk.tar.gz' -Force
    }
    & tar -czf xboxsdk.tar.gz xboxsdk
    if ($LASTEXITCODE -ne 0) {
        throw 'tar failed creating xboxsdk.tar.gz'
    }
} finally {
    Pop-Location
}

$sizeMb = [math]::Round((Get-Item -LiteralPath $archive).Length / 1MB, 2)
$fileCount = (Get-ChildItem -LiteralPath $docsSrc -Recurse -File).Count
Write-Host "OK: xboxsdk.tar.gz ($sizeMb MB, $fileCount source files)" -ForegroundColor Green
