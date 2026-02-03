# TASKLOG-SYS-035
**Task:** TASK-OPS-035 - Query a Prometheus instance
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Queried Prometheus for HTTP request rate.
**Details:**
- Used `curl` to query the HTTP API.
**Command:**
```shell
curl 'http://prometheus.example.com:9090/api/v1/query?query=rate(http_requests_total[5m])'
```
**Output:**
```text
{"status":"success","data":{"resultType":"vector","result":[{"metric":{...},"value":[1646632800,"12.34"]}]}}
```