#!/bin/bash
# file: new-ssh-key.sh

PASSPHRASE=$1
PATH=$2
COMMENT=$3
if [ -z "$PASSPHRASE" ] then
    PASSPHRASE=""
fi
if [ -z "$PATH" ] then
    PATH="~/.ssh/id_rsa.pub"
fi
if [ -z "$COMMENT" ] then
	COMMENT="Gen new ssh key"
fi
ssh-keygen -t rsa -b 4096 -C $COMMENT -P $PASSPHRASE -f $PATH -q 
pbcopy < $PATH