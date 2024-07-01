#!/bin/bash
# Generate random values for each environment variable and export
export APP_KEYS=$(node -e "console.log(require('crypto').randomBytes(32).toString('hex'))")
export API_TOKEN_SALT=$(node -e "console.log(require('crypto').randomBytes(16).toString('base64'))")
export ADMIN_JWT_SECRET=$(node -e "console.log(require('crypto').randomBytes(16).toString('base64'))")
export TRANSFER_TOKEN_SALT=$(node -e "console.log(require('crypto').randomBytes(16).toString('base64'))")
export JWT_SECRET=$(node -e "console.log(require('crypto').randomBytes(16).toString('base64'))")


# Optionally, write them to a .env file
echo "APP_KEYS=${APP_KEYS}" > .env
echo "API_TOKEN_SALT=${API_TOKEN_SALT}" >> .env
echo "ADMIN_JWT_SECRET=${ADMIN_JWT_SECRET}" >> .env
echo "TRANSFER_TOKEN_SALT=${TRANSFER_TOKEN_SALT}" >> .env
echo "JWT_SECRET=${JWT_SECRET}" >> .env

echo "Environment variables generated and exported:"
echo "APP_KEYS=${APP_KEYS}"
echo "API_TOKEN_SALT=${API_TOKEN_SALT}"
echo "ADMIN_JWT_SECRET=${ADMIN_JWT_SECRET}"
echo "TRANSFER_TOKEN_SALT=${TRANSFER_TOKEN_SALT}"
echo "JWT_SECRET=${JWT_SECRET}"
