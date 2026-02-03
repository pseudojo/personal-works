# TASKLOG-DATA-050
**Task:** TASK-DAT-050 - Parse an XML file
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Parsed an XML file using Python's `xml.etree`.
**Details:**
- Extracted specific elements from the XML tree.
**Command:**
```shell
python -c "import xml.etree.ElementTree as ET; tree = ET.parse('data.xml'); root = tree.getroot(); print(root.find('item').text)"
```
**Output:**
```text
Value
```