#!/bin/bash
set -e


# build all the things
hugo --verbose

# understand the commit message
msg="Rebuilding site `date`."
if [ $# -eq 1 ]
  then msg="$1"
fi

# commit generated code
pushd public
git add .
git commit -m "$msg"
git push origin master

# commit source code
popd
git add .
git commit -m "$msg"
git push origin master

echo "All done."
