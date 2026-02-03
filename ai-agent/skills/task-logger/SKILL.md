---
name: task-logger
description: Enforces the logging of all actions into a markdown file in the 'tasklog' directory for every multi-step task. It provides a structured format and an automation script for consistency.
---

# Task Logger Workflow

This skill ensures that a detailed, structured log of all actions is maintained for every task. Adherence to this workflow is mandatory.

## 1. Task Initialization

At the very beginning of any multi-step task, you must define the task's scope and prepare for logging.

1.  **Create Task Identifiers:**
    *   **`TASKLOG_ID`**: Create a unique ID for the task using a timestamp. Format: `TASKLOG-$(date -u +"%Y%m%d-%H%M%S")`.
    *   **`TASK_DESCRIPTION`**: Create a concise, one-line summary of the user's core request. If using a task management tool like `backlog`, use the official task title.
    *   **`LOG_FILE`**: Define the path to the log file. Format: `./tasklog/${TASKLOG_ID}.md`.

2.  **Export Identifiers:** Export these variables to make them available for the duration of the task.
    ```bash
    export TASKLOG_ID="TASKLOG-..."
    export TASK_DESCRIPTION="..."
    export LOG_FILE="./tasklog/${TASKLOG_ID}.md"
    ```

## 2. Logging Each Action (The Loop)

For **every** tool you execute (`run_shell_command`, `replace`, `write_file`, etc.), you must follow this sequence:

### Step 2.1: Formulate Log Content

Before running the command, determine the "what" and "why".

*   **`ACTION_SUMMARY`**: Write a single, clear sentence describing the immediate goal of the action. (e.g., "List the contents of the source directory to identify the main application file.")
*   **`ACTION_DETAILS`**: Write a multi-line string explaining the context, reasoning, and details. Use bullet points for clarity. This is where you explain *why* you are taking this step.

### Step 2.2: Execute and Capture

1.  **Prepare the Command**: The shell command or tool call you are about to run.
2.  **Execute the Command**: Run the command using `run_shell_command` or another tool.
3.  **Capture the Output**: Save the entire `stdout` and `stderr` from the tool's result.

### Step 2.3: Log the Action

You must construct the log entry manually and append it to the log file.

If you are in an environment without a shell, you must construct the log entry manually and append it to the log file.

1.  **Read the existing log file** to see its current content.
2.  **Construct the new log entry** by following the template below.
3.  **Append the new entry** to the `LOG_FILE`.

**Log Entry Template:**

````markdown
---
**Task:** {TASK_DESCRIPTION}
**Timestamp:** {YYYY-MM-DDTHH:MM:SSZ}
**Date:** {YYYY-MM-DD}
**Action:**
{ACTION_SUMMARY}

**Details:**
{LOG_DETAILS}

**Command:**
```shell
{LOG_COMMAND}
```

**Output:**
```text
{LOG_OUTPUT}
```

````

**How to fill the template:**

*   `{TASK_DESCRIPTION}`: The variable you defined in the initialization step.
*   `{TIMESTAMP}` & `{DATE}`: Generate these using the current UTC time.
*   `{ACTION_SUMMARY}`: The single-sentence summary of the action.
*   `{LOG_DETAILS}`: The detailed, multi-line explanation.
*   `{LOG_COMMAND}`: The exact command you executed.
*   `{LOG_OUTPUT}`: The complete output from the command.

Ensure you append this to the `$LOG_FILE` correctly. The `---` separator is crucial for separating entries.

## 3. Reference Examples

For complete examples of well-formatted log files for different scenarios, **always refer to the files in the `references/` directory**.

- `references/example-log-python-task.md`
- `references/example-log-analysis-task.md`
- `references/example-log-skill-install-task.md`