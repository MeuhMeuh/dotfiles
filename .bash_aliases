alias lfvmold='cd /Users/alexismenard/lafourchette-vm'
alias lfvm='cd /Users/alexismenard/Projects/lafourchette-vm-55'
alias lfroot='cd /Users/alexismenard/workspace/lafourchette/www'
alias lfcore='cd /Users/alexismenard/workspace/lafourchette/www/lafourchette-core'
alias lfportal='cd /Users/alexismenard/workspace/lafourchette/www/lafourchette-portal'
alias lfb2b='cd /Users/alexismenard/workspace/lafourchette/www/lafourchette-b2b'
alias lfrr='cd /Users/alexismenard/workspace/lafourchette/www/lafourchette-rr'
alias lfb2cmobile='cd /Users/alexismenard/workspace/lafourchette/www/lafourchette-b2c-mobile'
alias lfbo='cd /Users/alexismenard/workspace/lafourchette/www/lafourchette-bo'
alias integ5='ssh vagrant@ssh.integ5.lafourchette.io'
alias integ18='ssh vagrant@ssh.integ18.lafourchette.io'
alias helpdeskservice='cd /Users/alexismenard/workspace/lafourchette/www/helpdesk-service'

alias cvm='lfvm && vagrant ssh'
alias cvmold='lfvmold && vagrant ssh'

alias projects='cd ~/workspace/lafourchette/www/'
alias bashrc='source ~/.bashrc'
alias aliases='vim ~/.bash_aliases'

alias +web1-fenix="ssh lafourchette@web1-fenix -i ~/.ssh/id_rsa"
alias +web1-core.preprod="ssh lafourchette@web1-core.preprod -i ~/.ssh/id_rsa"
alias +web2-core.preprod="ssh lafourchette@web2-core.preprod -i ~/.ssh/id_rsa"
alias +web1-fenix-preprod="ssh lafourchette@78.109.92.226"


alias phpspec='bin/phpspec'
alias behat='bin/behat'

alias vimrc='vim ~/.vimrc'
alias ctags-generate='ctags -R --languages=PHP --PHP-kinds=cif --exclude=.git/* --exclude=vendor/*/vendor --fields=+aimS'
alias ctags-generate-source='ctags --options=~/.ctags src'
alias ctags-generate-vendor='ctags --options=/.ctags -fvendor.tags vendor'
