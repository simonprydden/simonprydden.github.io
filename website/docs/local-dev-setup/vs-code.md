---
sidebar_position: 1
title: VS Code
hide_title: True
---

## VS Code Configuration for Python Projects

This page outlines the necessary configuration for setting up and managing a Python project in Visual Studio 
Code (VS Code), specifically focusing on Python development, testing, and extensions that streamline the 
workflow.

### Workspace Settings

The `settings.json` file customizes your VS Code environment for Python development. Below is the recommended 
configuration for a typical Python project:

```json
{
    // Python Settings
    "python.defaultInterpreterPath": "${workspaceFolder}/.venv/bin/python",
    "python.terminal.activateEnvironment": true,
    "python.envFile": "${workspaceFolder}/.env",
    "python.analysis.autoSearchPaths": true,
    "python.analysis.diagnosticSeverityOverrides": {
        "reportMissingImports": "none"
    },
    "python.analysis.extraPaths": [
        "${workspaceFolder}/src"
    ],

    // Pytest Settings
    "python.testing.pytestEnabled": true,
    "python.testing.unittestEnabled": false,
    "python.testing.cwd": "${workspaceFolder}/tests",
    "python.testing.pytestPath": "${workspaceFolder}/.venv/bin/pytest",
    "python.testing.autoTestDiscoverOnSaveEnabled": true,
}
```

:::note

Ensure you update the `src` and `tests` paths to match your project's directory structure.

:::

The `extensions.json` file provides a list of recommended extensions to enhance the development experience for
Python projects. Here's the recommended configuration:

```json
{
    "recommendations": [
        "ms-python.python",
        "ms-python.vscode-pylance",
        "charliermarsh.ruff",
        "ms-toolsai.jupyter",
        "github.copilot",
        "tamasfe.even-better-toml",
        "aaron-bond.better-comments",
        "postman.postman-for-vscode",
        "github.vscode-github-actions",
        "bierner.markdown-mermaid",
        "ms-vscode-remote.remote-containers",
    ]
}
```