# TASKLOG-SW-013
**Task:** TASK-DEV-013 - Run ESLint to find code issues
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Checked all JavaScript files in `src/` for linting errors.
**Details:**
- ESLint helps maintain code quality and find bugs.
**Command:**
```shell
npx eslint src/**/*.js
```
**Output:**
```text
/path/to/src/app.js
  10:5  error  'myVar' is assigned a value but never used  no-unused-vars
```