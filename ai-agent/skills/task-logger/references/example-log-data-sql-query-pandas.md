# TASKLOG-DATA-055
**Task:** TASK-DAT-055 - Query a database with pandas
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Read data from a SQL database into a DataFrame.
**Details:**
- Uses SQLAlchemy as the connection engine.
**Command:**
```shell
# In a python script
import pandas as pd
from sqlalchemy import create_engine
engine = create_engine('sqlite:///mydatabase.db')
df = pd.read_sql('SELECT * FROM users', engine)
```
**Output:**
```text
(DataFrame is loaded into memory)
```