#  AWS Multi-Tier Web App Infrastructure via Terraform

![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge\&logo=terraform\&logoColor=white)
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge\&logo=amazon-aws\&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge\&logo=linux\&logoColor=black)
![Apache](https://img.shields.io/badge/apache-%23D42029.svg?style=for-the-badge\&logo=apache\&logoColor=white)

## Project Description

This repository contains the Infrastructure as Code (IaC) necessary to deploy a multi-tier, highly available, and auto-scaled web application on Amazon Web Services (AWS). The project is fully modularized, demonstrating best practices in Cloud architecture and automation.

The architecture distributes the load across multiple availability zones and isolates resources at the network level to ensure security and optimal performance.

## Solution Architecture

The deployment provisions the following resources in the `us-east-1` region:

* **Base Network:** A custom VPC (`10.0.0.0/16`) with DNS hostname support enabled.
* **Subnets:** 4 subnets in total distributed across two Availability Zones (`us-east-1a` and `us-east-1b`):

  * 2 Public Subnets (for NAT Gateways and the Load Balancer).
  * 2 Private Subnets (for the application's EC2 instances).
* **Routing & Internet Access:**

  * 1 Internet Gateway (IGW) attached to the VPC.
  * 2 NAT Gateways with Elastic IPs (EIP) hosted in the public subnets to provide internet access to private resources.
  * Public and private route tables.
* **Security & Access:** * Security Groups (`ALBSG` and `WebSG`) configured to allow HTTP traffic.

  * An IAM Instance Profile (`LT_Profile`) with the `AmazonEC2RoleforSSM` policy to allow secure connections to instances via AWS Systems Manager (SSM) without needing to open the SSH port to the public.
* **Compute & Scalability:**

  * **Application Load Balancer (ALB):** Public internet-facing load balancer fronting the instances.
  * **Launch Template:** Configured with `t2.micro` instances and Amazon Linux 2023, injecting an automated `user_data` script to install and start the Apache web server.
  * **Auto Scaling Group (ASG):** Ensures elasticity by deploying instances in the private subnets, with a minimum capacity of 1, a desired capacity of 2, and a maximum of 4 instances.

## Project Structure

The code is structured into modules to ensure reusability and easy maintenance:

```text
├── modules/                               ← Reusable Modules
│   ├── eip/
│   │   └── eip.tf
│   ├── elb/
│   │   ├── alb.tf
│   │   ├── lb_target_group.tf
│   │   └── variables.tf
│   ├── iam/
│   │   ├── iam_policy.tf
│   │   ├── iam_role.tf
│   │   └── iam_user.tf
│   ├── internet_gateway/
│   │   ├── internet_gateway.tf
│   │   └── variables.tf
│   ├── nat_gateway/
│   │   ├── nat_gateways.tf
│   │   └── variables.tf
│   ├── outputs/
│   │   └── output.tf
│   ├── route_table/
│   │   ├── route_table.tf
│   │   └── variables.tf
│   ├── security_group/
│   │   ├── security_group_albsg.tf
│   │   ├── security_group_websg.tf
│   │   └── variables.tf
│   ├── subnets/
│   │   ├── subnets.tf
│   │   └── variables.tf
│   ├── template/
│   │   ├── ami.tf
│   │   ├── asg.tf
│   │   ├── launch.tf
│   │   ├── userdata.sh
│   │   └── variable.tf
│   └── vpc/
│       ├── variables.tf
│       └── vpc.tf
└── projects/
    └── Project1/                          ← Main Configuration Environment
        ├── .terraform.lock.hcl            ← Terraform dependency lock file
        ├── main.tf                        ← Calls the modules
        ├── plan.out                       ← Terraform plan output file
        ├── provider.tf                    ← AWS provider configuration
        ├── tfplan                         ← Saved Terraform execution plan
        └── variables.tf                   ← Variables definition
```

## How to Deploy
Prerequisites

  -  Terraform installed.

  - AWS CLI installed and configured with valid credentials.

Execution Steps

- Clone the repository and navigate to the main directory:
  
    ```text
    git clone https://github.com/Juanda-2880/terraform_capstone_project.git
    cd Project1
    ```


- Initialize the Terraform environment:
This will download the necessary plugins for the AWS provider.

    ```text
    terraform init
    ```

- Plan the deployment:
Verify the resources that Terraform will create in your AWS account.
    
  ```text
    terraform plan
  ```
  
- Apply the changes:
    Deploy the infrastructure (confirm with yes when prompted).

    ```text
    terraform apply
    ```

- Verify the service:

Once finished, Terraform will display the Application Load Balancer's DNS in the outputs. Copy that URL into your browser and you should see the Apache server message: "This is an app server in AWS Region US-EAST-1".

## Cleanup (Resource Destruction)

To avoid unnecessary charges on AWS, remember to destroy the deployed infrastructure once you are done testing:

```text
terraform destroy
```
## Course Reference

Ultimate Terraform on AWS Bootcamp | Beginner to Advanced

This final project practically integrates the concepts, tools, and best practices learned throughout the course, taking them to a complete implementation oriented towards a real-world environment.

The repository reflects not only the technical application of this knowledge but also a progressive evolution in Infrastructure as Code (IaC) design, AWS resource organization, and deployment automation using Terraform.

Furthermore, it has been structured with the goal of serving as a long-term reference, demonstrating competencies in cloud architecture, modularization, scalability, and engineering best practices.

Link to the original course: https://www.udemy.com/share/10bVnZ3@cSg8guDsXT1Ae_OuLl19JqWEI48V19EivD_HohUItAOKdIHGhHkm6xB2M0GXl9FYOQ==/

## Author
Juan David Pacheco Vargas
Telematics Engineering Student & Cloud Enthusiast
