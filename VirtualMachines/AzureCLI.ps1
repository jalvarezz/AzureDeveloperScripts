#login and set the context
az login --use-device-code
az account set --subscription "Your subscription name goes here"

#list the current resource group associated with the subscription
az group list --output table

#create a new group
az group create \
         --name "Group Name" \
         --location "eastus"

#get the available sizes
az vm availability-set list-sizes --output table

#create the virtual machine

#windows
az vm create \ 
      --resource-group "Group Name" \
      --name "Virtual Machine Name" \
      --image "win2016datacenter" \
      --admin-username "your vm user goes here" \
      --admin-password "your vm user password goes here" \
      --size "(Optional)"

#linux
az vm create \ 
      --resource-group "Group Name" \
      --name "Virtual Machine Name" \
      --image "UbuntuLTS" \
      --admin-username "your vm user goes here" \
      --authentication-type "ssh" \
      --ssh-key-value ~/.ssh/id_rsa.pub \
      --size "(Optional)"

#open access ports

#windows
az vm open-port \
      --resource-group "Group Name" \
      --name "Virtual Machine Name" \
      --port "3389"

#linux
az vm open-port \
      --resource-group "Group Name" \
      --name "Virtual Machine Name" \
      --port "22"

#list the IP Addresses
az vm list-ip-addresses \
      --resource-group "Group Name" \
      --name "Virtual Machine Name" \
      --output table

#delete the group and virtual machine
az group delete --name "Group Name"