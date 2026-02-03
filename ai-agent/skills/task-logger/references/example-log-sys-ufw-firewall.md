# TASKLOG-SYS-038
**Task:** TASK-OPS-038 - Configure a firewall
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Allowed incoming traffic on port 22 (SSH).
**Details:**
- Used `ufw` (Uncomplicated Firewall).
**Command:**
```shell
sudo ufw allow ssh
```
**Output:**
```text
Rule added
```