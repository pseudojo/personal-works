# TASKLOG-SYS-034
**Task:** TASK-OPS-034 - Simulate a Jenkins pipeline step
**Timestamp:** 2026-02-06T10:00:00Z
**Date:** 2026-02-06
**Action:**
Simulated a build step in a Jenkinsfile.
**Details:**
- Jenkins pipelines are defined using a Groovy-based DSL.
**Command:**
```shell
# In Jenkinsfile
stage('Build') {
    steps {
        sh 'mvn clean install'
    }
}
```
**Output:**
```text
[INFO] Building my-app 1.0-SNAPSHOT
...
[INFO] BUILD SUCCESS
```