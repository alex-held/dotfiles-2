# Use 'o' instead of 'open' (o ~/Sites will open the sites folder)
# If no arguments are supplied open the current folder
function o {
  open "${1:-.}"
}

# Copy pub keys to clipboard
function pubkey {
  cat "~/.ssh/${1:-id_rsa}.pub" | pbcopy
  echo 'Keys copied to clipboard'
}

function h {
  history | grep $1 | tail
}

# Restart passenger or pow server
function rp {
  if [ -e tmp ]; then
    touch tmp/restart.txt
    echo 'Restarting server...'
  else
    echo "You don't have a tmp directory, do you want to create one? (y/n)"
    read answer
      if [[ $answer = "y" || $answer = "Y" || $answer = "yes" ]]; then
        mkdir tmp
        echo 'Creating tmp directory...'
        touch tmp/restart.txt
        echo 'Restarting server...'
      fi
  fi
}

# Lucas Willett (@ltw_)
# https://github.com/ltw/oh-my-zsh/commit/5ae46606d964619b987b4a51b68cc82ee7a9db1d#diff-0
function saywhen {
  if "$@"
  then
    say "$1 $2 done."
    return 0
  else
    say "$1 $2 error."
    return 1
  fi
}

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

function __database_yml {
  if [[ -f config/database.yml ]]; then
    ruby -ryaml -rerb -e "puts YAML::load(ERB.new(IO.read('config/database.yml')).result)['${RAILS_ENV:-development}']['$1']"
  fi
}

function psql
{
  if [[ "$(__database_yml adapter)" == 'postgresql' ]]; then
    PGDATABASE="$(__database_yml database)" "$(/usr/bin/which psql)" "$@"
    return $?
  fi
  "$(/usr/bin/which psql)" "$@"
}
export PSQL_EDITOR='vim +"set syntax=sql"'
