# React CI/CD Pipeline using Jenkins

This project demonstrates a basic CI/CD workflow using:

- React.js
- GitHub
- Jenkins Pipeline
- Poll SCM
- Webhooks (Learning Concept)

The main goal of this project is to understand how Continuous Integration and Continuous Deployment work in real DevOps workflows.

---

# Project Overview

In this project:

1. A React application is created.
2. Source code is pushed to GitHub.
3. Jenkins connects with the GitHub repository.
4. Jenkins automatically detects new commits.
5. Jenkins Pipeline executes different stages.
6. The application becomes ready for deployment.

---

# Technologies Used

| Technology | Purpose |
|---|---|
| React.js | Frontend Application |
| GitHub | Source Code Management |
| Jenkins | CI/CD Automation |
| Git | Version Control |
| Node.js | JavaScript Runtime |
| npm | Package Manager |

---

# CI/CD Workflow

```text
Developer Push Code
        ↓
GitHub Repository
        ↓
Poll SCM / Webhook Trigger
        ↓
Jenkins Pipeline Starts
        ↓
Pull Latest Code
        ↓
Install Dependencies
        ↓
Run Tests
        ↓
Build Application
        ↓
Ready for Deployment