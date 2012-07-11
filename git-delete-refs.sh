#!/bin/bash

# eg: git-delete-refs.sh refs/tags/somthing*

for tag in $(git for-each-ref --format="%(refname:short)" $1); do
    git push origin :"$tag" 
done