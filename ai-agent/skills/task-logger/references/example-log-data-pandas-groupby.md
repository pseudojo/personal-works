# TASKLOG-DATA-052
**Task:** TASK-DAT-052 - Group data with pandas
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Grouped a dataframe by a column and calculated the mean.
**Details:**
- A common data aggregation technique.
**Command:**
```shell
python -c "import pandas as pd; ...; print(df.groupby('category')['value'].mean())"
```
**Output:**
```text
category
A    10.5
B    22.3
Name: value, dtype: float64
```