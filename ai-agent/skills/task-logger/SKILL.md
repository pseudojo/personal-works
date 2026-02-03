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

### Step 2.3: Call the Logging Script

Use the `log-action.sh` script to write the entry. This is done by passing metadata as arguments and the detailed content as environment variables.

**Example Invocation:**

```bash
# 1. Set the multi-line content as environment variables
export LOG_DETAILS="- To understand the project structure before making changes.
- To check for the existence of a configuration file."
export LOG_COMMAND="ls -F"
export LOG_OUTPUT="README.md
src/
dist/
package.json"

# 2. Run the script with single-line metadata as arguments
# ./log-action.sh "LOG_FILE" "TASKLOG_ID" "TASK_DESCRIPTION" "ACTION_SUMMARY"
./scripts/log-action.sh "$LOG_FILE" "$TASKLOG_ID" "$TASK_DESCRIPTION" "List project root directory contents"
```

## 3. Reference Example

For a complete example of a well-formatted log file, **always refer to `references/example-log.md`**. This ensures consistency in the output.