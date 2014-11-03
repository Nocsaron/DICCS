test -r ~/.alias && . ~/.alias
PS1='GRASS 6.4.3 (ssn):\w > '
PROMPT_COMMAND="'/usr/lib/grass64/etc/prompt.sh'"
export PATH="/usr/lib/grass64/bin:/usr/lib/grass64/scripts:/home/posideon/.grass6/addons:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/grass64/bin:/usr/lib/grass64/scripts"
export HOME="/home/posideon"
export GRASS_SHELL_PID=$$
trap "echo \"GUI issued an exit\"; exit" SIGQUIT
