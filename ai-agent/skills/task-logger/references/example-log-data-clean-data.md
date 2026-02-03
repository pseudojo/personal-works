# TASKLOG-DATA-003
**Task:** TASK-0023.1 - Clean a dataset by removing null values
**Timestamp:** 2026-02-05T09:05:00Z
**Date:** 2026-02-05
**Action:**
Used pandas to drop rows with any missing values from the customer dataset.
**Details:**
- Missing data can cause errors in downstream analysis.
- The `dropna()` method is used for this purpose. The change is saved back to a new CSV.
**Command:**
```shell
python -c "import pandas as pd; df = pd.read_csv('customers.csv'); df.dropna(inplace=True); df.to_csv('customers_cleaned.csv', index=False)"
```
**Output:**
```text
(No output, but a new file 'customers_cleaned.csv' is created)
```