setopt GLOB_DOTS          # dot files show up in * expansion
setopt PROMPT_SUBST       # allows executing functions in prompt

# colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"

# get the git branch
parse_git_branch() {
  if [ -n "$(which git)" ]; then
    git branch --no-color 2> /dev/null |  sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
  else
    echo ''
  fi
}
print_git_branch() {
  RET="$(parse_git_branch)"
  if [ -n "$RET" ]; then
    echo "$PR_GREEN$RET$PR_NO_COLOR:"
  else
    echo "$PR_NO_COLOR"
  fi
}

# prompt
#   - if the previous command returned nonzero, show that
#   - show the user name @ hostname
#   - shows the git branch, if any
#   - shows the current directory
#   - warns me with red text if running as root
PS1='['
PS1+='%(0?.. $PR_RED%?$PR_NO_COLOR )'
PS1+='$(print_git_branch)'
PS1+='$PR_CYAN%~$PR_NO_COLOR'
PS1+='] '
RPS1='$PR_MAGENTA(%D{%b %d %H:%M})$PR_NO_COLOR'
