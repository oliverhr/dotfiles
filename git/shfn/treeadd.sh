# vim: set ft=sh ts=4 sw=4 noet :

if (( $# != 2 )); then
	printf '%3sUsage:\n\t git %s %s\n' ''\
		"$GIT_ALIAS" \
		'[worktree path] [remote branch]'
	exit 0;
fi

_worktree=${1}
_branch=${2}

printf 'Adding worktree "%s" for branch "%s\n"' $_worktree $_branch

git worktree add $_worktree $_branch
cd $_worktree
git branch --set-upstream-to=origin/$_branch

