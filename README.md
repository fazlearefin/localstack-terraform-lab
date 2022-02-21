# localstack-terraform-lab

## Background

The pupose of this readme is to show you how to use Terraform with LocalStack to test your infrastructure changes.

### What is localstack?

[LocalStack](https://github.com/localstack/localstack) sets up a local AWS mock environment on your development machine (laptop). You can use tools like the aws cli or terraform to interact with localstack which mimics AWS API.

There are several reasons you might want to use localstack:

- You do not want to incur AWS bills when trying to test your cloudformation templates or terraform code
- You do not have stable or inexpensive internet connection and want to work offline

Note that localstack definitely does not replace AWS and merely mimics AWS API. If you create, say an EC2 instance in localstack, it does not create a real EC2 instance into which you can ssh or RDP into.

### What is terraform?

[Terraform](https://github.com/hashicorp/terraform) is a well known tool from HashiCorp for setting up cloud infrastructure.

---

## Working with this repo

The purpose of this repo is to give you the barebones to use terraform with localstack and so the example infra merely creates a EC2 instance. With these barebones, you can write and test more complex infra.

### Step 0a Pre-requisites

You should have the following installed on your development machine. You can find instructuctions on how to install the following on the internet for your operating system.

- docker
- docker-compose
- terraform
- aws-cli

### Step 0b Clone this repo

```bash
git clone https://github.com/fazlearefin/localstack-terraform-lab.git
```

### Step 1 Start localstack

```bash
cd localstack-terraform-lab/01-localstack
./localstack-start.sh
# leave this terminal window open. Once you are done, press `Ctrl - C` to stop localstack.
```

### Step 2 Create the s3 and dynamodb backend

```bash
cd ../02-s3-dynamodb-backend
terraform init
terraform apply -auto-approve
# this will now create the s3 bucket for saving state files and dynamo db for locking
```

### Step 3 Create the sample ec2 instance

```bash
cd ../03-sample-ec2-infra
terraform init
terraform apply -auto-approve
# this will now create an ec2 instance and save the terraform state files in the s3 bucket you created in step 2
```

### Step 4 Destroying the infra

Go to the appropriate directories and run `terraform destroy -auto-approve` in reverse order (first the sample ec2 instance, then the backend s3+synamodb) to remove the infrastructure.

In order to stop localstack go the terminal window you left localstack running and press **Ctrl - C**

---

## aws-cli

You can use aws-cli to verify the infra that has been created. Source the `aws-cli-alias-setup.source` file to setup aws cli to work with localstack.

```
source aws-cli-alias-setup.source
aws s3 ls
```