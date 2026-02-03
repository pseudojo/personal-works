# TASKLOG-SW-012
**Task:** TASK-DEV-012 - Test a REST API with curl
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Sent a POST request to the `/api/users` endpoint.
**Details:**
- Sent a JSON payload to create a new user.
**Command:**
```shell
curl -X POST -H "Content-Type: application/json" -d '{"name": "John Doe"}' https://api.example.com/api/users
```
**Output:**
```text
{"id": 123, "name": "John Doe"}
```