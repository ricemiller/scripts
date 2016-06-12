#!/bin/bash

VALOR=$(synclient | grep TouchpadOff | awk '{ print $3  }')


if [[ $VALOR -eq 0 ]]; then
    VALOR=1

else 
    VALOR=0

fi
synclient TouchpadOff=$VALOR
