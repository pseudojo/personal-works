# TASKLOG-SYS-029
**Task:** TASK-OPS-029 - Run services with Docker Compose
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Started all services defined in `docker-compose.yml`.
**Details:**
- The `-d` flag runs containers in detached mode.
**Command:**
```shell
docker-compose up -d
```
**Output:**
```text
Creating network "my-project_default" with default driver
Creating my-project_web_1 ... done
Creating my-project_db_1  ... done
```