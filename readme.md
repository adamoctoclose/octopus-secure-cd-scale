# Octopus Zero to Hero

<img width="1186" alt="zero-to-hero" src="https://github.com/user-attachments/assets/33f50757-9145-4642-bc14-d7461da0b682">

Welcome to Octopus Zero to Hero! This project is designed to help you follow along during our "Zero to Hero" Octopus Deploy webinar. By following this guide, you'll be able to deploy a sample .NET application to a Kubernetes cluster using Octopus Deploy.

## Octopus Deploy core concepts

We highly recommend reviewing the [Octopus docs](https://octopus.com/docs) to help you understand the core concepts. The [Octopus introduction](https://octopus.com/docs) and [getting started guide](https://octopus.com/docs/getting-started) combined with technology-specific docs ([Kubernetes](https://octopus.com/docs/kubernetes), [IIS](https://octopus.com/docs/deployments/windows/iis-websites-and-application-pools), [Tomcat](https://octopus.com/docs/deployments/java), etc) are great resources to help you go grow your Octopus experience from zero to hero.

## Prerequisites

Before getting started, please make sure you have the following:

- A Kubernetes cluster. You can use any of the following options:

  - Docker Desktop with Kubernetes extension enabled
  - Minikube
  - A cloud-based Kubernetes cluster (e.g., Azure Kubernetes Service (AKS), Amazon EKS, or Google Kubernetes Engine (GKE)).

- Helm installed
- kubectl CLI installed

## Getting Started

### Fork this Repository 

Start by forking this repository to your GitHub account. Then, clone your forked repository to your local machine:

```
git clone https://github.com/yourusername/octopus-demo-template-net.git
cd octopus-demo-template-net
```

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
