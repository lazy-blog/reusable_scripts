#!/bin/bash

addKey(){
mkdir ~/.ssh
cd ~/.ssh
echo "Host $HOST
  StrictHostKeyChecking no
  AddKeysToAgent yes
  IdentityFile ~/.ssh/$NAME
" >>config
echo "$SSHKEY" >$NAME
chmod 600 $NAME
}

push(){
rm -rf .git
git init . --initial-branch=main
git config --global user.email lazy-blog@exapmle.com
git config --global user.name lazy-blog@example.com
git add .
git commit -m1
git remote add o "$REMOTE"
git push o main -f
}

eval $(ssh-agent)

if [ -n "$SSHKEY_CODEBERG" ];then
  (NAME=codeberg HOST=codeberg.org SSHKEY="$SSHKEY_CODEBERG" addKey)
  REMOTE="$REMOTE_CODEBERG" push
fi
