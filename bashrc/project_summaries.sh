#!/bin/bash

# usage: findcpp <dir>
function findcpp()
{
  dir=$1
  find ${dir} -regextype posix-extended -regex '.*\.(cpp|cc|h|hpp|hh)'
}

# usage: wcsum <dir>
function wcsum()
{
  dir=$1
  filelist=$(findcpp $dir)
  if [[ -n "$filelist" ]]; then
    lines=$(wc -l ""$filelist"" | tail -n 1)
    echo $lines | awk '{print $1}'
  fi
}

#usage: projectsum <dir>
function projectsum()
{
  dir=$1
  if [[ -d $dir ]]; then

    # check lines
    lines=`wcsum $dir`

    # check functions

    # check how many leveldb's codebase(which has 12180 lines)
    ldbtimes=`bc<<<"scale=2;$lines/12180.0"`

    # output summaries
    echo "project : $dir"
    echo "lines   : $lines"
    echo "ldbtimes: $ldbtimes"
  fi
}

