#!/usr/bin/env bash

SCM_THEME_PROMPT_PREFIX=" ${reset_color}(${green}"
SCM_THEME_PROMPT_SUFFIX="${reset_color})"
SCM_THEME_PROMPT_DIRTY=" ${yellow}⚡"
SCM_THEME_PROMPT_CLEAN=""

function parse_git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo " ${red}☃"
}

prompt() {
  PS1="${blue}\W${reset_color}$(scm_prompt_info)$(parse_git_stash)${reset_color} \$ "
}

PROMPT_COMMAND=prompt
