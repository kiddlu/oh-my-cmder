;= @echo off
;= rem Call DOSKEY and use this file as the macrofile
;= %SystemRoot%\system32\doskey /listsize=1000 /macrofile=%0%
;= rem In batch mode, jump to the end of the file
;= goto:eof
;= Add aliases below here
;= e.=explorer .
;= gl=git log --oneline --all --graph --decorate  $*
;= ls=ls --show-control-chars -F --color $*
;= pwd=cd
;= clear=cls
;= history=cat -n "%CMDER_ROOT%\config\.history"
;= unalias=alias /d $1
;= vi=vim $*
;= cmderr=cd /d "%CMDER_ROOT%"

;= git
ga=git add $*
gapa=git add --patch $*
gc!=git commit -v --amend $*
gcl=git clone --recursive $*
gclean=git reset --hard $t git clean -dfx
gcm=git checkout master $*
gcmsg=git commit -m $*
gco=git checkout $*
gd=git diff $*
gdca=git diff --cached $*
gl=git log --oneline --all --graph --decorate  $*
gp=git push $*
grbc=git rebase --continue $*
gst=git status $*
gup=git pull --rebase $*

;= windows
ep=explorer.exe $*
unalias=alias /d $1
clear=cls

cd=ccd.bat $*

