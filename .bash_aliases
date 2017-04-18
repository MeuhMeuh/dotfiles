alias ggrep='git grep'
alias gpm='git pull origin master'


alias bashrc='source ~/.bashrc'
alias aliases='vim ~/.bash_aliases'

alias phpspec='bin/phpspec'
alias behat='bin/behat'

alias cacl='app/console ca:cl'

alias vimrc='vim ~/.vimrc'
alias vimconf='cd ~/.vim/'
alias ctags-generate='ctags -R --languages=PHP --PHP-kinds=cif --exclude=.git/* --exclude=vendor/*/vendor --fields=+aimS'
alias ctags-herzult='docker run -it --rm -v $PWD:/app herzult/composer-ctags'

alias copy='pbcopy'

alias checkcoverage='bin/phpspec run --config=phpspec.coverage.html.yml'
alias mcomposer='php -dmemory_limit=-1 /usr/local/bin/composer'

# ELK
alias runfilebeat='sudo filebeat -e -c filebeat.yml -d "publish"'
alias runlogstash='logstash -f sf-pipeline.conf --config.reload.automatic'
alias ctags-generate-source='ctags --options=$HOME/.ctags.cnf --exclude=vendor'¬
alias ctags-generate-vendor='ctags --options=$HOME/.ctags.cnf -fvendor.tags --exclude=src'
