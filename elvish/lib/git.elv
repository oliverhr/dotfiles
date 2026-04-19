# ----------------------------------------------------------
# Git aliases
# ----------------------------------------------------------

fn g {|@args|
  if (== 0 (count $args)) {
    e:git --help
  } else {
    e:git $@args
  }
}

set edit:abbr[,gad] = 'git add'
fn a {|@args|
  e:git add $@args
}

set edit:abbr[,gaa] = 'git add --all'
set edit:abbr[,gaa] = 'git add --all'
fn aa {|@args|
  e:git add --all $@args
}

set edit:abbr[,gb] = 'git branch'
fn b {|@args|
  e:git branch $@args
}

set edit:abbr[,gc] = 'git commit --verbose'
fn c {|@args|
  e:git commit --verbose $@args
}

set edit:abbr[,gd] = 'git diff --verbose'
fn d {|@args|
  e:git diff $@args
}

set edit:abbr[,gf] = 'git fetch'
fn f {|@args|
  e:git fetch $@args
}

set edit:abbr[,gl] = 'git pull'
fn l {|@args|
  e:git pull $@args
}

set edit:abbr[,gp] = 'git push'
fn p {|@args|
  e:git push $@args
}

set edit:abbr[,gst] = 'git status'
fn st {|@args|
  e:git status $@args
}

set edit:abbr[,gsw] = 'git switch'
fn sw {|@args|
  e:git switch $@args
}

set edit:abbr[,gwt] = 'git worktree'
fn wt {|@args|
  e:git worktree $@args
}

