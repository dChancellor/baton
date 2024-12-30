#!/bin/bash

MACOS="MacOS"
UBUNTU="Ubuntu"
OS="Unknown"

if [[ "$OSTYPE" == "darwin"* ]]; then
	OS=$MACOS
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
	if [[ "$DISTRIB_ID" == "Ubuntu" ]]; then
		OS=$UBUNTU
	fi
fi
