# Octopus Zero to Hero

Welcome to Octopus Zero to Hero! This project is designed to help you follow along during our "Zero to Hero" Octopus Deploy webinar. By following this guide, you'll be able to deploy a sample .NET application to a Kubernetes cluster using Octopus Deploy.

## Prerequisites

Before getting started, please make sure you have the following:

- A Kubernetes cluster. You can use any of the following options:

  - Docker Desktop with Kubernetes extension enabled
  - Minikube
  - A cloud-based Kubernetes cluster (e.g., Azure Kubernetes Service (AKS), Amazon EKS, or Google Kubernetes Engine (GKE)).

- Helm installed
- kubectl CLI installed

## Getting Started

### Fork this Repositry 

Start by forking this repository to your GitHub account. Then, clone your forked repository to your local machine:

`git clone https://github.com/yourusername/octopus-demo-template-net.git
cd octopus-demo-template-net`


### Configure Kubernetes Cluster

Ensure that your Kubernetes cluster is up and running. If you are using Docker Desktop:

- Make sure Docker Desktop is running.
- Go to Settings > Kubernetes and enable Kubernetes.

### Create GitHub Personal Access Token

 This token must have read:packages and repo scopes to enable pulling packages from the GitHub registry of your forked repository. You can create a token by following these steps:

  1. Go to your GitHub account settings.
  
  2. Navigate to Developer settings > Personal access tokens >   Generate new token.
  
  3. Select read:packages and repo scopes.

  4. Generate the token and keep it safe, as you'll need it during the deployment process.


**Following Along During the Webinar**

This repository and the example deployment are intended to be used as part of our "Zero to Hero" webinar. We will cover:

Setting up Octopus Deploy from scratch.

Configuring a Kubernetes target.

Deploying the provided .NET application.