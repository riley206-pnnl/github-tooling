#!/bin/bash

MY_PATH="$(dirname -- "${BASH_SOURCE[0]}")"
MY_PATH="$(cd -- "$MY_PATH" && pwd)"
# path to the cloned github-tooling dir
GITHUB_TOOLING_PATH="$(dirname -- "${MY_PATH}")"
# parent of github-tooling
PARENT_PATH="$(dirname -- "${GITHUB_TOOLING_PATH}")"
echo $MY_PATH
echo $PARENT_PATH

# ## Absolut path to the file that should replace the one in the repo
REPLACE_FILE=$PARENT_PATH/files-to-copy/*

# ## Relative from any repos root
cp $REPLACE_FILE .
