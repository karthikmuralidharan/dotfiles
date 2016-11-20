## IMPORTS
source $HOME/.config/fish/functions/groupon_access.fish

## EXPORTS
set fish_plugins emacs
set -g JRUBY_OPTS "-Xcext.enabled=true --debug"

# Theme configurations for bobthefish
set -g theme_display_ruby no
set -g theme_display_cmd_duration no

# Executable paths
set -g -x PATH /usr/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin $HOME/.bin $HOME/.rbenv/shims

## Functions
function emacs
  __launch_emacs $argv
end

function edit
  __launch_emacs $argv
end

function vim; nvim $argv; end
function vi; nvim $argv; end

function vic
  cd $HOME/Developer/vis/voucher-inventory-service
  bundle exec rails c
end

