# I should probably restructure this as a plugin of some kind.
#
alias vmrun='/Applications/VMware\ Fusion.app/Contents/Library/vmrun'

function vmfusionlist() {
  vmrun list | gawk 'BEGIN { ORS=" " ; FS="/" }  { if (NR>1) {print $NF} }'
}

# this is insane. Must get the load time of puppet --version faster.
#function puppetversion() {
#  gawk 'BEGIN { ORS=" " } /PUPPETVERSION =/ { gsub("\047", "") ; printf $3 }' ~/src/puppet/lib/puppet.rb
#}

#PROMPT=$'%{$fg[green]%}┌(%!) [%{$fg_bold[white]%}%n@%m%{$reset_color%}%{$fg[green]%}] [%{$fg_bold[white]%} $(vmfusionlist)%{$reset_color%}%{$fg[green]%}] %{$(git_prompt_info)%}%(?,,%{$fg[green]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[green]%}])

PROMPT=$'%{$fg[green]%}[%{$fg_bold[white]%}%n@%m%{$reset_color%}%{$fg[green]%}] [%{$fg_bold[white]%} $(vmfusionlist)%{$reset_color%}%{$fg[green]%}] %{$(git_prompt_info)%}%(?,,%{$fg[green]%}[%{$fg_bold[white]%}%?%{$reset_color%}%{$fg[green]%}])
%{$fg[green]%}└▷%{$reset_color%} '

RPROMPT='[%{$fg[white]%}${PWD/#$HOME/~}%{$reset_color%}]'
PS2=$' %{$fg[green]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[green]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[green]%}⚡%{$reset_color%}"


