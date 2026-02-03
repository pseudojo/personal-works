# TASKLOG-SW-003
**Task:** TASK-0007.1 - Refactor a function to improve readability
**Timestamp:** 2026-02-04T10:10:00Z
**Date:** 2026-02-04
**Action:**
Refactored the `calculate_price` function from a long series of `if/elif` to a dictionary-based lookup.
**Details:**
- The original function was hard to maintain.
- A dictionary lookup is more efficient and readable.
- This change does not alter the function's output, only its implementation.
**Command:**
```shell
# The 'replace' tool was used with the old and new function bodies.
# (Command intentionally omitted for brevity in this example)
```
**Output:**
```text
Successfully modified file: pricing.py (1 replacements).
```