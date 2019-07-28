#!/bin/sh
NUM=+15713547289
 ME=+17032168658

SIGNAL="signal-cli -u $NUM"

if [ $# -eq 0 ]
  then
	  $SIGNAL receive
  else
	  case $1 in
		send)
	  		$SIGNAL send $ME
			;;
		attach)
			$SIGNAL send $ME -a $2
			;;
		*)
			$SIGNAL send $1
	  esac
fi
