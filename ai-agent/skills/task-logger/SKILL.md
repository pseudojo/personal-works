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

- `references/example-log-analysis-task.md`
- `references/example-log-data-arrow-ipc.md`
- `references/example-log-data-clean-data.md`
- `references/example-log-data-dask-dataframe.md`
- `references/example-log-data-generate-plot.md`
- `references/example-log-data-geopandas-plot.md`
- `references/example-log-data-json-read.md`
- `references/example-log-data-jupyter-cell.md`
- `references/example-log-data-numpy-array.md`
- `references/example-log-data-pandas-groupby.md`
- `references/example-log-data-parquet-read.md`
- `references/example-log-data-plotly-plot.md`
- `references/example-log-data-read-csv.md`
- `references/example-log-data-scikit-learn-train.md`
- `references/example-log-data-scipy-optimize.md`
- `references/example-log-data-seaborn-plot.md`
- `references/example-log-data-sql-query-pandas.md`
- `references/example-log-data-statsmodels-ols.md`
- `references/example-log-data-xml-parse.md`
- `references/example-log-gen-art-prompt.md`
- `references/example-log-gen-bird-watching-log.md`
- `references/example-log-gen-blog-post.md`
- `references/example-log-gen-board-game-find.md`
- `references/example-log-gen-book-flight.md`
- `references/example-log-gen-book-summary.md`
- `references/example-log-gen-brand-voice-guide.md`
- `references/example-log-gen-budget-create.md`
- `references/example-log-gen-business-plan.md`
- `references/example-log-gen-calendar-event.md`
- `references/example-log-gen-character-backstory.md`
- `references/example-log-gen-character-flaws.md`
- `references/example-log-gen-chess-opening.md`
- `references/example-log-gen-cocktail-recipe.md`
- `references/example-log-gen-cold-email-outreach.md`
- `references/example-log-gen-color-palette.md`
- `references/example-log-gen-company-name.md`
- `references/example-log-gen-competitive-analysis.md`
- `references/example-log-gen-currency-convert.md`
- `references/example-log-gen-dialogue-writing.md`
- `references/example-log-gen-dnd-encounter.md`
- `references/example-log-gen-dnd-inventory.md`
- `references/example-log-gen-elevator-pitch.md`
- `references/example-log-gen-eloquent-paraphrase.md`
- `references/example-log-gen-email-etiquette.md`
- `references/example-log-gen-explain-concept.md`
- `references/example-log-gen-fictional-map-locations.md`
- `references/example-log-gen-find-hotel.md`
- `references/example-log-gen-fitness-goal-setting.md`
- `references/example-log-gen-formal-letter.md`
- `references/example-log-gen-garden-layout.md`
- `references/example-log-gen-gift-ideas.md`
- `references/example-log-gen-guitar-chords.md`
- `references/example-log-gen-home-brewing-recipe.md`
- `references/example-log-gen-invoice-create.md`
- `references/example-log-gen-job-description.md`
- `references/example-log-gen-knowledge-q.md`
- `references/example-log-gen-kpi-brainstorm.md`
- `references/example-log-gen-language-learning.md`
- `references/example-log-gen-legal-disclaimer.md`
- `references/example-log-gen-loan-payment.md`
- `references/example-log-gen-logo-concept.md`
- `references/example-log-gen-magic-trick-learn.md`
- `references/example-log-gen-market-research-plan.md`
- `references/example-log-gen-marketing-slogans.md`
- `references/example-log-gen-meal-plan.md`
- `references/example-log-gen-meeting-minutes.md`
- `references/example-log-gen-movie-recs.md`
- `references/example-log-gen-organize-photos.md`
- `references/example-log-gen-packing-list.md`
- `references/example-log-gen-performance-review.md`
- `references/example-log-gen-photo-editing-plan.md`
- `references/example-log-gen-plan-trip.md`
- `references/example-log-gen-plant-identification.md`
- `references/example-log-gen-podcast-outline.md`
- `references/example-log-gen-podcast-summary.md`
- `references/example-log-gen-presentation-outline.md`
- `references/example-log-gen-press-inquiry-response.md`
- `references/example-log-gen-press-release.md`
- `references/example-log-gen-product-description.md`
- `references/example-log-gen-pros-cons-list.md`
- `references/example-log-gen-recipe-find.md`
- `references/example-log-gen-resume-summary.md`
- `references/example-log-gen-second-brain.md`
- `references/example-log-gen-set-reminder.md`
- `references/example-log-gen-social-media-post.md`
- `references/example-log-gen-solve-math.md`
- `references/example-log-gen-song-chorus.md`
- `references/example-log-gen-song-lyrics.md`
- `references/example-log-gen-speech-writing.md`
- `references/example-log-gen-stakeholder-update.md`
- `references/example-log-gen-story-premise.md`
- `references/example-log-gen-subscription-audit.md`
- `references/example-log-gen-summarize-doc.md`
- `references/example-log-gen-swot-analysis.md`
- `references/example-log-gen-time-blocking.md`
- `references/example-log-gen-todo-list.md`
- `references/example-log-gen-translate-text.md`
- `references/example-log-gen-user-persona.md`
- `references/example-log-gen-ux-copywriting.md`
- `references/example-log-gen-value-proposition.md`
- `references/example-log-gen-video-game-concept.md`
- `references/example-log-gen-video-script-intro.md`
- `references/example-log-gen-web-search.md`
- `references/example-log-gen-workout-plan.md`
- `references/example-log-gen-write-email.md`
- `references/example-log-gen-write-poem.md`
- `references/example-log-python-task.md`
- `references/example-log-skill-install-task.md`
- `references/example-log-sw-angular-component.md`
- `references/example-log-sw-api-graphql.md`
- `references/example-log-sw-api-test-curl.md`
- `references/example-log-sw-csharp-run.md`
- `references/example-log-sw-debug-script.md`
- `references/example-log-sw-django-model.md`
- `references/example-log-sw-eslint-run.md`
- `references/example-log-sw-flask-app.md`
- `references/example-log-sw-git-branch.md`
- `references/example-log-sw-git-commit.md`
- `references/example-log-sw-git-log.md`
- `references/example-log-sw-git-merge.md`
- `references/example-log-sw-git-stash.md`
- `references/example-log-sw-git-tag.md`
- `references/example-log-sw-go-test.md`
- `references/example-log-sw-kotlin-compile.md`
- `references/example-log-sw-mypy-run.md`
- `references/example-log-sw-new-feature.md`
- `references/example-log-sw-npm-init.md`
- `references/example-log-sw-pip-install-reqs.md`
- `references/example-log-sw-poetry-add.md`
- `references/example-log-sw-react-component.md`
- `references/example-log-sw-refactor-code.md`
- `references/example-log-sw-run-tests.md`
- `references/example-log-sw-rust-build.md`
- `references/example-log-sw-swift-build.md`
- `references/example-log-sw-update-deps.md`
- `references/example-log-sw-vite-dev.md`
- `references/example-log-sw-vue-route.md`
- `references/example-log-sw-webpack-build.md`
- `references/example-log-sw-yarn-audit.md`
- `references/example-log-sys-ansible-playbook.md`
- `references/example-log-sys-aws-s3-ls.md`
- `references/example-log-sys-azure-rg-create.md`
- `references/example-log-sys-check-server.md`
- `references/example-log-sys-cron-job.md`
- `references/example-log-sys-disk-usage.md`
- `references/example-log-sys-docker-build.md`
- `references/example-log-sys-docker-compose-up.md`
- `references/example-log-sys-dockerfile.md`
- `references/example-log-sys-gcp-vm-create.md`
- `references/example-log-sys-gh-actions-run.md`
- `references/example-log-sys-jenkins-pipeline.md`
- `references/example-log-sys-k8s-get-pods.md`
- `references/example-log-sys-k8s-logs.md`
- `references/example-log-sys-k8s-scale.md`
- `references/example-log-sys-manage-cloud.md`
- `references/example-log-sys-ping-test.md`
- `references/example-log-sys-prometheus-query.md`
- `references/example-log-sys-ssh-key-gen.md`
- `references/example-log-sys-systemd-status.md`
- `references/example-log-sys-terraform-plan.md`
- `references/example-log-sys-traceroute-test.md`
- `references/example-log-sys-ufw-firewall.md`

