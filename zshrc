# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="awsomepanda"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(docker aws git kubectl encode64 python)

source $ZSH/oh-my-zsh.sh

# User configuration

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                                   # Preferred 'cp' implementation
alias mv='mv -iv'                                   # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                             # Preferred 'mkdir' implementation
alias less='less -FSRXc'                            # Preferred 'less' implementation
alias f='open -a Finder ./'                         # f:            Opens current directory in MacOS Finder
alias c='clear'                                     # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'                 # path:         Echo all executable Paths
mcd () { mkdir -p "$1" && cd "$1"; }                # mcd:          Makes new Dir and jumps inside

#   ---------------------------
#   2.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                         # qfind:    Quickly search for file
ffs () { find . -name "$@"'*' ; }                   # ffs:      Find file whose name starts with a given string
ffe () { find . -name '*'"$@" ; }                   # ffe:      Find file whose name ends with a given string

#   ---------------------------
#   3.  NETWORKING
#   ---------------------------

alias myip='curl -4 ifconfig.co'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='lsof -i -P'                            # lsock:        Display open sockets
alias lsockU='lsof -nP -iUDP'                       # lsockU:       Display only open UDP sockets
alias lsockT='lsof -nP -iTCP'                       # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='lsof -iTCP -sTCP:LISTEN'           # openPorts:    All listening connections

#   ---------------------------
#   . PATH
#   ---------------------------

export GOPATH="${HOME}/.go"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

#   -------------------------
#   4.  CUSTOM
#   ------------------------

export EDITOR='code'
export KUBE_EDITOR='code --wait'
export LC_ALL=en_US.UTF-8

alias ll='gls --color=auto --group-directories-first -lh'
alias l='gls --color=auto --group-directories-first -lah'

SHOW_AWS_PROMPT=true

# tunnel $local_port
# Serveo: expose local servers to the internet using SSH
tunnel() {ssh -oStrictHostKeyChecking=no -R 80:localhost:"$1" serveo.net}

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit; compinit
complete -o nospace -C /Users/gregorarzouyan/.terraform.versions/terraform_0.11.14 terraform_0.11.14

bindkey -e
bindkey \^u backward-kill-line

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
