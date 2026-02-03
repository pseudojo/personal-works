# TASKLOG-DATA-053
**Task:** TASK-DAT-053 - Optimize a function with SciPy
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Found the minimum of a mathematical function.
**Details:**
- Used `scipy.optimize.minimize`.
**Command:**
```shell
# In a python script
from scipy.optimize import minimize
...
result = minimize(f, x0)
```
**Output:**
```text
fun: 1.234
 success: True
       x: array([ 0.5, -0.2])
```