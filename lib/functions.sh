#!/usr/bin/env bash

## COLORS ##
dx_reset_color="\033[0m"
dx_red="\033[0;35m"
dx_green="\033[0;32m"
dx_yellow="\033[0;33m"
dx_purple="\033[0;34m"
dx_blue="\033[0;36m"
dx_white="\033[0;97m"
dx_black="\033[0;30m"

dx_userInput()
{
  printf "\n[ $dx_yellow?$dx_reset_color ] - $1 "
}

dx_success()
{
  printf "$dx_green $1 $dx_reset_color\n"
}

dx_error()
{
  printf "ERROR:$dx_red $1 $dx_reset_color\n"
}

dx_step()
{
  printf "$dx_purple===== $(basename ${BASH_SOURCE[1]}): $1 $dx_reset_color\n"
}

# lifted from https://github.com/gentoo/gentoo-functions/blob/52fbd4c4c5869a022db7a9923811b541e2bf1a28/functions.sh
dx_true_false()
{
  [ -z "$1" ] && return 1

  case "$1" in
    [Yy]|[Yy][Ee][Ss]|[Tt][Rr][Uu][Ee]|[Oo][Nn]|1) return 0;;
    [Nn]|[Nn][Oo]|[Ff][Aa][Ll][Ss][Ee]|[Oo][Ff][Ff]|0) return 1;;
  esac

  local value=
  eval value=\$${1}
  case "$value" in
    [Yy]|[Yy][Ee][Ss]|[Tt][Rr][Uu][Ee]|[Oo][Nn]|1) return 0;;
    [Nn]|[Nn][Oo]|[Ff][Aa][Ll][Ss][Ee]|[Oo][Ff][Ff]|0) return 1;;
    *) return 1;;
  esac
}

# test function to see the colors
dx_color_spectrum()
{
  printf " $dx_red the quick brown fox jumps over the lazy dog \n"
  printf " $dx_green the quick brown fox jumps over the lazy dog \n"
  printf " $dx_yellow the quick brown fox jumps over the lazy dog \n"
  printf " $dx_purple the quick brown fox jumps over the lazy dog \n"
  printf " $dx_blue the quick brown fox jumps over the lazy dog \n"
  printf " $dx_white the quick brown fox jumps over the lazy dog \n"
  printf " $dx_black the quick brown fox jumps over the lazy dog \n"
  printf " $dx_reset_color the quick brown fox jumps over the lazy dog \n"
}
