#!/bin/bash 
createTunnel(){   
  /usr/bin/ssh -N -R 60000:localhost:22 emailuser@EXTERNALIP
   
  if [[ $? -eq 0 ]]; then
    echo Tunnel to jumpbox created successfully   
  else
    echo Error creating a tunnel to jumpbox. RC was $?   
  fi 
} 
/bin/pidof ssh 
if [[ $? -ne 0 ]]; then
  echo Creating new tunnel connection
  createTunnel 
fi