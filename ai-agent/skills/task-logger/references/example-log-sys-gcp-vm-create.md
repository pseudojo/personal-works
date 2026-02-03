# TASKLOG-SYS-027
**Task:** TASK-OPS-027 - Create a GCP VM instance
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Created a new virtual machine instance on Google Cloud.
**Details:**
- Instance name: `dev-server-1`
- Machine type: `e2-medium`
**Command:**
```shell
gcloud compute instances create dev-server-1 --machine-type=e2-medium
```
**Output:**
```text
Created [https://www.googleapis.com/compute/v1/projects/...].
NAME          ZONE        MACHINE_TYPE  ...
dev-server-1  us-central1-a e2-medium     ...
```