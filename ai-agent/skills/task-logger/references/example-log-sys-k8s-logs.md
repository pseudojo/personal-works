# TASKLOG-SYS-031
**Task:** TASK-OPS-031 - View logs of a Kubernetes pod
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Viewed the logs for the `my-app` pod.
**Details:**
- The `-f` flag streams the logs live.
**Command:**
```shell
kubectl logs -f my-app-7f5d7d9d6b-abcde
```
**Output:**
```text
Server started on port 8080
...
```