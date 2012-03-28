#!/usr/bin/env bash

SCM_THEME_PROMPT_PREFIX=" ${reset_color}(${green}"
SCM_THEME_PROMPT_SUFFIX="${reset_color})"
SCM_THEME_PROMPT_DIRTY=" ${yellow}⚡"
SCM_THEME_PROMPT_CLEAN=""

function git_prompt_info {
  if [[ -n $(git status -s 2> /dev/null |grep -v ^# |grep -v "working directory clean") ]]; then
      state=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
  else
      state=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
  fi
  prefix=${GIT_THEME_PROMPT_PREFIX:-$SCM_THEME_PROMPT_PREFIX}
  suffix=${GIT_THEME_PROMPT_SUFFIX:-$SCM_THEME_PROMPT_SUFFIX}
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  stash=$(parse_git_stash)

  echo -e "$prefix${ref#refs/heads/}$state$stash$suffix"
}

function parse_git_stash {
  [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo " ${red}☃"
}

prompt() {
  PS1="${blue}\W${reset_color}$(scm_prompt_info)${reset_color} \$ "
}

PROMPT_COMMAND=prompt
