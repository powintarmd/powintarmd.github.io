#! /bin/bash

function pause(){
        read -n 1 -p "$*" INP
        if [ $INP!='' ] ; then
                echo -ne '\b \n'
        fi
}
# repo: git@github.com:powintarmd/powintarmd.github.io.git
# npm install -g hexo

# hexo g
# pause 'Press any key to continue...'
# hexo s -p 4000
# pause 'Press any key to continue...'
# hexo d
# pause 'Press any key to continue...'
# git init
# git add .
# git commit -m "first commit"
# git branch -M master
# git remote add origin git@github.com:powintarmd/powintarmd.github.io.git
git remote set-url --add origin git@github.com:powintarmd/powintarmd.github.io.git

git status
pause 'Press any key to continue...'
git diff origin/master
pause 'Press any key to continue...'
git fetch origin master
pause 'Press any key to continue...'
git merge origin/master
pause 'Press any key to continue...'
git add -A
git status
pause 'Press any key to continue...'

# 智能判断.主要修改手动输入commit意见, 其他一般修改直接按enter默认按照时间提交即可.
read -p 'input commit comment(if you input nothing, it will commit with time-string automatically):' commit
#if [ $commit='' ] ; then
if [ ! -n "$commit" ] ; then
	git commit -am "$(date "+%Y-%m-%d %H:%M:%S")"
else
	git commit -am $commit
fi

git status
pause 'Press any key to continue...'
git log --oneline -10
pause 'Press any key to continue...'
git push -u origin master

# [Reference]
# https://www.cyberciti.biz/tips/linux-unix-pause-command.html
# http://linux-wiki.cn/wiki/zh-hans/%E7%94%A8shell%E5%AE%9E%E7%8E%B0bat%E7%9A%84pause
