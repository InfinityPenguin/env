export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"

eval "$(hub alias -s)"

# terminal
export LSCOLORS=exfxcxdxbxegedabagacad;

# git
## prompt: https://github.com/magicmonty/bash-git-prompt
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
	__GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
	source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
fi
export LANG="en_US.UTF-8"

## autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# leadgenie
alias lg-restart='cw && ./leadgenie.rb tear-down && ./leadgenie.rb start-website --dont-start-rails'

# personal
alias cj='cd /Volumes/AIDAN-DRIVE/self/journal'
alias jw='cj && vim ~/Documents/journal.md'
alias cw='cd ~/workspace/leadgenie'
alias jc='vim /Volumes/AIDAN-DRIVE/self/journal/current.md'
alias ls='ls -Glatr'

alias vim='/usr/local/bin/vim'

alias spotlight-reindex='sudo mdutil -E /'

# ruby
source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh

alias rcp='rails c production'
alias rcd='rails c'

# python
alias set_python='export PYTHONPATH=$PWD'

# mongo
export PATH="/usr/local/opt/mongodb-community@4.2/bin:$PATH"
ulimit -n 10000
alias mongo='mongo --host localhost --port 27021'

# gcp

## The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/aidanli/Documents/google-cloud-sdk/path.bash.inc' ]; then . '/Users/aidanli/Documents/google-cloud-sdk/path.bash.inc'; fi

## The next line enables shell command completion for gcloud.
if [ -f '/Users/aidanli/Documents/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/aidanli/Documents/google-cloud-sdk/completion.bash.inc'; fi

# alias sshsk='gcloud compute ssh --internal-ip rails-static-0 --zone us-central1-c'
alias sshsk="kubectl exec -n leadgenie -it $(kubectl get pods -n leadgenie | grep 'rails.*Running' | head -1 | awk '{print $1;}') bash"
alias gcp-prod='gcloud config set project indigo-lotus-415'
alias gcp-staging='gcloud config set project stage-23704'
alias kgp='kubectl get pods'

function sshstaging() {
	kubectl exec -it "$(kgp | awk '/sidekiq-processor/ {print $1}')" bash
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
NODE_OPTIONS=--max_old_space_size=4096

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
