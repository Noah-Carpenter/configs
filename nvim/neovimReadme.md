# NeoVim
[Github](https://github.com/neovim/neovim/tree/master)
[Main Page](https://neovim.io/)

## Setup
1. Download NeoVim (Duh)
2. Open Nvim and use the command `:echo stdpath('config')` and copy the output.
3. in the output copy the init.vim file (create the folders if required!).
4. Install [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.
    a. (Windows)
```powershell
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
    b. (Linux)
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
5. open init.vim with nvim (`nvim init.vim`) and run `:PlugInstall` followed by `:so %`

## Current Packages (probably out of date cause I get lazy real fast)

- `navarasu/onedark.nvim` - allows neovim to be onedarkpro
