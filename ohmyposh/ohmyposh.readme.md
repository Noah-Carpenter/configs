# Oh - My - Posh
[Github](https://github.com/jandedobbeleer/oh-my-posh)

[Main Page](https://ohmyposh.dev/)

## General
Makes your powershell window pretty but to be honest I'm not 100% sold on this.

## Setup

### Windows (Powershell)
1. `winget install JanDeDobbeleer.OhMyPosh -s winget`
*Technically 2. & 3. optional to get nerd fonts for icons*
2. `ohmyposh font install` (so far I am using JetbrainsMono).
3. Right click on the top bar open default options and select the new font.
4. Configure the file in `$PROFILE` with the following to point at where the repo is.
```powershell
oh-my-posh init pwsh --config '<location-of-your-repo>\ohmyposh\draculaXonehalf.omp.json' | Invoke-Expression
```

#### Other windows setup to make things nice
- Set powershell background in default to `40, 44, 52` to make everything a nice grey.
    - **NOTE: when you do this also do `Set-PSReadLineOption -Colors @{"Parameter"="$([char]0x1b)[33m"}` or you wont be able to see command operator.**

### MacOs (.zsh)
1. `brew install jandedobbeleer/oh-my-posh/oh-my-posh`
*Technically 2. and 3. are optional to get nerd fonts for icons*
2. `oh-my-posh font install` (so far I am using JetbrainsMonoi)
3. Go to Terminal > Settings... and then configure a new profile that uses the font.
4. add the following line to your `~/.zshrc` file.
```sh
eval "$(oh-my-posh init zsh --config ~/<path-to-repo>/config/ohmyposh/<theme>)"
```
