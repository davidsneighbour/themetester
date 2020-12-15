#!/bin/bash

# theme selection
printf "Please select theme to run:\n"
cd themes || exit
select THEME in *; do test -n "$THEME" && break; echo ">>> Invalid Selection"; done
cd .. || exit

# add/touch instructions file for the theme
#touch introductions/"${THEME}".md

# copy sample site folders
declare -a arr=(
  "archetypes"
  "assets"
  "content"
  "config"
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
  FOLDER="themes/$THEME/exampleSite/$i/"
  [ -d "$FOLDER" ] && cp -R "$FOLDER"/* "$i"/
done
FILE=themes/"$THEME"/exampleSite/config.toml
if [[ -f "$FILE" ]]; then
  cp $FILE .
fi

# run verbose hugo server with theme
hugo server \
  --theme "$THEME" \
  --configDir = "themes/$THEME/exampleSite/config" \
  --minify \
  --disableFastRender \
  --i18n-warnings \
  --navigateToChanged  \
  --templateMetrics \
  --templateMetricsHints \
  --verbose \
  --verboseLog \
  --path-warnings \
  --buildDrafts \
  --buildExpired \
  --buildFuture \
  --watch \
  --enableGitInfo \
  --forceSyncStatic \
  --log true \
  --logFile hugo.log \
  --verbose
