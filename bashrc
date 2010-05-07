source ~/.dotfiles/git_aliases
source ~/.dotfiles/rails_aliases

bind "set completion-ignore-case on" 
bind "set bell-style none" # No bell, because it's damn annoying
bind "set show-all-if-ambiguous On" # this allows you to automatically show completion without double tab-ing

alias et='mate .' # Open current folder with textmate
alias eprof="mate ~/.dotfiles" # Edit these files
alias pubkey='cat ~/.ssh/*.pub | pbcopy && echo "Keys copied to clipboard"' # Copy pub keys to clipboard

export CDPATH='.:~:~/Sites' # Search /Sites folder on 'cd' command

# Make git colourful
git config --global color.ui auto
