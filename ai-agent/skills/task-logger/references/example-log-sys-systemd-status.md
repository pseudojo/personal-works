# TASKLOG-SYS-039
**Task:** TASK-OPS-039 - Check a service status with systemd
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Checked the status of the `nginx` service.
**Details:**
- `systemctl` is the standard tool for managing services.
**Command:**
```shell
systemctl status nginx
```
**Output:**
```text
● nginx.service - A high performance web server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; ...)
     Active: active (running) since ...
```