# aws-vpc-scenario2

I created this project in order to learn how to use [Terraform] to launch an Amazon AWS VPC. I attempted to duplicate the configuration of [VPC Wizard Scenario 2: VPC with Public and Private Subnets (NAT)][scenario2] from the [AWS documentation].

## Usage

Once Terraform is installed, Rename the file 'terraform.tfvars.example' to 'terraform.tfvars'. Edit the file contents to add your AWS Access Key, AWS Secret Key, AWS Key Path, and AWS Key Name. If you need help figuring out what these should be, you can find more information on the [AWS credentials] page. Once your credentials are in place, you can execute the following commands to deploy this VPC to AWS. If you receive an error message about variables not being set, try to append '-var-file terraform.tfvars' to the end of the commands below.


### Test/Plan

To test the configuration before actually applying it, run the following command. This allows you to test the configuration to see if it is valid and to make any necessary changes beforehand.

```
terraform plan
```

### Apply

To apply the configuration to AWS, run the following command:

```
terraform apply
```

### Destroy

To kill the VPC when you are finished using it, you can roll back the changes like so:

```
terraform destroy
```


[Terraform]: http://terraform.io
[scenario2]: http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html
[AWS credentials]: https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html
[AWS documentation]: http://aws.amazon.com/documentation/