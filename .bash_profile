# Added by install_latest_perl_osx.pl
[ -r /Users/rukmal/.bashrc ] && source /Users/rukmal/.bashrc

# Enabling colors in terminal
#===========================
export CLICOLOR=1
# Color scheme for 'light' terminal themes
export LSCOLORS=GxFxCxDxBxegedabagaced # Color scheme for 'light' terminal themes
# export LSCOLORS=ExFxBxDxCxegedabagacad # Color scheme for 'dark' terminal themes

# Custom aliases
#==============
alias ll='ls -l'
alias push='git push'
alias pull='git pull'

# Function for git commit and push
# Usage: gg [commit message] [branch to be push to]
function gp () {
	git add -A;
	git commit -m "$1";
	git push origin $2;
}