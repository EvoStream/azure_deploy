# Deploy Azure Autoscale VMSS

Deployment of a VM Scale Set of Linux VMs behind a load balancer with NAT rules. The VM Scale Set scales up when the average CPU usage across all VMs > 60% and scales down when the average CPU < 30%.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FEvoStream%2Fazure_deploy%2Fmaster%2Ftemplate.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2FEvoStream%2Fazure_deploy%2Fmaster%2Ftemplate.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

## Description

This template allows you to deploy a VM Scale Set of Linux VMs using Ubuntu 14.04. These VMs are behind an load balancer with NAT rules. Because the load balancer is internal, you must first ssh into the jumpbox, then ssh from there into a specific VM behind the load balancer. To connect from the load balancer to a VM in the scale set, you would go to the Azure Portal, find the load balancer of your scale set, examine the NAT rules, then connect using the NAT rule you want. For example, if there is a NAT rule on port 50000, you could use the following command from the jumpbox:

`ssh -p 50000 {username}@{public-ip-address}`

## Instructions

- Deploy the scale set with an instance count of 1
- After it is deployed look at the resource group public IP address resource (in portal or resources explorer). Get the IP or domain name.
- To start loading the first VM browse dns:8800/demo_index.php, enter the duration in seconds, e.g. 600 for 10 minutes, then click the [Do Work] button
- After around 15 minutes the VM Scale Set capacity will increase
- Wait for around 15 minutes more for the VM Scale Set capacity to decrease
 
## Parameter Restrictions

- `vmssName` must be 3-9 characters in length
- `instanceCount` must be 100 or less

## Reference

This template was based on the following samples from Microsoft:
- https://github.com/Azure/azure-quickstart-templates/tree/master/201-vmss-internal-loadbalancer
- https://github.com/gbowerman/azure-myriad/tree/master/vmss-ubuntu-scale

