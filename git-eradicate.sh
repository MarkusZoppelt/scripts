git filter-branch -f  --index-filter \
'git rm -r --force --cached --ignore-unmatch Pods' \
    -- --all
rm -Rf .git/refs/original && \
git reflog expire --expire=now --all && \
git gc --aggressive && \
git prune
