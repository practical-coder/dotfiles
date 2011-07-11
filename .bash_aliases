alias ll='ls -trl'
alias la='ls -A'
alias l='ls -CF'
alias df='df -h'
alias du='du -h'
export MYSQL_TEE_FILE=`date +"%F"`_mysql_tee.log
alias mysql="mysql --tee=/home/jac/mysql_files/logs/$MYSQL_TEE_FILE"

# git
#alias gl='git pull'
#alias gp='git push'
#alias gpom='git push origin master'
#alias gd='git diff'
#alias gc='git commit'
#alias gca='git commit -a'
#alias gco='git checkout'
#alias gb='git branch'
#alias gst='git status'

