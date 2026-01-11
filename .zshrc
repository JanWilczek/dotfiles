# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
PATH="$PATH:$HOME/dev/next-weeks-dates/target/release"
export PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
if [[ "$TERMINAL_EMULATOR" == *"JetBrains"* ]]; then
  ZSH_THEME="robbyrussell"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	fast-syntax-highlighting
	zsh-autocomplete
	z
  fzf
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
OMZ_EDITOR=nvim
alias zshconfig="$OMZ_EDITOR ~/.zshrc"
alias ohmyzsh="$OMZ_EDITOR ~/.oh-my-zsh"

# CMake-related aliases
alias cmcp="cmake --preset"
alias cmcpd="cmake --preset default"
alias cmcpr="cmake --preset release"
alias cmb="cmake --build build"
alias cmbp="cmake --build --preset"
alias cmbd="cmake --build --preset default"
alias cmbr="cmake --build --preset release"
alias ctp="ctest --preset"
alias ctpd="ctest --preset default"
alias ctpr="ctest --preset release"

alias python=python3
export SYNCED_NOTES_PATH="/Users/jawi/Library/CloudStorage/GoogleDrive-jawitrle@gmail.com/My Drive/Notes"
# export WORKING_MEMORY_FILE_PATH="/Users/jawi/Library/CloudStorage/Dropbox/workingmemory.md"
export WORKING_MEMORY_FILE_PATH="${SYNCED_NOTES_PATH}/workingmemory.md"
alias wm="nvim '${WORKING_MEMORY_FILE_PATH}'"
alias nt="cd '${SYNCED_NOTES_PATH}' && nvim ."
alias lg="lazygit"
alias devsession="~/.config/tmux/dev_preset.sh"

# Make removing files safer
alias rm="rm -iv"

export OBSIDIAN_PATH="/Users/jawi/Documents/default"

# bat is sometimes installed as batcat
if [[ $(uname) != "Darwin" ]] && command -v batcat &> /dev/null; then
    alias bat='batcat'
fi

# Transmit UTF-8 characters via tmux by default
alias tmux='tmux -u'

get_changed_and_untracked() {
  git status -s | awk '"'"'{print $2}'"'"'
}

# Preview and git add changed git files
fgs() {
  preview='
    if [[ {-2} ==  "??" ]]; then
        bat -f {-1}
    else
        git diff --color=always -- {-1}
    fi
  '
  git add $(get_changed_and_untracked | fzf -m --ansi --preview $preview | awk '{print $2}')
}

# Change lazygit config directory
export XDG_CONFIG_HOME="$HOME/.config"

export BAT_THEME="Visual Studio Dark+"
export PATH="$PATH:/Users/jawi/dev/flutter/bin"



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*" || find .'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f "/Users/jawi/.ghcup/env" ] && . "/Users/jawi/.ghcup/env" # ghcup-env

# Created by `pipx` on 2025-07-25 13:37:50
export PATH="$PATH:/Users/jawi/.local/bin"
