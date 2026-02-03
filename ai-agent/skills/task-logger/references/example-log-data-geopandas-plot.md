# TASKLOG-DATA-056
**Task:** TASK-DAT-056 - Plot geospatial data
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Created a map from a shapefile using GeoPandas.
**Details:**
- GeoPandas extends pandas for geospatial data.
**Command:**
```shell
# In a python script
import geopandas
gdf = geopandas.read_file('world.shp')
gdf.plot()
```
**Output:**
```text
(Map is displayed)
```