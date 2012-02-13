alias ll='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias c='clear'
alias su='su -l'

# SSH Shortcuts
alias trisweb='ssh -4 trisweb.com'
alias tw='trisweb'
alias t='trisweb'
alias t4='trisweb -4'

## From Harley
# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff --ignore-space-at-eol' # add --color if you don't have color as default
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'
alias glg='git log'
alias gba='git branch -a'

# rails 3
alias rs='rails s'
alias rc='rails c'
alias rdb='rails db'
alias rg='rails g'

alias flashlog='tail -f -n 100 /Users/trisweb/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt'


alias setaws-ibex='export EC2_PRIVATE_KEY=~/.aws/ibex/pk.pem;
  export EC2_CERT=~/.aws/ibex/cert.pem;
  export EC2_SSH_ID=~/.aws/ibex/id_rsa-gsg-keypair.pem'

alias setaws-silvertip='export EC2_PRIVATE_KEY=~/.aws/silvertip/pk.pem;
  export EC2_CERT=~/.aws/silvertip/cert.pem;
  export EC2_SSH_ID=~/.aws/silvertip/id_rsa-gsg-keypair.pem'


if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

# Awesomely useful SSH proxying command (forced to use ipv4 so we're not double-tunneling)
# (Note: now turned into a shell script in ~/bin, but leaving here for reference).
#alias sshproxy='echo "Starting SOCKS5 Proxy through trisweb.com on 127.0.0.1:8888" && ssh -4 -D 8888 trisweb.com'

alias free='vm_stat 2'
alias svndowngrade='change-svn-wc-format . 1.5 --force'
alias svndowngrade4='change-svn-wc-format . 1.4 --force'
alias svn4='/usr/local/bin/svn'

export EDITOR='nano'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


export EDITOR="mate"

LTGREEN="\[\033[40;1;32m\]"
LTBLUE="\[\033[40;1;34m\]"
CLEAR="\[\033[0m\]"
GRAY2="\[\033[40;1;30m\]"
LIGHT_GRAY="\[\033[40;1;33m\]"

NORMAL='\033[0m'
BLUE='\033[34;01m'
CYAN='\033[36;01m'
GREEN='\033[32;01m'
RED='\033[31m'
GRAY='\033[37;01m'
YELLOW='\033[33;01m'

# show branch and dirty status
function minutes_since_last_commit {
  local NOW=`date +%s`
  local LAST_COMMIT=`git log --pretty=format:'%at' -1`
  local SECONDS_SINCE_LAST_COMMIT=$((NOW-LAST_COMMIT))
  local MINUTES_SINCE_LAST_COMMIT=$((SECONDS_SINCE_LAST_COMMIT/60))
  echo $MINUTES_SINCE_LAST_COMMIT
}

function minutes_with_color {
  local G="$(__gitdir)"
  if [ -n "$G" ]; then
    local MINUTES=`minutes_since_last_commit`
    if [ "$MINUTES " -gt 30 ]; then
        local COLOR=${RED}
    elif [ "$MINUTES" -gt 10 ]; then
        local COLOR=${YELLOW}
    else
        local COLOR=${GREEN}
    fi

    local SINCE_LAST_COMMIT="|${COLOR}${MINUTES}m${NORMAL}"
    echo ${SINCE_LAST_COMMIT}
  fi
}

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo " ⚡"
}

function parse_git_branch {
  local BRANCH=$(__git_ps1 "%s$(minutes_with_color)")
  [[ $BRANCH ]] && echo " [$BRANCH$(parse_git_dirty)]"
}

prompt_command() {
	export PS1="$LTGREEN\u$LTBLUE@\h:$LIGHT_GRAY\w$CLEAR"$(parse_git_branch)" ❯ "
}

PROMPT_COMMAND=prompt_command


# Old PS1 - keep for fun.
#PS1=$'\[\e[1;36m\]\u@\h:\[\e[22m\]\w\[\e[1m\]\$ \[\e[00m\]'
# Old version of what's done in the above prompt_command()
#PS1="\[\033[40;1;32m\]\\u@\\h \[\033[40;1;34m\]\\w${parse_git_branch}${parse_svn_revision}${pwd} ❯\[\033[0m\] "

test -r /sw/bin/init.sh && . /sw/bin/init.sh


# Amazon AWS stuff.

# Amazon Web Services
export EC2_HOME=/Users/trisweb/Silvertip/AWS/ec2-api-tools
export AWS_AUTO_SCALING_HOME=/Users/trisweb/Silvertip/AWS/AutoScaling-1.0.4.4
export AWS_CLOUDWATCH_HOME=/Users/trisweb/Silvertip/AWS/CloudWatch-1.0.0.24
export AWS_ELB_HOME=/Users/trisweb/Silvertip/AWS/ElasticLoadBalancing-1.0.1.23


#Java
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

#PATH
export PATH=/Users/trisweb/android/sdk/tools:/Users/trisweb/android/sdk/platform-tools:/Users/trisweb/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql83/bin:$PATH:$EC2_HOME/bin:$JAVA_HOME/bin:$AWS_AUTO_SCALING_HOME/bin:$AWS_CLOUDWATCH_HOME/bin:$AWS_ELB_HOME/bin:/usr/local/flex3sdk/bin

#Shortcuts
alias setaws1='export EC2_PRIVATE_KEY=/Users/trisweb/.aws/silvertip/pk.pem;
			   export EC2_CERT=/Users/trisweb/.aws/silvertip/cert.pem;
			   export EC2_SSH_ID=/Users/trisweb/.aws/silvertip/id_rsa-gsg-keypair.pem'
			
alias setaws2='export EC2_PRIVATE_KEY=/Users/trisweb/.aws/tharward/pk.pem; 
			   export EC2_CERT=/Users/trisweb/.aws/tharward/cert.pem; 
			   export EC2_SSH_ID=/Users/trisweb/.aws/tharward/id_rsa-gsg-keypair.pem' 

alias setaws3='export EC2_PRIVATE_KEY=/Users/trisweb/.aws/privatebeta/pk.pem;
               export EC2_CERT=/Users/trisweb/.aws/privatebeta/cert.pem;
               export EC2_SSH_ID=/Users/trisweb/.aws/privatebeta/id_rsa-gsg-keypair.pem'

alias ec2ssh='ssh -i $EC2_SSH_ID '

#cd

##
# Your previous /Users/trisweb/.bash_profile file was backed up as /Users/trisweb/.bash_profile.macports-saved_2009-11-21_at_13:56:41
##

# MacPorts Installer addition on 2009-11-21_at_13:56:41: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Initialization for FDK command line tools.Sat Feb 20 20:32:22 2010
FDK_EXE="/Users/trisweb/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/trisweb/bin/FDK/Tools/osx"
export PATH
export FDK_EXE


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
