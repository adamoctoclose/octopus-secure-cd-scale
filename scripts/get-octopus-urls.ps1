# Function to get the NodePort for a specific service port
function Get-OctopusDeployNodePort {
    param (
        [int]$servicePort  # The service port to fetch the NodePort for
    )
    
    try {
        if ($servicePort -eq 80) {
            # Get the NodePort for port 80
            $nodePort = kubectl get service octopus-deploy --namespace octopus-deploy -o jsonpath='{.spec.ports[?(@.port==80)].nodePort}'
        }
        elseif ($servicePort -eq 10943) {
            # Get the NodePort for port 10943
            $nodePort = kubectl get service octopus-deploy --namespace octopus-deploy -o jsonpath='{.spec.ports[?(@.port==10943)].nodePort}'
        }
        
        if ($nodePort) {
            return $nodePort
        }
        else {
            Write-Host "Error: Unable to fetch NodePort for service port $servicePort" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
    }
}

# Get the NodePort for port 80 (for local access)
$nodePort80 = Get-OctopusDeployNodePort -servicePort 80

# Get the NodePort for port 10943 (for container-to-container communication)
$nodePort10943 = Get-OctopusDeployNodePort -servicePort 10943

# Check if both NodePorts were retrieved successfully
if ($nodePort80 -and $nodePort10943) {
    # Construct the URLs
    $localURL = "http://localhost:$nodePort80"                                           # URL for access from your local machine (port 80)
    $internalRegistrationURL = "http://octopus-deploy.octopus-deploy.svc.cluster.local:80" # FQDN for registration (port 80)
    $internalCommunicationURL = "http://octopus-deploy.octopus-deploy.svc.cluster.local:10943" # FQDN for communication (port 10943)

    # Output the URLs
    Write-Host "You can access Octopus Deploy locally at: $localURL"
    Write-Host "Containers inside the cluster can register with Octopus Deploy at: $internalRegistrationURL"
    Write-Host "Containers inside the cluster can communicate with Octopus Deploy at: $internalCommunicationURL"
}
else {
    Write-Host "Error: Unable to retrieve necessary service details (NodePorts)" -ForegroundColor Red
}
