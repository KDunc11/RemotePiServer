#!/bin/bash
# install google cloud platform CLI (command-line interface)
sudo apt update -y && sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean -y && sudo apt-get autoclean -y && sudo apt-get install software-properties-common build-essential cmake git wget curl mosh vim mlocate postgresql rclone nginx gunicorn python3-pip ca-certificates gnupg apt-transport-https -y && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && sudo apt-get install -y nodejs
echo "deb http://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && sudo apt-get update && sudo apt-get install google-cloud-sdk && sudo apt-get install google-cloud-sdk-app-engine-python && sudo apt-get install google-cloud-sdk-app-engine-python-extras -y
gcloud init # sign into your google cloud account
gcloud auth list # check that your account is authorized and active
gcloud alpha billing accounts list # use to view billing ID

# replace PROJECTNAME and BILLING ID with the desired name of the project and your account's billing ID
gcloud projects create PROJECTNAME && gcloud config set project PROJECTNAME && gcloud beta billing projects link PROJECTNAME --billing-account=BILLINGID
gcloud projects list

# replace VMINSTANCENAME with the name you want to name your cloud Virtual Machine instance
gcloud compute instances create "VMINSTANCENAME" --boot-disk-device-name "VMINSTANCENAME" --zone us-central1-f --machine-type f1-micro --image-project ubuntu-os-cloud --image-family ubuntu-2004-lts --boot-disk-size 30 --boot-disk-type "pd-standard" --maintenance-policy "MIGRATE" --tags http-server,https-server --scopes cloud-platform

# replace firewall names with whatever names suit your application
gcloud compute firewall-rules create FIREWALLNAME1 --allow tcp:5000 --direction=INGRESS && gcloud compute firewall-rules create FIREWALLNAME2 --allow tcp:5001 --direction=INGRESS && gcloud compute firewall-rules create FIREWALLNAME3 --allow udp:60000-61000  --direction=INGRESS
gcloud compute firewall-rules list

# replace USERNAME with the username of the google cloud platform account, replace timezone with the timezone that the instance is hosted in
gcloud compute instances add-tags USERNAME --zone TIMEZONE --tags=http-server,https-server

# replace USERNAME with the username of the google cloud platform account, replace VMINSTANCENAME with the name of the VM, replace IPINSTANCE with the external IP address of the VM instance
ssh-keygen -t rsa && cat ~/.ssh/id_rsa.pub > NAME.txt && sed -i '1s/^/USERNAME:/' NAME.txt && sed -i 's/\=.*/= USERNAME/' NAME.txt && gcloud compute instances add-metadata VMINSTANCENAME --zone=us-central1-f --metadata-from-file ssh-keys=NAME.txt && ssh USERNAME@IPINSTANCE