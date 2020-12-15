#!/bin/bash

# copy sample site folders
declare -a arr=(
  "archetypes"
  "assets"
  "config"
  "content"
  "data"
  "i18n"
  "resources"
  "static"
)
for i in "${arr[@]}"
do
  if [ -d "$i" ]
  then
    # shellcheck disable=SC2115
    rm -rf "$i"/* && git restore "$i"/.keep
  fi
done
FILE=config.toml
if [[ -f "$FILE" ]]; then
  rm $FILE
fi
