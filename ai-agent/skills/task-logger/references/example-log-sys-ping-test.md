# TASKLOG-SYS-036
**Task:** TASK-OPS-036 - Test network connectivity with ping
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Pinged a remote host to check for connectivity.
**Details:**
- Sent 3 ICMP packets.
**Command:**
```shell
ping -c 3 google.com
```
**Output:**
```text
PING google.com (142.250.72.14): 56 data bytes
64 bytes from ...: icmp_seq=0 ttl=116 time=12.3 ms
...
```