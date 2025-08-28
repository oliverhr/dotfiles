# Command line tools

Manual installation proccess:
```
# Check last release for a tools ie. zoxide
# https://github.com/ajeetdsouza/zoxide/releases/tag/v0.9.8

curl -fLO https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.8/zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz
tar xavf zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz
sudo cp zoxide /usr/local/bin/

```

| Command    | Description                                                  | Website                                       |
| ---------- | ------------------------------------------------------------ | --------------------------------------------- |
| ag         | A code-searching tool similar to `ack`, but faster. (seems unmaintained) | https://github.com/ggreer/the_silver_searcher |
| bandwhich  | Display current network utilization by process, connection and remote IP/hostname. | https://github.com/imsnif/bandwhich           |
| **bat**    | A `cat` clone with syntax highlighting and Git integration.  | https://github.com/sharkdp/bat                |
| btm        | A customizable graphical process/system monitor for the terminal. | https://github.com/ClementTsang/bottom        |
| cheat      | Create and view interactive cheatsheets on the command-line. | https://github.com/cheat/cheat                |
| choose     | A human-friendly and fast alternative to `cut` and (sometimes) `awk` | https://github.com/theryangeary/choose        |
| curlie     | A frontend to `curl` that adds the ease of use of `httpie`   | https://github.com/rs/curlie                  |
| **delta**  | A syntax-highlighting pager for git, diff, grep, and blame output | https://github.com/dandavison/delta           |
| **direnv** | Load context based on the "current" directory                | https://github.com/direnv/direnv              |
| doggo      | Command-line DNS client for humans                           | https://github.com/mr-karan/doggo             |
| duf        | Disk Usage/Free Utility - a `df` alternative                 | https://github.com/muesli/duf                 |
| dust       | A more intuitive version of `du`                             | https://github.com/bootandy/dust              |
| eza        | A modern alternative to `ls` (a must on windows)             | https://github.com/eza-community/eza          |
| **fd**     | A simple, fast and user-friendly alternative to `find`       | https://github.com/sharkdp/fd                 |
| **fzf**    | The command-line fuzzy finder                                | https://github.com/junegunn/fzf               |
| git-graph  | Show git graphs arranged for your branching model            | https://github.com/mlange-42/git-graph        |
| hyperfine  | A command-line benchmarking tool                             | https://github.com/sharkdp/hyperfine          |
| jaq        | A [`jq`](https://github.com/jqlang/jq) clone focussed on correctness, speed, and simplicity | https://github.com/01mf02/jaq                 |
| just       | A command runner                                             | https://github.com/casey/just                 |
| mkcert     | A zero-config tool to make locally trusted development certificates | https://github.com/FiloSottile/mkcert         |
| procs      | A modern replacement for `ps`                                | https://github.com/dalance/procs              |
| **rg**     | ripgrep recursively searches for a regexp respecting your gitignore | https://github.com/BurntSushi/ripgrep         |
| sd         | Intuitive find & replace CLI (`sed` alternative)             | https://github.com/chmln/sd                   |
| task       | A task runner / simpler Make alternative (CI/CD Locally)     | https://github.com/go-task/task               |
| xh         | Friendly and fast tool for sending HTTP requests             | https://github.com/ducaale/xh                 |
| **zoxide** | A smarter cd command. Supports all major shells.             | https://github.com/ajeetdsouza/zoxide         |
|            |                                                              |                                               |

Note:
- Most of these tools are new alternatives, some of the are written in go or rust.
