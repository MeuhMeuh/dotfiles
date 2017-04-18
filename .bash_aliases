alias ggrep='git grep'
alias gpm='git pull origin master'

alias lfvmold='cd /Users/alexismenard/lafourchette-vm'
alias lfvm='cd /Users/alexismenard/Projects/lafourchette-vm-55'
alias lfroot='cd /Users/alexismenard/Projects/lf'
alias lfcore='cd /Users/alexismenard/Projects/lf/lafourchette-core'
alias lfportal='cd /Users/alexismenard/Projects/lf/lafourchette-portal'
alias lfb2b='cd /Users/alexismenard/Projects/lf/lafourchette-b2b'
alias lfrr='cd /Users/alexismenard/Projects/lf/lafourchette-rr'
alias lfb2cmobile='cd /Users/alexismenard/Projects/lf/lafourchette-b2c-mobile'
alias lfbo='cd /Users/alexismenard/Projects/lf/lafourchette-bo'
alias jarvis='cd /Users/alexismenard/Projects/lf/jarvis'
alias integ5='ssh vagrant@ssh.integ5.lafourchette.io'
alias integ18='ssh vagrant@ssh.integ18.lafourchette.io'
alias helpdeskservice='cd /Users/alexismenard/Projects/lf/helpdesk-service'
alias hs='cd /Users/alexismenard/Projects/lf/helpdesk-service'

alias cvm='lfvm && vagrant ssh'
alias cvmold='lfvmold && vagrant ssh'

alias projects='cd ~/workspace/lafourchette/www/'
alias bashrc='source ~/.bashrc'
alias aliases='vim ~/.bash_aliases'

# 78.109.92.142
alias web1-fenix="ssh lafourchette@78.109.92.142 -i ~/.ssh/id_rsa"
# preprod - ip : 78.109.92.226 1
alias web1-fenix.preprod="ssh lafourchette@78.109.92.226 -i ~/.ssh/id_rsa"
# preprod - ip : 78.109.92.227 2
alias web2-fenix.preprod="ssh lafourchette@78.109.92.227 -i ~/.ssh/id_rsa"


alias phpspec='bin/phpspec'
alias behat='bin/behat'

alias cacl='app/console ca:cl'

alias vimrc='vim ~/.vimrc'
alias vimconf='cd ~/.vim/'
alias ctags-generate='ctags -R --languages=PHP --PHP-kinds=cif --exclude=.git/* --exclude=vendor/*/vendor --fields=+aimS'
alias dev7='ssh lafourchette@par-dev7.us.tripadvisor.local'
alias syslog='ssh -A -t deploy@10.10.2.66 ssh webadmin@lafourchette.infra.rsyslog-01'
alias syslog2='ssh -A -t deploy@10.10.2.66 ssh webadmin@lafourchette.infra.rsyslog-02'

alias ctags-herzult='docker run -it --rm -v $PWD:/app herzult/composer-ctags'

alias copy='pbcopy'

alias checkcoverage='bin/phpspec run --config=phpspec.coverage.html.yml'
alias mcomposer='php -dmemory_limit=-1 /usr/local/bin/composer'

# ELK
alias runfilebeat='sudo filebeat -e -c filebeat.yml -d "publish"'
alias runlogstash='logstash -f sf-pipeline.conf --config.reload.automatic'

alias workshop='cd /Users/alexismenard/Projects/nodejs-workshop'
