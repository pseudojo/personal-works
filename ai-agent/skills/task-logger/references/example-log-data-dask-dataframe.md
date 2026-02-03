# TASKLOG-DATA-058
**Task:** TASK-DAT-058 - Use Dask for parallel computation
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Created a Dask DataFrame to process a large CSV file.
**Details:**
- Dask allows for parallel, out-of-core computation on DataFrames.
**Command:**
```shell
import dask.dataframe as dd
ddf = dd.read_csv('large_dataset.csv')
result = ddf.groupby('column').value.mean().compute()
```
**Output:**
```text
(Parallel computation is executed)
```