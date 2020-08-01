if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

function vterm_printf
    if [ -n "$TMUX" ]
        # tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

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
    $HOME/.bin \
    $HOME/.rbenv/shims \
    $HOME/.ngs/bin \
    $GOPATH/bin \
    $GOROOT/bin \
    /usr/local/opt/go/libexec/bin \
    /usr/local/opt/flutter/bin \
    /usr/local/opt/sqlite/bin \
    /usr/local/opt/ipython@5/bin \
    $HOME/.emacs.d/bin

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

## functions
function vim
    nvim $argv
end
function vi
    nvim $argv
end

function prune_branches
    git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d
end

test -e {$HOME}/.iterm2_shell_integration.fish; and source {$HOME}/.iterm2_shell_integration.fish
set -g fish_user_paths "/usr/local/opt/texinfo/bin" $fish_user_paths
