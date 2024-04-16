az upgrade
az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights
az group create --location centralus --resource-group my-container-apps
az containerapp up --name my-container-app --resource-group my-container-apps --location centralus --environment 'my-container-apps' --image mcr.microsoft.com/k8se/quickstart:latest --target-port 80 --ingress external --query properties.configuration.ingress.fqdn