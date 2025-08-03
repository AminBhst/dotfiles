# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
source /usr/share/fzf/shell/key-bindings.zsh
source /usr/share/fzf/shell/completion.zsh

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Keybindings
# Key-bindings
bindkey -s '^o' 'ranger\n'
bindkey -s '^f' 'zzi\n'
# bindkey -s '^s' 'ncdu\n'
bindkey -s '^v' 'nvim\n'
bindkey -s '^g' 'lazygit\n'
bindkey -s '^r' 'hyprctl reload\n'
bindkey -s '^n' './home/ryewell/Apps/nekoray/launcher \n'
bindkey -s '^z' 'zi\n'
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

### Aliases
alias ls='ls --color=auto'
alias j='z'
alias f='zi'
alias zz='__zoxide_z'
alias zzi='__zoxide_zi'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# easier to read disk
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB

# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4 | head -5'

# get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3 | head -5'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Nekoray
alias nekoray="sudo ~/General/nekoray/launcher"
alias brightness="brigtnessctl set "
alias volume-max="amixer sset Master 100%"

# OVPN
alias ovpn-con="sudo openvpn --config ~/General/VPN/dl19Tdl14.ovpn --auth-user-pass ~/General/VPN/ovpn-auth.txt"

#postgres
alias pgadmin="/usr/pgadmin4/bin/pgadmin4 </dev/null &>/dev/null &"

#Keyboard
alias set-layout="setxkbmap -layout us,ir"
alias set-shortcut="setxkbmap -option 'grp:win_space_toggle'"

#Shutdown
alias shutdown="shutdown now"

# systemd
alias list_systemctl="systemctl list-unit-files --state=enabled"

# Shecan DNS
alias shecan='echo -e "nameserver 178.22.122.100\nnameserver 185.51.200.2" | sudo tee /etc/resolv.conf'
alias unshecan='echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf'
alias electro='echo -e "nameserver 78.157.42.101\nnameserver 78.157.42.100" | sudo tee /etc/resolv.conf'
alias proxitty='ALL_PROXY=socks5h://127.0.0.1:2080 alacritty'


# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --no-aliases --cmd cd zsh)"

