#!/bin/bash 
createTunnel(){   
  /usr/bin/ssh -N -R 60000:localhost:22 emailuser@EXTERNALIP # replace emailuser with the name of an email account that is granted access to the virtual machine
                                                             # replace EXTERNALIP with the external IP address of the virtual machine, can be obtained from GCP
   
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