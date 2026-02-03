# TASKLOG-SYS-040
**Task:** TASK-OPS-040 - Check disk usage
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Checked disk usage for the root filesystem.
**Details:**
- The `-h` flag makes the output human-readable.
**Command:**
```shell
df -h /
```
**Output:**
```text
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   20G   30G  40% /
```