# Terraform EC2 Deployment with CI/CD Pipeline

## Overview

This project demonstrates the use of Terraform to deploy an EC2 instance on AWS, where a static portfolio website is hosted using Apache. The project uses AWS CodeCommit, CodeBuild, and CodePipeline for CI/CD, and Terraform as the Infrastructure as Code (IaC) tool.

## Project Structure

- **Terraform Files**: Located in the main directory.
  - `ec2.tf`: Main Terraform configuration file to set up the EC2 instance.
  - `install_portfolio.sh`: User data script to install Apache and deploy the portfolio website on the EC2 instance.

- **Build Specifications**: Located in the `cicd/` directory.
  - `buildspec_plan.yml`: Defines the build stage for the pipeline.
  - `buildspec_destroy.yml`: Defines the destroy stage for the pipeline.

## Infrastructure Details

- **Provider Configuration**: AWS provider is configured to use a specific region and profile.
- **State Management**: Terraform state file is stored in an S3 bucket.
- **VPC Configuration**: Default VPC and subnet are used.
- **Security Group**: Configured to allow HTTP (port 80) and SSH (port 22) access.
- **EC2 Instance**: Amazon Linux 2 AMI is used, with Apache installed to serve the portfolio website.

## CI/CD Pipeline

The CI/CD pipeline is configured with AWS CodePipeline, and it includes the following stages:

1. **Source**: 
   - Source code is stored in AWS CodeCommit.
   
2. **Build**:
   - AWS CodeBuild executes `terraform apply` to create the infrastructure.
   - Configuration is defined in `buildspec_plan.yml`.

3. **Destroy**:
   - AWS CodeBuild executes `terraform destroy` to tear down the infrastructure.
   - Only happen if manually approved.
   - Configuration is defined in `buildspec_destroy.yml`.

## Setup Instructions

### Prerequisites

- AWS account with necessary permissions.
- Terraform installed locally.
- AWS CLI configured with appropriate credentials.
- AWS CodeCommit repository set up.

## CI/CD Pipeline Setup

1. **Create S3 Bucket for Terraform State**
   - `aws s3api create-bucket --bucket <bucket-name> --region us-east-1`
2. **Setup CodePipeline**
   - Create a new pipeline in AWS CodePipeline.
   - Add the CodeCommit repository as the source.
   - Configure CodeBuild projects for the build and destroy stages:
   - Use buildspec_plan.yml for the build stage.
   - Use buildspec_destroy.yml for the destroy stage.
3. **Trigger the Pipeline**
   - Make a commit to the CodeCommit repository to trigger the pipeline. Monitor the pipeline in the AWS Management Console to ensure successful execution.

## CleanUp

 - Approve the destroy stage to deprovision the resources.

!()

