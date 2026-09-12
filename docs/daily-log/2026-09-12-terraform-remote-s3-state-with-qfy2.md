# Terraform Remote S3 State with DynamoDB Lock

> **Date:** 2026-09-12 | **Theme:** Terraform & Cloud IaC | **Category:** Terraform

## Overview
Securing cloud infrastructure state with encrypted remote storage and distributed atomic locking.

## Architecture Diagram
```mermaid
flowchart LR
  User[Terraform Client] -->|1. Lock State| Dynamo[(DynamoDB Lock)]
  User -->|2. Read/Write State| S3[(Encrypted S3 Bucket)]
  User -->|3. Release Lock| Dynamo
```

## Implementation
```hcl
terraform {
  backend "s3" {
    bucket         = "corp-tfstate-prod"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```
