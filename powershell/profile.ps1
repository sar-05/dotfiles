$env:STARSHIP_CONFIG = "$HOME/.config/starship/starship.pwsh.toml"
Invoke-Expression (&starship init powershell)
function y {
    $tmp = (New-TemporaryFile).FullName
    if ([string]::IsNullOrEmpty($args)) {
        $args=$PWD.Path
    }
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}
