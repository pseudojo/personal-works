# TASKLOG-XXXXX

**Task:** TASK-0001.11 - Acceptance Criterion 1: Switch to cloudnative-pg

**Timestamp:** 2026-01-29T09:44:11Z
**Date:** 2026-01-29
**Action:** 
Switched the PostgreSQL deployment strategy from the Bitnami Helm chart to the `cloudnative-pg` Helm chart.

**Details:** 
- Renamed the old Bitnami ArgoCD application manifest: `mv 2-keycloak/02-deploy-postgres-app.yaml 2-keycloak/02-deploy-bitnami-postgres-app.yaml.bak`
- Created new ArgoCD application manifests for `cloudnative-pg` operator and cluster.
- This action fulfills the requirement to use `cloudnative-pg` for PostgreSQL deployment.

**Command:** 
```
command sample 1
command sample 2
...
command sample N
```

**Output:** 
```
output sample 1
output sample 2
...
output sample N
```
