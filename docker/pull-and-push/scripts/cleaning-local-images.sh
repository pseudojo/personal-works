#!/bin/bash

BASE="$( cd $(dirname $0) && pwd -P )"

source $BASE/image-list

SOURCE_REPO="gitlabrepo:4567"
TARGET_REPO="prodrepo-forward:5000"

DEBUG=0

function debug {
  if [ "$DEBUG" == "1" ]; then
    echo ">> [DEBUG] $@"
  fi
}

function set_env {
  _image=$1
  _source="${SOURCE_REPO}/$_image"
  _target="${TARGET_REPO}/$_image"
}

function unset_env {
  unset _image
  unset _source
  unset _target
}

function cleaning_image_in_local {
  set_env $1
  
  docker image rm $_source
  docker image rm $_target
  echo "--------------------"
  
  unset_env
} 

echo "Clean images in local..."
for image in ${IMAGES[@]}; do 
  echo "  - Remove in local : $image"
  cleaning_image_in_local $image 1>/dev/null 2>&1
done
echo "===================="

unset_env

