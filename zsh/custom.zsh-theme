# root prompt
if [ $(id -u) -eq 0 ];
then # you are root
  PROMPT="%B%F{red}(%n)%f %F{cyan}%~ %(?.%F{green}.%F{red})❯%f "
else # normal
  PROMPT="%F{cyan}%~ %(?.%F{green}.%F{red})❯%f "
fi

RPROMPT='%{$fg[green]%}$(git_prompt_info)%{$reset_color%}'
# RPROMPT='[%*]'
# RPROMPT='$(aws_prompt_info)'" $RPROMPT"
# RPROMPT='$(aws_prompt_info)'

ZSH_THEME_AWS_PREFIX="%{$fg[red]%}("
ZSH_THEME_AWS_SUFFIX=")%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%})%{$fg[yellow]%} ✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=") "
