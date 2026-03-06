# vim: set ft=sh ts=4 sw=4 noet :

if (( $# != 2 )); then
	printf '%3sUsage:\n\t git %s %s\n' ''\
		"$GIT_ALIAS" \
		'[repository url] [directory path]'
	exit 0;
fi

_repo=${1}
_path=${2}
_wtd='.worktree.git'

mkdir $_path && cd $_path

git clone --bare $_repo $_wtd
printf 'gitdir: %s' ${_wtd} > .git

git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git fetch origin --quiet

