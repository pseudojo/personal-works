# TASKLOG-DATA-054
**Task:** TASK-DAT-054 - Read a Parquet file
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Read a Parquet file into a pandas DataFrame.
**Details:**
- Parquet is an efficient columnar storage format.
**Command:**
```shell
python -c "import pandas as pd; df = pd.read_parquet('data.parquet'); print(df.info())"
```
**Output:**
```text
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 1000 entries, 0 to 999
...
```