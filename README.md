# React CI/CD Pipeline Project 🚀

## 📌 Project Overview

This project demonstrates a complete beginner-to-intermediate CI/CD workflow using:

* Jenkins Declarative Pipeline
* Jenkins Scripted Pipeline
* GitHub Actions
* GitLab CI/CD
* Docker
* DockerHub Registry

The pipeline automatically:

* Pulls latest source code
* Installs dependencies
* Runs tests
* Builds React application
* Creates Docker image
* Pushes Docker image to DockerHub Registry

---

# 🛠 Technologies Used

| Technology     | Purpose              |
| -------------- | -------------------- |
| ReactJS        | Frontend Application |
| Docker         | Containerization     |
| GitHub Actions | CI/CD Automation     |
| Jenkins        | CI/CD Server         |
| GitLab CI/CD   | Pipeline Automation  |
| DockerHub      | Image Registry       |
| NodeJS         | Runtime Environment  |

---

# 📁 Project Structure

| File / Folder              | Purpose                  |
| -------------------------- | ------------------------ |
| src/                       | React source code        |
| public/                    | Public assets            |
| Dockerfile                 | Docker image creation    |
| Jenkinsfile                | Jenkins pipeline         |
| .github/workflows/main.yml | GitHub Actions workflow  |
| .gitlab-ci.yml             | GitLab CI/CD pipeline    |
| package.json               | Project dependencies     |
| .gitignore                 | Ignore unnecessary files |

---

# 📂 Important File Locations

## Jenkins Pipeline File

```text
Jenkinsfile
```

Root directory of project.

---

## GitHub Actions Workflow File

```text
.github/workflows/main.yml
```

---

## GitLab Pipeline File

```text
.gitlab-ci.yml
```

---

# 🔄 CI/CD Workflow

```text
Developer Pushes Code
        ↓
GitHub Actions Triggered
        ↓
Checkout Source Code
        ↓
Setup NodeJS
        ↓
Install Dependencies
        ↓
Run Tests
        ↓
Build React Application
        ↓
Build Docker Image
        ↓
DockerHub Login
        ↓
Push Docker Image
```

---

# 🐳 Docker Commands

## Build Docker Image

```bash
docker build -t trupalgorasiya/react-cicd-app .
```

---

## Run Docker Container

```bash
docker run -d -p 4000:3000 trupalgorasiya/react-cicd-app
```

---

## Check Running Containers

```bash
docker ps
```

---

## Push Image To DockerHub

```bash
docker push trupalgorasiya/react-cicd-app
```

---

# 🐳 Dockerfile

```dockerfile
FROM node:24

WORKDIR /myapp

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]
```

---

# ⚙️ GitHub Actions Pipeline

## File Path

```text
.github/workflows/main.yml
```

## Pipeline Code

```yaml
name: React CI Pipeline

on:
  push:
    branches:
      - main

jobs:

  build:

    runs-on: ubuntu-latest

    steps:

      - name: Checkout Source Code
        uses: actions/checkout@v4

      - name: Setup NodeJS
        uses: actions/setup-node@v4
        with:
          node-version: 24

      - name: Install Dependencies
        run: npm install

      - name: Run Tests
        run: npm test -- --watchAll=false --passWithNoTests

      - name: Build React Application
        run: npm run build

      - name: Build Docker Image
        run: |
          docker build -t trupalgorasiya/react-cicd-app:latest .
          docker build -t trupalgorasiya/react-cicd-app:${{ github.run_number }} .

      - name: DockerHub Login
        run: echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin

      - name: Push Latest Image
        run: docker push trupalgorasiya/react-cicd-app:latest

      - name: Push Version Image
        run: docker push trupalgorasiya/react-cicd-app:${{ github.run_number }}
```

---

# 🔐 GitHub Secrets Setup

## Path

```text
Repository
   ↓
Settings
   ↓
Secrets and variables
   ↓
Actions
```

## Required Secrets

| Secret Name     | Purpose                     |
| --------------- | --------------------------- |
| DOCKER_USERNAME | DockerHub Username          |
| DOCKER_PASSWORD | DockerHub Password or Token |

---

# 🔧 Jenkins Declarative Pipeline

## File Path

```text
Jenkinsfile
```

## Example

```groovy
pipeline {

    agent any

    stages {

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'npm test -- --watchAll=false --passWithNoTests'
            }
        }

        stage('Build Application') {
            steps {
                bat 'npm run build'
            }
        }
    }
}
```

---

# 🔧 Jenkins Scripted Pipeline

## Example

```groovy
node {

    stage('Install Dependencies') {
        bat 'npm install'
    }

    stage('Run Tests') {
        bat 'npm test -- --watchAll=false --passWithNoTests'
    }

    stage('Build Application') {
        bat 'npm run build'
    }
}
```

---

# 🔐 Jenkins Credentials Setup

## Path

```text
Manage Jenkins
   ↓
Credentials
   ↓
System
   ↓
Global Credentials
```

## Common Credentials

| Credential                  | Purpose           |
| --------------------------- | ----------------- |
| DockerHub Username/Password | Docker Login      |
| GitHub Token                | Repository Access |
| SSH Key                     | Server Deployment |
| AWS Access Keys             | Cloud Deployment  |

---

# 🦊 GitLab CI/CD Pipeline

## File Path

```text
.gitlab-ci.yml
```

## Example

```yaml
stages:
  - install
  - test
  - build

install_dependencies:
  stage: install
  script:
    - npm install

run_tests:
  stage: test
  script:
    - npm test -- --watchAll=false --passWithNoTests

build_application:
  stage: build
  script:
    - npm run build
```

---

# 🔐 GitLab Variables Setup

## Path

```text
Project
   ↓
Settings
   ↓
CI/CD
   ↓
Variables
```

## Common Variables

| Variable              | Purpose            |
| --------------------- | ------------------ |
| DOCKER_USERNAME       | DockerHub Username |
| DOCKER_PASSWORD       | DockerHub Password |
| AWS_ACCESS_KEY_ID     | AWS Authentication |
| AWS_SECRET_ACCESS_KEY | AWS Authentication |

---

# 📦 Docker Image Versioning

This project uses automatic image versioning:

| Tag    | Meaning               |
| ------ | --------------------- |
| latest | Latest stable image   |
| 1      | First pipeline build  |
| 2      | Second pipeline build |
| 3      | Third pipeline build  |

This helps with:

* Rollback
* Version tracking
* Stable deployments

---

# 📚 Concepts Learned

* Continuous Integration (CI)
* Continuous Deployment (CD)
* Docker Containerization
* Docker Image Build
* Docker Registry Push
* GitHub Actions
* Jenkins Pipelines
* GitLab CI/CD
* Secrets Management
* Automated Testing
* Automated Build Process

---

# 🚀 Future Improvements

* Docker Compose
* Kubernetes Deployment
* AWS EC2 Deployment
* Terraform Infrastructure
* Nginx Reverse Proxy
* Monitoring with Prometheus & Grafana

---

# 👨‍💻 Author

Trupal Gorasiya

DevOps & Cloud Enthusiast 🚀
