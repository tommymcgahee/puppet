#!/bin/bash

sudo git -C $BASEPATH fetch --all

if [ -d "$BASEPATH/$CI_COMMIT_REF_NAME" ]; then 
    sudo  git -C $BASEPATH/$CI_COMMIT_REF_NAME reset --hard "origin/$CI_COMMIT_REF_NAME" 
else 
    sudo git clone git@gitlab.mcgahee.homelab:homelab/puppet.git $BASEPATH --branch "$CI_COMMIT_REF_NAME" 
fi

sudo librarian-puppet install --clean --verbose --path=$BASEPATH/$CI_COMMIT_REF_NAME/modules/