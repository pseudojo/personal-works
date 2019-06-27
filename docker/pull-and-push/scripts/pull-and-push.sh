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

function check_images {
  echo "Deploying image list..."
  for img in ${IMAGES[@]}; do
    echo "- Image : $img"
  done

  while true; do
    read -p "Do you run to deploy using these images (y/n)? " yn
    case $yn in
        [Yy]* )
          echo "OK. Run to deploy." 
          break ;;
        [Nn]* ) 
          echo "Stop to deploy."
          exit ;;
        * ) echo "Please answer yes or no. ";;
    esac
  done
}

function open_port {
  debug "open port"
  $BASE/start-prodrepo-port-forward.sh

  debug "--------------------"
  debug "`ps -ef | grep -v grep | grep 'ssh -N'`"
  debug "--------------------"
}

function close_port {
  debug "close port"
  $BASE/stop-prodrepo-port-forward.sh
}

function pull_image {
  set_env $1

  docker login $SOURCE_REPO
  docker pull $_source
  echo "--------------------"

  unset_env
}

function push_image {
  set_env $1

  docker tag $_source $_target
  docker push $_target

  if [ "$?" -ne 0 ]; then
    echo "  - fail or ignore push"
    echo "--------------------"
  fi

  unset_env
}

function cleaning_image_in_local {
  set_env $1
  
  docker image rm $_source
  docker image rm $_target
  echo "--------------------"
  
  unset_env
} 

function image_loop_test {
  for image in ${IMAGES[@]}; do
    set_env $image
    echo "image : $_image"
    echo "source : $_source"
    echo "target : $_target"
    unset_env

    echo "---------------------"
  done
}

# TEST ONLY
#image_loop_test
check_images

# MAIN START

open_port

echo "Pull images..."
for image in ${IMAGES[@]}; do 
  echo "  - Pull $SOURCE_REPO/$image"
  pull_image $image 
done
echo "===================="

echo "Push images..."
for image in ${IMAGES[@]}; do 
  echo "  - Push $TARGET_REPO/$image"
  push_image $image
done
echo "===================="

#echo "Clean images in local..."
#for image in ${IMAGES[@]}; do 
#  echo "  - Remove in local : $image"
#  cleaning_image_in_local $image 1>/dev/null 2>&1
#done
#echo "===================="

# cleaning-local-images.sh
$BASE/cleaning-local-images.sh

unset_env

close_port

# MAIN FINISH

echo "Done."

