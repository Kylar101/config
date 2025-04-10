Save the script to a .ps1 file, e.g.:

```powershell
$scriptPath = "$HOME\Documents\GitScripts\squash-last.ps1"
New-Item -ItemType Directory -Force -Path (Split-Path $scriptPath)
Set-Content -Path $scriptPath -Value '<paste your PowerShell script here>'
```

Make sure the script file has execution rights (if needed):

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

Make the script executable from Git with an alias:

Edit your global Git config:

```bash
git config --global alias.squashlast "!powershell -NoProfile -ExecutionPolicy Bypass -File '$HOME/Documents/GitScripts/squash-last.ps1'"
```

🔁 You can use git squashlast from anywhere, and it’ll run the PowerShell script.
