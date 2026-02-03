#!/bin/bash
# Appends a formatted action log to a markdown file using a mix of arguments and environment variables.
#
# Usage:
#   export LOG_DETAILS="details..."
#   export LOG_COMMAND="command..."
#   export LOG_OUTPUT="output..."
#   ./log-action.sh "path/to/logfile.md" "TASKLOG-ID" "Task Description" "Action Summary"
#
# Arguments:
# $1: LOG_FILE - The path to the markdown log file.
# $2: TASKLOG_ID - The unique identifier for the task log entry (e.g., TASKLOG-0001).
# $3: TASK_DESCRIPTION - A short description of the overall task.
# $4: ACTION_SUMMARY - A one-sentence summary of the specific action taken.
#
# Environment Variables:
# LOG_DETAILS: A more detailed, multi-line description of the action (e.g., using bullet points).
# LOG_COMMAND: The exact command or script that was executed.
# LOG_OUTPUT: The stdout/stderr from the command execution.

set -euo pipefail

# --- Input Validation ---
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 LOG_FILE TASKLOG_ID TASK_DESCRIPTION ACTION_SUMMARY"
    echo "Requires LOG_DETAILS, LOG_COMMAND, and LOG_OUTPUT environment variables to be set."
    exit 1
fi

if [ -z "${LOG_DETAILS-}" ] || [ -z "${LOG_COMMAND-}" ] || [ -z "${LOG_OUTPUT-}" ]; then
    echo "Error: One or more required environment variables are not set."
    echo "Please set LOG_DETAILS, LOG_COMMAND, and LOG_OUTPUT."
    exit 1
fi

LOG_FILE="$1"
TASKLOG_ID="$2"
TASK_DESCRIPTION="$3"
ACTION_SUMMARY="$4"

# --- Logic ---
mkdir -p "$(dirname "$LOG_FILE")"

TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
DATE=$(date -u +"%Y-%m-%d")

# Check if the file is new or empty to add the main header
if [ ! -s "$LOG_FILE" ]; then
    echo "# $TASKLOG_ID" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
fi

# Append the formatted log entry to the file
{
  echo "---"
  echo "**Task:** $TASK_DESCRIPTION"
  echo "**Timestamp:** $TIMESTAMP"
  echo "**Date:** $DATE"
  echo "**Action:"
  echo "$ACTION_SUMMARY"
  echo ""
  echo "**Details:"
  echo "$LOG_DETAILS"
  echo ""
  echo "**Command:"
  echo '```bash'
  echo "$LOG_COMMAND"
  echo '```'
  echo ""
  echo "**Output:"
  echo '```text'
  echo "$LOG_OUTPUT"
  echo '```'
  echo ""
} >> "$LOG_FILE"

echo "Action logged to $LOG_FILE"
