# aws-vpc-scenario2

I created this project in order to learn how to use [Terraform] to launch an Amazon AWS Virtual Private Cloud. I attempted to duplicate the configuration of [VPC Wizard Scenario 2: VPC with Public and Private Subnets (NAT)][scenario2] from the [AWS documentation].

## Quick Start

To use this project, we can start by [installing Terraform]. On my machine I also had to install AWS CLI before I could use the AWS provider in Terraform. Once you have Terraform installed and working and the project files have been placed in a directory of your choice, rename the file 'terraform.tfvars.example' to 'terraform.tfvars'. Edit the terraform.tfvars file to add your AWS Access Key, AWS Secret Key, AWS Key Path, and AWS Key Name. If you need help figuring out what these should be, you can find more information on the [AWS credentials] page. Once your credentials are in place, you can execute the commands below to deploy this VPC to AWS. If you receive an error message about variables not being set, try to append '-var-file terraform.tfvars' to the end of the commands below.


#### Test/Plan

To test the configuration before actually applying it, run the following command. This allows you to test the execution plan to see if it is valid and to make any necessary changes before it is deployed.

```
terraform plan
```

#### Apply

To apply the configuration to AWS, run the following command:

```
terraform apply
```

#### Destroy

To kill the VPC when you are finished using it, you can roll back the changes like so:

```
terraform destroy
```


[Terraform]: http://terraform.io
[scenario2]: http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_Scenario2.html
[AWS credentials]: https://docs.aws.amazon.com/general/latest/gr/aws-security-credentials.html
[AWS documentation]: http://aws.amazon.com/documentation/
[installing Terraform]: https://terraform.io/intro/getting-started/install.html