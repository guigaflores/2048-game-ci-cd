# CI/CD Pipeline on AWS - 2048 Game Deployment
This project demonstrates how to build a complete **CI/CD pipeline on AWS** to automate the deployment of a containerized web application (2048 game) using **AWS CodePipeline**, **CodeBuild**, **ECR**, and **ECS**.

## Project Overview
The goal of this project was to automate the deployment process of a containerized web application (2048 game) using AWS native services.
By implementing a CI/CD pipeline, I reduced manual steps, improved deployment consistency, and enhanced scalability.

## Prerequisites
1. Docker installation
2. Configure AWS CLI

## Architecture
The following diagram illustrates the AWS architecture used in this project:

<img width="991" height="556" alt="project-cicd-pipeline-aws" src="https://github.com/user-attachments/assets/697df786-fa77-4f1c-91b9-d12a622baecf" />

### Components:
- **GitHub**: Source repository for the application code.
- **AWS CodePipeline**: Orchestrates the CI/CD process.
- **AWS CodeBuild**: Builds the Docker image and pushes it to Amazon ECR.
- **Amazon ECR**: Stores container images.
- **Amazon ECS (Fargate)**: Runs the containerized application.

### How It Works
1. Push the updated code to a GitHub repository, which triggers the CI/CD pipeline in AWS CodePipeline
2. CodeBuild pulls the code, builds a Docker image for the application, tags it, and prepares it for deployment
3. The built Docker image is pushed to Amazon ECR as a new container image with a specific tag (ex.: latest).
4. CodePipeline uses CodeDeploy to update the ECS service, replacing the old container with the new one, ensuring the application runs with the updated version

## Project Setup
To replicate this project:
1. Clone this repository.  
2. Create an ECR repository in AWS.  
3. Set up a CodePipeline connected to your GitHub repo.
4. Configure CodeBuild to build and push Docker images to ECR.
5. Deploy the container to ECS (Fargate).

## Screenshots
<img width="1122" height="423" alt="project1-awscodepipeline" src="https://github.com/user-attachments/assets/8aac2feb-5103-4d83-ad8d-2d6459e2c7fc" />

## Challenges & Solutions
Throughout this project, I encountered a few challenges along the way:

- **Issue:** Selected the wrong container architecture/OS in the ECS task definition. Since the Docker image was built on a MacBook with an Apple Silicon chip, it used the linux/arm64 architecture by default, which didn’t match the ECS configuration (linux/x86_64).  
  **Solution:** Updated the ECS task definition to use the linux/arm64 architecture, matching the image built locally.

- **Issue:** ECS task failed due to CodeBuild image pull errors.  
  **Solution:** Pushed the Docker image to my ECR repository and updated the Dockerfile.

- **Issue:** CodePipeline did not trigger automatically on GitHub commits.  
  **Solution:** Verified the webhook configuration and branch settings.

These experiences helped me gain hands-on troubleshooting skills in cloud-native CI/CD pipelines.

## Learnings & Next Steps
This project strengthened my skills in AWS DevOps automation and CI/CD pipeline management, and inspired me to continue exploring advanced deployment strategies using AWS services.  
Next steps include adding automated testing stages and monitoring integrations (ex.: Amazon CloudWatch and SNS alerts).





