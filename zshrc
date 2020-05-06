# Uncomment to enable profiling EOF too
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export NVM_AUTO_USE=true

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="custom"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    docker    
    git
    kube-ps1
    kubectl
    encode64
    zsh-navigation-tools
    zsh-nvm
)

# Plugins not used
# aws
# zsh-nvm
# zsh-autosuggestions
# zsh-better-npm-completion
# git

# Used by gls and by .oh-my-zsh/lib/theme-and-appearance.zsh

export LS_COLORS="di=1;34:ln=1;35:so=1;31:pi=1;33:ex=1;32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
# export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

source $ZSH/oh-my-zsh.sh

# User configuration

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp='cp -iv'                                   # Preferred 'cp' implementation
alias mv='mv -iv'                                   # Preferred 'mv' implementation
# alias mkdir='mkdir -pv'                             # Preferred 'mkdir' implementation
alias less='less -FSRXc'                            # Preferred 'less' implementation
alias f='open -a Finder ./'                         # f:            Opens current directory in MacOS Finder
alias c='clear'                                     # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'                 # path:         Echo all executable Paths

# Use the built-in take function
# mcd () { mkdir "$1" && cd "$1"; }                   # mcd:          Makes new Dir and jumps inside

#   ---------------------------
#   2.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                         # qfind:    Quickly search for file
ffs () { find . -name "$@"'*' ; }                   # ffs:      Find file whose name starts with a given string
ffe () { find . -name '*'"$@" ; }                   # ffe:      Find file whose name ends with a given string

#   ---------------------------
#   3.  NETWORKING
#   ---------------------------

alias myip='curl -4 ifconfig.co'                                # myip:         Public facing IP Address
alias flushDNS='dscacheutil -flushcache'                        # flushDNS:     Flush out the DNS Cache
alias lsock='lsof -i -P'                                        # lsock:        Display open sockets
alias lsockU='lsof -nP -iUDP'                                   # lsockU:       Display only open UDP sockets
alias lsockT='lsof -nP -iTCP'                                   # lsockT:       Display only open TCP sockets
alias openPorts='lsof -iTCP -sTCP:LISTEN'                       # openPorts:    All listening connections
alias wifi-info='networksetup -getinfo Wi-Fi'                   # wifi-info:    Get info on connections for Wifi
alias eth-info='networksetup -getinfo USB\ 10/100/1000\ LAN'    # ipInfo1:      Get info on connections for en1

#   ---------------------------
#   . PATH
#   ---------------------------

export GOPATH="${HOME}/.go"
export PATH="$PATH:${GOPATH}/bin"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"

#   -------------------------
#   4.  CUSTOM
#   ------------------------

totp() { oathtool --totp -b $(<~/".totp_${1:-google}") | pbcopy; }

# ZSH AWS Plugin Option
SHOW_AWS_PROMPT=true

export LC_ALL=en_US.UTF-8
export EDITOR='code'
export KUBE_EDITOR='code --wait'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"
export KUBE_PS1_COLOR_CONTEXT="%F{yellow}"
export KUBE_PS1_COLOR_NS="%F{green}"

# Reuse of zsh directories lib
alias ll='ls --group-directories-first -lh'
alias l='la --group-directories-first'
alias change="code ~/.zshrc"
alias update="exec zsh"

# curl-loop 
curl-loop() { i=1; while true; do echo "$(gdate "+%Y/%m/%d - %T.%3N") - $i - ${1} - $(curl -I ${1} -w "%{http_code}" -s -o /dev/null)"; i=$[$i+1]; sleep ${2:-0.5}; done }

bindkey -e
bindkey \^u backward-kill-line

# Configuration of ZSH Highlight plugin
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern root line)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[root]='bg=196,fg=black,bold'
ZSH_HIGHLIGHT_STYLES[line]='none'

# Take advantage of $LS_COLORS for completion as well.
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Enable docker-compose completion
fpath+=($ZSH/plugins/docker)

autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source /Library/Application\ Support/com.canonical.multipass/Resources/completions/bash/multipass

# #   -------------------------
# #   5.  PIPEDRIVE
# #   ------------------------
source /Users/gregorarzouyan/.github

export KUBE_PS1_ENABLED=off
export KUBECONFIG=~/.kube/config:~/.kube/k8s-1-eu-central-1-live.config:~/.kube/k8s-1-eu-central-1-test.config:~/.kube/k8s-1-management-live.config:~/.kube/k8s-1-management-test.config:~/.kube/k8s-1-us-east-1-live.config:~/.kube/k8s-1-us-east-1-test.config:~/.kube/k8s-2-eu-central-1-live.config:~/.kube/k8s-2-eu-central-1-test.config:~/.kube/k8s-2-management-live.config:~/.kube/k8s-2-management-test.config:~/.kube/k8s-2-us-east-1-live.config:~/.kube/k8s-2-us-east-1-test.config:~/.kube/k8s-3-eu-central-1-live.config:~/.kube/k8s-3-eu-central-1-test.config:~/.kube/k8s-3-us-east-1-live.config:~/.kube/k8s-3-us-east-1-test.config:~/.kube/k8s-3-testbox-test.config

export CONSUL_HTTP_ADDR=192.168.46.100:8500
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# List images of containers by pod widely
# Can add a sort -nr to sort by amount
alias kgpiw="kubectl get pods --all-namespaces -o jsonpath='{.items[*].spec.containers[*].image}' | tr -s '[[:space:]]' '\n' | sort | uniq -c"

# List images of containers by single pod
alias kgpi="kubectl get pod -o jsonpath='{range .spec.containers[*]}{.image}{"\n"}{end}'"

# export NVM_LAZY_LOAD=true
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

## Add docker context
get-context(){
if [[ $PROMPT == *"$CONTEXT_PROMPT"* ]]; then
    PROMPT=${${PROMPT}#${CONTEXT_PROMPT}}
    PROMPT="${PROMPT#"${PROMPT%%[![:space:]]*}"}"
fi
DOCKER_CONTEXT=$(grep currentContext ~/.docker/config.json|cut -f4 -d\")
if [[ ! -z "$DOCKER_CONTEXT" ]]; then
case $DOCKER_CONTEXT in
  testbox*)
    CONTEXT_PROMPT="%F{green}($DOCKER_CONTEXT)%f"
    ;;
  
  *test*)
    CONTEXT_PROMPT="%F{yellow}($DOCKER_CONTEXT)%f"
    ;;
  
  *)
    CONTEXT_PROMPT="%F{red}($DOCKER_CONTEXT)%f"
    ;;

esac
PROMPT="$CONTEXT_PROMPT $PROMPT"
fi
}
add-zsh-hook precmd get-context
get-context
