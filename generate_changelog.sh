#!/bin/bash

version=$( git describe --tags --always )
tag=$( git describe --tags --always --abbrev=0 )

if [ "$version" = "$tag" ]; then # on a tag
  current="$tag"
  previous=$( git describe --tags --abbrev=0 HEAD~ )
  if [[ $previous == *beta* ]]; then
    if [[ $tag == *beta* ]]; then
      previous=$( git describe --tags --abbrev=0 HEAD~ )
    else
      previous=$( git describe --tags --abbrev=0 --exclude="*beta*" HEAD~ )
    fi
  else
    previous=$( git describe --tags --abbrev=0 HEAD~ )
  fi
else
  current=$( git log -1 --format="%H" )
  previous="$tag"
fi

date=$( git log -1 --date=short --format="%ad" )
url=$( git remote get-url origin | sed -e 's/^git@\(.*\):/https:\/\/\1\//' -e 's/\.git$//' )

cat AtlasLootClassic/Documentation/Release_Notes.md > "Changelog.md"

echo -ne "# [${version}](${url}/tree/${current}) ($date)\n\n[Full Changelog](${url}/compare/${previous}...${current})\n\n" >> "CHANGELOG.md"

if [ "$version" = "$tag" ]; then # on a tag
  echo -ne "## Commits\n\n" >> "CHANGELOG.md"
fi

git shortlog --no-merges --reverse "$previous..$current" | sed -e  '/^\w/G' -e 's/^      /- /' >> "CHANGELOG.md"
