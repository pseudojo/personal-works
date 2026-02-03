# TASKLOG-SYS-030
**Task:** TASK-OPS-030 - List Kubernetes pods
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Listed all pods in the `default` namespace.
**Details:**
- Useful for checking the status of deployed applications.
**Command:**
```shell
kubectl get pods
```
**Output:**
```text
NAME                     READY   STATUS    RESTARTS   AGE
my-app-7f5d7d9d6b-abcde   1/1     Running   0          5m
```