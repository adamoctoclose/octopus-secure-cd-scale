helm upgrade octopus-deploy `
    --install `
    --namespace octopus-deploy `
    --create-namespace `
    --set octopus.acceptEula="Y" `
    --set mssql.enabled="true" `
    --set octopus.image.tag="2024.3" `
    oci://ghcr.io/octopusdeploy/octopusdeploy-helm
