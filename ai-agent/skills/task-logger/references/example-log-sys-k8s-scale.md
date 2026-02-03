# TASKLOG-SYS-032
**Task:** TASK-OPS-032 - Scale a Kubernetes deployment
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Scaled the `my-app` deployment to 3 replicas.
**Details:**
- Increases the number of running pods for the application.
**Command:**
```shell
kubectl scale deployment/my-app --replicas=3
```
**Output:**
```text
deployment.apps/my-app scaled
```