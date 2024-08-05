set -x PATH /opt/homebrew/bin $PATH
set -x PATH ~/.orbstack/bin $PATH
set -x PATH ~/bin $PATH

# Starship
source (/opt/homebrew/bin/starship init fish --print-full-init | psub)

# Aliases
source ~/.config/fish/config_aliases.fish
source ~/.config/fish/config_secrets.fish
