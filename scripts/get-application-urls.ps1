# Define namespace and service name
param (
    [string]$Namespace = "default", # Default value is "default" if not specified
    [string]$ServiceName = "demo-frontend-service"
)

# Check if the service exists
$serviceExists = kubectl get service $serviceName -n $namespace -o jsonpath='{.metadata.name}' 2>&1
if ($serviceExists -ne $serviceName) {
    Write-Host "Service $serviceName not found in namespace $namespace"
    exit
}

# Retrieve the NodePort
$nodePort = kubectl get service $serviceName -n $namespace -o jsonpath='{.spec.ports[0].nodePort}'

# Display the URL using localhost and NodePort
if ($nodePort) {
    $url = "http://localhost:$nodePort"
    Write-Host "Your application URL is: $url"
}
else {
    Write-Host "Failed to retrieve NodePort."
}
