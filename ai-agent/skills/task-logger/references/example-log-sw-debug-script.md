# TASKLOG-SW-002
**Task:** TASK-0006.1 - Debug a Python script that fails to connect to the database
**Timestamp:** 2026-02-04T10:05:00Z
**Date:** 2026-02-04
**Action:**
Added a print statement to inspect the database connection string.
**Details:**
- The script `data_importer.py` was failing with a connection error.
- Suspecting an incorrect connection string, I'm adding a debug print line.
**Command:**
```shell
# Using 'replace' tool to add a print statement
gemini replace --file_path data_importer.py --old_string "conn = db.connect(conn_str)" --new_string "print(f'DEBUG: conn_str={conn_str}')\nconn = db.connect(conn_str)"
```
**Output:**
```text
Successfully modified file: data_importer.py (1 replacements).
```
