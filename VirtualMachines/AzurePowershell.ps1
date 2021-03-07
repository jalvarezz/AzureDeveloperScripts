#login and set the context
Connect-AzAccount -SubscriptionName "Your subscription name goes here"
Set-AzContext -SubscriptionName "Your subscription name goes here"

#list the current resource group associated with the subscription
az group list --output table

#create a new group
New-AzResourceGroup -Name "Group Name" -Location "eastus"

#Create a credential to use in the VM
$username = 'demoadmin'
$password = ConvertTo-SecureString 'your vm user password goes here' -AsPlainText -Force
$WindowsCred = New-Object System.Management.Automation.PSCredential ($username, $password)

#create the virtual machine
New-AzVW
      -ResourceGroupName "Group Name" `
      -Name "Virtual Machine Name" `
      -Image "win2016datacenter" `
      -Credential $WindowsCred `
      -size "(Optional)" `
      -OpenPorts 3389

#list the IP Addresses
Get-AzPublicIpAddress `
      -ResourceGroupName "Group Name" `
      -Name "Virtual Machine Name" | Select-Object IpAddress

#delete the group and virtual machine
Remove-AzResourceGroup -Name "Group Name"