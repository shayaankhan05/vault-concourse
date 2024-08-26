#!/bin/bash

# Set Vault address
export VAULT_ADDR='http://localhost:8200'

# Log in to Vault
vault login root_token

# Fetch credentials from Vault
credentials=$(vault kv get -format=json secret/data/vault-concourse | jq -r '.data')
username=$(echo $credentials | jq -r '.username')
password=$(echo $credentials | jq -r '.password')

# Output credentials for use in Concourse
echo "username: $username"
echo "password: $password"