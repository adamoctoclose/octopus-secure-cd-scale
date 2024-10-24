# Function to delete a namespace and all resources within it
function Remove-Namespace {
    param (
        [string]$namespace
    )
    
    Write-Host "Deleting namespace: $namespace and all its resources..."
    kubectl delete namespace $namespace
}

# Function to delete a Helm release and its associated namespace
function Remove-HelmReleaseAndNamespace {
    param (
        [string]$releaseName,
        [string]$namespace
    )
    
    Write-Host "Uninstalling Helm release: $releaseName in namespace: $namespace..."
    helm uninstall $releaseName --namespace $namespace
    
    Write-Host "Deleting namespace: $namespace and all its resources..."
    kubectl delete namespace $namespace
}

# Step 1: Remove the entire "zerotohero" namespace and all resources
Write-Host "Cleaning up zerotohero namespace..."
Remove-Namespace -namespace "zerotohero"

# Step 2: Remove the "octopus-deploy" namespace and Helm release
Write-Host "Cleaning up octopus-deploy Helm release and namespace..."
Remove-HelmReleaseAndNamespace -releaseName "octopus-deploy" -namespace "octopus-deploy"

# Step 3: Remove the "octopus-agent-octopus-local-agent" namespace and Helm release
Write-Host "Cleaning up octopus-local-agent Helm release and namespace..."
Remove-HelmReleaseAndNamespace -releaseName "octopus-local-agent" -namespace "octopus-agent-octopus-local-agent"

Write-Host "Cleanup completed!"
