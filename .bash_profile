# Adding MacPorts to the path
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Read from .bashrc
# Add some kind of if statement that detects whether the bash_profile or the bashrc was read first. Depending on that, pick one to source from the other. If not, this leads to an infinite loop of sourcing bash configs.

# Enabling colors in terminal
#===========================
export CLICOLOR=1
# Colors for the terminal
BLUE="\[\033[0;34m\]"
RED="\[\033[1;31m\]"
# Custom aliases
#==============

# System function aliases
#------------------------
alias ll='ls -hl'
alias la='ls -a'
alias p='pwd'
alias pc='pwd | pbcopy' # Copy current working directory to clipboard
alias v='vim'
alias sl='ls' # Just to reduce the amount of errors I get from this

# Miscellaneous aliases
#----------------------
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'
alias serve='python -m SimpleHTTPServer'
alias cfind='cat ~/.bash_history | grep $1' # Search for X in bash history
alias mit='license-generator install mit -n "Rukmal Weerawarana" -y 2014' # Install the MIT license to the LICENSE file

# Adding SSH keys
#----------------
ssh-add .ssh/mullinslab_rsa &> /dev/null

# Git aliases
#------------
alias gif='git fetch' # Fetch from a repo
alias gis='git status' # Current status
alias gia='git add -A' # Add all files to scope
alias gih='git push heroku master' # Push to heroku
alias gich='git checkout $1' # Change to branch X
alias gid='git diff' # Show differences
alias gib='git checkout -b $1' # Make and switch to branch X

# Function for git add, commit and push
# Note: Commits ALL files in working directory.
# Usage: gip [commit message] [branch to be push to]
gip () {
	git add -A
	git commit -m "$1";
	git push origin $2;
}

# Function to delete an existing branch
# Note: PERMANENTLY deletes the branch. (no prompt)
# Usage gibd [branch to be deleted]
gibd () {
    git checkout master
    git branch -D $1
}

# Function for git add and commit
# Note: Commits ALL files in working directory.
# Usage: gic [commit message]
gic () {
	git add -A
	git commit -m "$1"
}

# Function to get the current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Bash prompt options (comment the unused ones out)
# PS1="$BLUE\W @ \h (\u)$CYAN`parse_git_branch` $BLUE\$ " # [dirname] @ [host] (user) (git branch) $
PS1="$BLUE[\u@\h \W]$RED\$(parse_git_branch) $BLUE\$ "
export PS1

# The next line updates PATH for the Google Cloud SDK.
source '/Users/rukmal/Applications/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/Users/rukmal/Applications/google-cloud-sdk/completion.bash.inc'
