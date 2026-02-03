# TASKLOG-SYS-041
**Task:** TASK-OPS-041 - Create a cron job
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Added a cron job to run a script daily.
**Details:**
- The job runs at 2 AM every day.
**Command:**
```shell
(crontab -l ; echo "0 2 * * * /path/to/script.sh") | crontab -
```
**Output:**
```text
(No output)
```