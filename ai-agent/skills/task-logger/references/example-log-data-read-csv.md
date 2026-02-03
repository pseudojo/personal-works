# TASKLOG-DATA-001
**Task:** TASK-0014.1 - Read a CSV file with pandas
**Timestamp:** 2026-02-04T12:00:00Z
**Date:** 2026-02-04
**Action:**
Used a Python script with the pandas library to read `sales_data.csv`.
**Details:**
- The goal is to inspect the first 5 rows to understand the data structure.
- The script uses `pandas.read_csv()` and `df.head()`.
**Command:**
```shell
python -c "import pandas as pd; df = pd.read_csv('data/sales_data.csv'); print(df.head())"
```
**Output:**
```text
   OrderID   Product  Quantity  Price
0      101  Widget A         2  10.00
1      102  Widget B         1  15.50
...
```