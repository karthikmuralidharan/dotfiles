if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish

# Load all saved ssh keys
/usr/bin/ssh-add --apple-load-keychain ^/dev/null

# Fish syntax highlighting
set -g fish_color_autosuggestion '555'  'brblack'
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape 'bryellow'  '--bold'
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match 'bryellow'  '--background=brblack'
set -g fish_color_selection 'white'  '--bold'  '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# locale
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

## jruby
set -gx JRUBY_OPTS "-Xcext.enabled=true --debug"
set -gx GTAGSLABEL "pygments"

# go
set -gx GOPATH $HOME/go
set -gx GOROOT /usr/local/opt/go/libexec
set -gx GO111MODULE on

# JDK - setting default version to corretto
set -gx CPPFLAGS "-I/usr/local/opt/openjdk/include"
set -gx JAVA_VERSION 11
set -x JAVA_HOME (/usr/libexec/java_home -v $JAVA_VERSION)

set -gx GITHUB_USERNAME "karthikmuralidharan"

# Executable paths
set -gx PATH \
    /usr/local/opt/coreutils/libexec/gnubin \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/local/opt/nss/bin \
    /usr/bin \
    /bin \
    /usr/sbin \
    /sbin \
    /usr/local/opt/openjdk/bin \
    $HOME/bin \
    $HOME/.rbenv/shims \
    $HOME/.ngs/bin \
    $GOPATH/bin \
    $GOROOT/bin \
    /usr/local/opt/go/libexec/bin \
    /usr/local/opt/flutter/bin \
    /usr/local/opt/sqlite/bin \
    /usr/local/opt/ipython@5/bin \
    $HOME/.emacs.d/bin \
    $HOME/anaconda3/bin

# Theme configurations for bobthefish
set -g theme_display_ruby no
set -g theme_display_cmd_duration no
set -g theme_display_date no
set -g theme_color_scheme dark

# init direnv
if type -q direnv
    eval (direnv hook fish)
end

# init rbenv
if type -q rbenv
    rbenv init - | source
end

# init nvm
set -g NVM_DIR $HOME/.nvm

## aliases
function vim
    nvim $argv
end

function vi
    nvim $argv
end

function prune_branches
    git branch --merged | egrep -v "(^\*|main|master|dev|develop)" | xargs git branch -d
end

set -g fish_user_paths "/usr/local/opt/texinfo/bin" $fish_user_paths

if type -q conda
    source $HOME/anaconda3/etc/fish/conf.d/conda.fish
end

starship init fish | source

# Created by `pipx` on 2022-01-27 06:46:37
set PATH $PATH /Users/karthik.muralidharan/.local/bin

# Created by `pipx` on 2022-01-27 06:46:39
set PATH $PATH /Users/karthik.muralidharan/Library/Python/3.9/bin
