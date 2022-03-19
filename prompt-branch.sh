# Bash functions to get the current VCS branch of the containing repo of $CWD.

function _get-git-root()
{
  wd="$PWD";
  while [[ "$wd" != "/"  &&  ! -d "$wd/.git" ]]; do
    wd="$(dirname "$wd")";
  done
  [ "$wd" != "/" ] && echo "$wd";
}

# Get the current git branch name.
#
# \param $1 The root directory of the git repository.
# \echoes The branch name of HEAD, if $1 is a git root.
function current-branch()
{
  branch="";
  if [ -e "$1/.git/HEAD" ]; then
    # Main repository directory.
    echo "$(sed -e 's/.*\///' "$1/.git/HEAD")";
  elif [ -f "$1/.git" ]; then
    # Sub-module directory
    echo "$(sed -s 's/.*\///' "$(sed -e 's/gitdir: //' "$1/.git")/HEAD") [sm]";
  fi
}

function _ps-vcs-branch()
{
  gitroot="$(_get-git-root)";
  if [ -n "$gitroot" ]; then
    echo "<$(current-branch "$gitroot")>";
  else
    echo "";
  fi
}
