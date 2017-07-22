#!/bin/bash

sudo git -C $BASEPATH fetch --all

if [ -d "$BASEPATH/$CI_COMMIT_REF_NAME" ]; then 
    sudo  git -C $BASEPATH/$CI_COMMIT_REF_NAME reset --hard "origin/$CI_COMMIT_REF_NAME" 
else 
    sudo git clone $BASEPATH --branch "origin/$CI_COMMIT_REF_NAME" 
fi

sudo librarian-puppet install --clean --verbose --path=$BASEPATH/modules/