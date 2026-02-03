# TASKLOG-SYS-037
**Task:** TASK-OPS-037 - Trace network path
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Traced the route to a remote host.
**Details:**
- Helps diagnose network latency issues.
**Command:**
```shell
traceroute google.com
```
**Output:**
```text
traceroute to google.com (142.250.72.14), 64 hops max
 1  gateway (192.168.1.1)  1.234 ms
 2  ...
```