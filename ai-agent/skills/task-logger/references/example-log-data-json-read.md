# TASKLOG-DATA-049
**Task:** TASK-DAT-049 - Read a JSON file
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Read and parsed a JSON file using Python.
**Details:**
- Used the built-in `json` module.
**Command:**
```shell
python -c "import json; with open('data.json') as f: data = json.load(f); print(data['name'])"
```
**Output:**
```text
John Doe
```