git rm --cached $(git ls-files -i -c --exclude-from=.gitignore | sed ':a;N;$!ba;s/\n/" "/g' | sed "s/.*/\"&\"/")
