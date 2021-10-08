#!/bin/bash
sudo service ssh restart # may have to enter the Raspberry Pi's password
# replace USERNAME with name of google cloud platform account username, replace IPINSTANCE with the external IP address of the VM instance
ssh -N -R 6000:localhost:22 USERNAME@IPINSTANCE