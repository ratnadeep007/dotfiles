# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/exa"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "jeffreytse/zsh-vi-mode"
eval "$(starship init zsh)"
# plug "wintermi/zsh-starship"

# Load and initialise completion system
autoload -Uz compinit
compinit
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# source catpuccin theme
# source ~/.zsh/catppuccin_mocha.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export POWERLEVEL9K_INSTANT_PROMPT=quiet

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# go settings
export GOPATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin"
export PATH="$GOPATH:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# deno
export DENO_PATH="$HOME/.deno"
export PATH="$DENO_PATH/bin:$PATH"

# local bin
export PATH="$HOME/.local/bin:$PATH"

# cargo
export PATH="$HOME/.cargo/bin:$PATH"

alias open=xdg-open
#source "$HOME/.rye/env"
alias aggc="agg --theme monokai --font-dir /usr/share/fonts/TTF --font-family 'ComicShannsMono Nerd Font Mono,Symbols Nerd Font Mono,Noto Emoji' --font-size 15"
# alias cd="zoxide"
alias z="zoxide"


# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

__zoxide_z_prefix='z#'

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$@[-1]" == "${__zoxide_z_prefix}"?* ]]; then
        # shellcheck disable=SC2124
        \builtin local result="${@[-1]}"
        __zoxide_cd "${result:${#__zoxide_z_prefix}}"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" &&
            __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# Completions.
if [[ -o zle ]]; then
    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            _files -/
        elif [[ "${words[-1]}" == '' ]] && [[ "${words[-2]}" != "${__zoxide_z_prefix}"?* ]]; then
            \builtin local result
            # shellcheck disable=SC2086,SC2312
            if result="$(\command zoxide query --exclude "$(__zoxide_pwd)" --interactive -- ${words[2,-1]})"; then
                result="${__zoxide_z_prefix}${result}"
                # shellcheck disable=SC2296
                compadd -Q "${(q-)result}"
            fi
            \builtin printf '\e[5n'
        fi
        return 0
    }

    \builtin bindkey '\e[0n' 'reset-prompt'
    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete __zoxide_z
fi

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

\builtin alias z=__zoxide_z
\builtin alias zi=__zoxide_zi

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
# eval "$(zoxide init zsh)"

# alias tmux to tn to name session as folder name
alias tn="tmux -u new -s \$(pwd | sed 's/.*\///g')"

# export t-session-manager to path
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

# alias lazygit to lg
alias lg=lazygit

# alias nanx to nano --nohelp
alias nanx="nano --nohelp"

# require for watcom
export WATCOM=/opt/watcom
export PATH=$WATCOM/binl:$PATH
export EDPATH=$WATCOM/eddat
export WIPFC=$WATCOM/wipfc
export PATH="$PATH:$HOME/scripts"

# gum related scripts stuff
export SCRIPTS=$HOME/scripts
export PATH="$PATH:$SCRIPTS"
# vm related paths
export DISK_PATH=$HOME/vms/disk/
export ISO_PATH=$HOME/vms/iso/

export NIX_BUILD_SHELL="zsh"


export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"
export LANG=en_US.UTF-8

# This function will be automatically executed by the plugin
zvm_before_init() {
  local ncur=$(zvm_cursor_style $ZVM_NORMAL_MODE_CURSOR)
  local icur=$(zvm_cursor_style $ZVM_INSERT_MODE_CURSOR)

  # Dracula themed
  # ZVM_INSERT_MODE_CURSOR=$ncur'\e\e]12;#50fa7b\a'
  # ZVM_NORMAL_MODE_CURSOR=$ncur'\e\e]12;#f8f8f2\a'
  
  # Gruvbox
  ZVM_INSERT_MODE_CURSOR=$ncur'\e\e]12;#b8bb26\a'
  ZVM_NORMAL_MODE_CURSOR=$ncur'\e\e]12;#fbf1c7\a'
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/home/darklord/.bun/_bun" ] && source "/home/darklord/.bun/_bun"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# open file using fzf
alias nf='nvim $(fzf)'
alias nfh='nvim $(find . | fzf)'
alias nf='nvim $(fzf --preview "bat -n --color=always {}")'
alias nfh='nvim $(find . | fzf  --preview "bat -n --color=always {}")'
