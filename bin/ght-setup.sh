#!/bin/bash

# silly hack because we don't know how to check if repo exists
rm -rf themes/*
git restore .keep

# load set up repositories
REPS=$(bin/stoml etc/configuration.toml repositories)
IFS=' '
read -ra REPOSITORIES <<< "$REPS"

# cloning repositories
cd themes || exit
for i in "${REPOSITORIES[@]}"
do
  echo cloning "$i"
  git clone "$i"
done

echo "run bin/ght-serve.sh to select a theme to test"
