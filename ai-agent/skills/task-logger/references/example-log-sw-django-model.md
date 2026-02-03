# TASKLOG-SW-007
**Task:** TASK-DEV-007 - Create a new Django model
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Defined a new `Product` model in the `shop` app.
**Details:**
- Model includes `name`, `price`, and `description` fields.
- Ran `makemigrations` and `migrate` afterwards.
**Command:**
```shell
python manage.py makemigrations shop
python manage.py migrate
```
**Output:**
```text
Migrations for 'shop':
  ...
Applying shop.0002_product... OK
```