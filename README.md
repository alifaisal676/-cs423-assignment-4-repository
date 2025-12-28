````markdown
# CS423 Assignment 4 – Terraform AWS Infrastructure

## Overview
This project deploys a simple AWS infrastructure using Terraform. The infrastructure includes:
- VPC with public and private subnets
- Internet Gateway and routing
- Security Groups for controlled access
- Two EC2 instances:
  - **Web Server (Public Subnet)** running Apache via user_data.sh
  - **Backend Server (Private Subnet)**

The project demonstrates **Infrastructure as Code (IaC)** and AWS resource automation.

---

## Terraform Version
- Terraform v1.6.6 or compatible

## AWS Region
- us-east-1 (can be modified in `provider.tf`)

---

## Setup Instructions

1. Clone the repository:
```bash
git clone <your-repo-url>
cd cs423-assignment-4
````

2. Configure AWS CLI with your IAM user:

```bash
aws configure
```

* Enter **Access Key ID** and **Secret Access Key** for a user with AdministratorAccess.
* Default region: `us-east-1`
* Default output format: `json`

3. Make user data script executable:

```bash
chmod +x user_data.sh
```

4. Initialize Terraform:

```bash
terraform init
```

5. Validate Terraform files:

```bash
terraform validate
```

6. Preview plan:

```bash
terraform plan
```

7. Apply Terraform:

```bash
terraform apply
```

Type `yes` when prompted.

---

## Testing the Infrastructure

1. After successful apply, copy the **public IP** of the web server (output by Terraform).
2. Open a browser and navigate to:

```
http://<WEB_SERVER_PUBLIC_IP>
```

You should see:

```
CS423 Assignment 4 Web Server
```

3. To SSH into the web server:

```bash
ssh -i ~/.ssh/id_rsa ubuntu@<WEB_SERVER_PUBLIC_IP>
```

---

## Notes / Considerations

* IAM User Creation:

  * The IAM user `terraform-cs423-devops` was **created manually** due to AWS permissions restrictions.
  * Terraform uses this user to provision all other resources.

* EC2 Instance Type:

  * `t3.micro` is used to ensure compatibility with Free Tier and availability in the selected region.

* Security Groups:

  * SSH access is restricted to your public IP `/32` for security.
  * HTTP access is open to the world (`0.0.0.0/0`).

---

## File Structure

```
cs423-assignment-4/
│
├── provider.tf
├── iam.tf (commented out due to manual creation)
├── vpc.tf
├── subnets.tf
├── routes.tf
├── security_groups.tf
├── keypair.tf
├── ec2.tf
├── outputs.tf
├── variables.tf
├── user_data.sh
└── README.md

<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/b7a2197d-c065-4cd0-ac5e-94eecbf75d86" />

