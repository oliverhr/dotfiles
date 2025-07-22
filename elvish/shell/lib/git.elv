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

fn a {|@args|
  e:git add --all $@args
}

fn b {|@args|
  e:git branch $@args
}

fn c {|@args|
  e:git commit --verbose $@args
}

fn d {|@args|
  e:git diff $@args
}

fn f {|@args|
  e:git fetch $@args
}

fn l {|@args|
  e:git pull $@args
}

fn p {|@args|
  e:git push $@args
}

fn st {|@args|
  e:git status $@args
}

fn sw {|@args|
  e:git switch $@args
}

