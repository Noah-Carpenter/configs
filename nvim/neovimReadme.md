# NeoVim
[Github](https://github.com/neovim/neovim/tree/master)
[Main Page](https://neovim.io/)

## General
This is a read me for myself to cover my config for NeoVim.
Alot of my config at the moment is ripped straight from [John McBride's Video](https://www.youtube.com/watch?v=XiHjS0CgbN4).

### Useful commands
- `:so %` load the current file as a config file.
- `dd` delete the current line
- `<n` - move section n number of tabs left
- `>n` - move section n number of tabs right

## Setup
1. Download NeoVim (Duh)
2. Open Nvim and use the command `:echo stdpath('config')` and copy the output.
3. In the output folder copy the init.lua file (create the folders if required!).
4. Install [packer](https://github.com/wbthomason/packer.nvim) to manage normal nvim plugins.
    a. (Windows)
```powershell
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

    b. (Linux)
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
## Current Packages (This is most likely out of date but ¯\_(ツ)_/¯)

### [packer](https://github.com/wbthomason/packer.nvim)
This is the package manager I use for managing all of my other nvim packages.

#### General Usage
You can add packages under the `require('packer').startup()` function using the either of the following formats.
a. 
```lua
use '<github-user>/<repo-name>'
```

b.
```lua
use {
   '<github-user>/<repo-name>',
   <other-config>,
   -- e.g.
   <config-var-name> = <config-var-value>
}
```

#### Useful commands
- `PackerSync` - updates the packages in line with the init.lua under the `require('packer').startup()` function.

### [Mason](https://github.com/williamboman/mason.nvim?tab=readme-ov-file#registries)
Weirdly this is also a package manage but for the LSP servers. I'm still learning about these as I haven't really had a need to set one up so more information to come.

### [alpha-nvim](https://github.com/goolord/alpha-nvim)
This essentially just gives you a nice and configurable landing page when you open nvim.
I haven't started configuring this but I'm sure it will become more useful as time goes on.

### [nvim-cmp](https://github.com/wbthomason/packer.nvim)
This provides auto complete for within Vim. Currently there is a bunch of config in there that I don't understand but I will probably need to adjust at some point and I will add more information then.

### [vim-gitgutter](https://github.com/airblade/vim-gitgutter)
This just adds the +/-/~ to the side of your files to show your git file changes.

### [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
Gives us the nice line at the bottom of the screen telling us about what mode, branch and file we are in, along with other useful information like current line.

*note, this would probably be greatly improved by having a font that supports nerd icons [nerdfonts](https://www.nerdfonts.com/)*

### [vim-visual-multi](https://github.com/mg979/vim-visual-multi)
Allows you to create multiple cursors on a word.

### Usage
- `Ctrl-N` - create 1 cursor at the next instance of selected.

### [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
Adds file explorer.
#### Usage
- `NvimTreeOpen` - Opens the file explorer.

### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
Essentially a super powerful grep with a nice ui.\

**REQUIRES INSTALL OF [ripgrep](https://github.com/BurntSushi/ripgrep)**

#### Useful Commands
- `Telescope find_files` - allows you to search for files within the current directory.
- `Telescope live_grep` - allows you for search for a string in all files in the current directory.

### [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
This allows fzf (fuzzy finding) functionality within telescope.

### [onedark.nvim](https://github.com/navarasu/onedark.nvim)
This is just the theme I use on everything.

### [vim-markdown](https://github.com/preservim/vim-markdown)
This adds a bunch of markdown functionality for vim.
#### Useful Commands
- `zR:` - opens all sections.
- `zr:` - opens current section.
- `zM:` - closes all sections.
- `zM:` - closes current section.
