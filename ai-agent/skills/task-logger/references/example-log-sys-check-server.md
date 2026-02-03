# TASKLOG-SYS-003
**Task:** TASK-0012.1 - Check the status of a web server
**Timestamp:** 2026-02-04T11:10:00Z
**Date:** 2026-02-04
**Action:**
Used `curl` to check the health endpoint of the production web server.
**Details:**
- The `-I` flag fetches headers only.
- A `200 OK` status indicates the server is healthy.
**Command:**
```shell
curl -I https://api.example.com/health
```
**Output:**
```text
HTTP/2 200
content-type: application/json
...
```