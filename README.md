# 🚀 Automated Flask App Deployment using Terraform on AWS

This project demonstrates how to automatically deploy a simple Flask application to AWS EC2 using Terraform. It includes infrastructure as code (IaC), a `Makefile` for app setup, and GitHub Actions workflows for CI/CD and safe destruction.

---

## 📁 Project Structure

```
.
├── .github/
│ └── workflows/
│ ├── terraform.yml # CI/CD workflow (manual apply)
│ └── destroy.yml # Workflow to manually destroy resources
├── app/
│ ├── app.py # Flask application
│ └── requirements.txt # Flask dependency
├── terraform/
│   ├── main.tf # Terraform resource definitions
│   ├── variables.tf # Input variables
│   ├── outputs.tf # Public IP output
│   ├── terraform.tfvars # (Optional) Input values
│   ├── backend.tf # (Optional) S3 backend config
│   ├── key-pair.tf # (Optional) EC2 Key Pair configuration
│   ├── security-group.tf # Security Group definition
│   ├── instance.tf # EC2 Instance definition
│   └── vpc.tf # VPC Definition
├── Makefile # App startup automation (used in EC2)
├── README.md # Project documentation
└── .gitignore
```

---

## 🛠️ Prerequisites

- AWS Account + EC2 Key Pair
- Terraform CLI (>= 1.3.0)
- AWS CLI (configured)
- GitHub repository with:
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY` in `Repo → Settings → Secrets → Actions`

---

## 📦 Flask Application

<details> <summary>Show Code</summary>

    ```
        # File: app/app.py
        from flask import Flask
        app = Flask(__name__)

        @app.route('/')
        def hello():
        return "Hello from Flask deployed with Terraform on AWS!"

        if __name__ == "__main__":
        app.run(host='0.0.0.0', port=80)
    ```
</details> ```


## 🔧 Makefile 

 <details>
    <summary>Show Code</summary>

    ```makefile
    install:
    	echo "Starting Flask app installation..." 
    	cd app && pip3 install -r requirements.txt 
    	cd app && nohup python3 app.py &
    ```
  </details>


## 🚀 Terraform Deployment Steps
🔁 Initialize and Plan (auto-run via GitHub Actions)
* On each push to the main branch:

* Terraform init, validate, plan is run
 
* Plan artifact is saved
 
## ▶️ Manual Apply from GitHub UI
* Go to Actions → Terraform CI/CD - Manual Apply

* Click Run workflow

* This will apply the last plan and deploy EC2 + Flask app

---

## ✅ Output
You’ll see the public IP in GitHub Actions output and in terraform output.

## 🔥 Manual Destroy (Safe)
* To clean up resources manually:
 
* Go to Actions → Terraform Destroy

* Click Run workflow

* Type destroy in the prompt to confirm
 
<details> <summary>Show Code</summary>

    ```destroy
        inputs:
        confirm: "destroy"  # Required to continue
    ```
</details>``
    
## 💡 Customization Ideas
* Replace EC2 with Fargate or Beanstalk

* Add Load Balancer + Route53 DNS
 
* Store Flask code in S3 or ECR

* Use GitHub Environments for approval flows

* Add Terraform remote backend (S3 + DynamoDB locking)

---

## 📜 License
MIT License

---

## 🎓 FOR NEW LEARNERS

You can try with Customerization ideas provided.
Make sure you create your own repo to build with the help of this sample repo.
Writing code by yourself will Guide you more than just copy pasting it.
