# TASKLOG-DATA-048
**Task:** TASK-DAT-048 - Create an interactive plot with Plotly
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Created an interactive bar chart.
**Details:**
- Plotly generates interactive HTML/JS plots.
**Command:**
```shell
# In a python script
import plotly.express as px
fig = px.bar(df, x='fruit', y='count')
fig.show()
```
**Output:**
```text
(Interactive plot opens in browser)
```