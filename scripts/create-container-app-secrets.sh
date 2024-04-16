SUBSCRIPTION_ID=$1
RESOURCE_GROUP=$2
SERVER_CONTAINER_APP_NAME=$3
COSMOSDB_ACCOUNT_NAME=$4

# list resource group names in subscription
#az account list --query "[].{name:id}" -o table

# list resource group names in subscription
#az group list --subscription $SUBSCRIPTION_ID --query "[].{name:name}" -o table

CONNECTION_STRING=$(az cosmosdb keys list \
  --subscription $SUBSCRIPTION_ID \
  --type connection-strings \
  --name $COSMOSDB_ACCOUNT_NAME \
  --resource-group $RESOURCE_GROUP \
  --query "connectionStrings[0].connectionString" -o tsv)

DATABASE_NAME=todo

echo $CONNECTION_STRING

az containerapp secret set \
    --subscription $SUBSCRIPTION_ID \
    --resource-group $RESOURCE_GROUP \
    --name $SERVER_CONTAINER_APP_NAME \
    --secrets "database-url=$CONNECTION_STRING" "database-name=$DATABASE_NAME"
