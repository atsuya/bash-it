#!/usr/bin/env bash

SCM_THEME_PROMPT_PREFIX=" ${reset_color}(${green}"
SCM_THEME_PROMPT_SUFFIX="${reset_color})"
SCM_THEME_PROMPT_DIRTY=" ${yellow}⚡"
SCM_THEME_PROMPT_CLEAN=" "

prompt() {
  PS1="${blue}\W${reset_color}$(scm_prompt_info)${reset_color} \$ "
}

PROMPT_COMMAND=prompt
