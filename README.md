# neovim config

based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), inspired by [TJ's accompanying video](https://youtu.be/m8C0Cq9Uv9o)

previous neovim configs are in `bak`

## Installation

### Install Neovim

`brew install neovim`

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If want to write Typescript, you need `npm`
  - If want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install

Clone the repo into the config path

```sh
git clone https://github.com/alexanelli/neovim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
```

Lazy will install plugins automatically the next time you launch `nvim`. Use `:Lazy` to view
current plugin status. Hit `q` to close the window.

<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```
</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```
</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```
</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```
</details>

### Notes/TODO

* How to uninstall neovim and all plugins?
  * uninstall neovim via brew
  * remove init.lua and the neovim files in `~/.local/share/nvim`, `~/.local/state/nvim` and `~/.config/nvim`
  * `rm -rf ~/.local/share/nvim/`
  * `rm -rf ~/.config/nvim`
  * `rm -rf ~/.local/state/nvim`
* What if I want to "uninstall" this configuration:
  * See [lazy uninstall](https://lazy.folke.io/usage#-uninstalling) information
* TODO split it into multiple files?
    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)
    * [Restructure the configuration](https://github.com/nvim-lua/kickstart.nvim/issues/218)
    * [Reorganize init.lua into a multi-file setup](https://github.com/nvim-lua/kickstart.nvim/pull/473)
    * maybe check primeagens config for ref. <https://github.com/ThePrimeagen/init.lua/tree/master>

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install](#Install) step.

#### Linux Install
