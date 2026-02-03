# TASKLOG-SYS-028
**Task:** TASK-OPS-028 - Create an Azure Resource Group
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Created a new resource group in Azure.
**Details:**
- Name: `MyResourceGroup`
- Location: `eastus`
**Command:**
```shell
az group create --name MyResourceGroup --location eastus
```
**Output:**
```text
{
  "id": "/subscriptions/.../resourceGroups/MyResourceGroup",
  "location": "eastus",
  "name": "MyResourceGroup",
  ...
```