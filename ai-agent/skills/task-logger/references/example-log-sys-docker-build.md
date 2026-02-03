# TASKLOG-SYS-002
**Task:** TASK-0011.1 - Build a Docker image
**Timestamp:** 2026-02-04T11:05:00Z
**Date:** 2026-02-04
**Action:**
Built a Docker image from the `Dockerfile` and tagged it as `my-app:1.0`.
**Details:**
- The `-t` flag is used for tagging the image.
- The `.` indicates that the build context is the current directory.
**Command:**
```shell
docker build -t my-app:1.0 .
```
**Output:**
```text
Sending build context to Docker daemon  12.34kB
...
Successfully built a1b2c3d4e5f6
Successfully tagged my-app:1.0
```