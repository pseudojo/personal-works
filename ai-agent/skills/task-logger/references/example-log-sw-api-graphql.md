# TASKLOG-SW-019
**Task:** TASK-DEV-019 - Test a GraphQL API
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Sent a query to a GraphQL endpoint to fetch user data.
**Details:**
- Used `curl` to send the GraphQL query.
**Command:**
```shell
curl -X POST -H "Content-Type: application/json" --data '{ "query": "{ user(id: \"1\" ) { name } }" }' http://api.example.com/graphql
```
**Output:**
```text
{"data":{"user":{"name":"John Doe"}}}
```