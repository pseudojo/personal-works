# TASKLOG-SYS-044
**Task:** TASK-OPS-044 - Run an Ansible playbook
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Ran a playbook to configure a web server.
**Details:**
- Automates server configuration.
**Command:**
```shell
ansible-playbook -i hosts playbook.yml
```
**Output:**
```text
PLAY [Configure web server] ...

TASK [Gathering Facts] ... ok
TASK [Install Nginx] ... changed
...
```