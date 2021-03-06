# Core setup
## iTerm2 Terminal setup
1. Install meslo font (for powerline shell) included in the `fonts` directory
1. Change the shell font to meslo `Profiles` > `Text` > `Font`
1. Switch color theme to [solarized dark](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
1. Update `ANSI Colors` > `Black Bright` (top right color) if zsh autosuggestions aren't showing up (`b8d444`)
1. Preferences > Profiles > Keys > Presets > Natural Text Editing

## Mac OS setup
1. Keyboard > Key Repeat > Fast
1. Keyboard > Delay Until Repeat > Short
1. Keyboard > Modifier Keys > Caps Lock > Escape

## zshell
### Install [oh-my-zsh](https://ohmyz.sh/)
Skip the regular oh-my-zsh installer since we already have the setup steps included in our `.zshrc`

1. `git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh`
2. `cp .zshrc ~/.zshrc`

### Install powerline-shell
1. Follow the steps at the [powerline-shell setup repo](https://github.com/b-ryan/powerline-shell#setup)
1. [Install pip](https://pip.pypa.io/en/stable/installing/) `curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py`
1. `pip install powerline-shell`

### Setup autosuggestions
1.  `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`

# Other Applications
## Sublime text
1. After installing [Sublime Text 3](https://www.sublimetext.com/3) to the `Applications` folder
1. `ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl`
   1. If `/usr/local/bin` does not exist, create it:
   1. `sudo mkdir /usr/local/bin`
   1. You may also need to use sudo to create the symlink above
