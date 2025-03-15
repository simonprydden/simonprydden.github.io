---
title: Dependabot
hide_title: True
sidebar_position: 3
---

Staying on top of your project's dependencies can be a chore. That's where GitHub's Dependabot comes in. This 
automated tool monitors your dependencies, creates pull requests for updates, and even highlights security 
vulnerabilities, keeping your project secure and up-to-date.


## Setup: Configuring Dependabot for Automatic Updates

To enable Dependabot for your project, you'll need to create a configuration file at `.github/dependabot.yml`. 
This file defines how Dependabot will manage your project's dependencies.

Here's a basic configuration example:

```yaml
version: 2
updates:
  - package-ecosystem: # Type of dependencies (pip, docker, npm, etc)
    directory: # Directory where the dependencies files are located
    schedule:
      interval: # Frequency of checking updates (daily, weekly, monthly)
```

In June 2023, Github added support for [grouped version updates](https://github.blog/changelog/2023-06-30-grouped-version-updates-for-dependabot-public-beta/).
This allows you to combine updates for multiple dependencies into a single pull request, making the review 
process more manageable. Consult the Dependabot documentation for details on configuring grouped updates.


## Package Ecosystem Configuration Examples

This section provides example Dependabot configurations for different package ecosystems commonly used in 
projects.  These examples are a starting point; you may need to adjust them based on your specific project 
requirements.


### Python

```yaml
version: 2
updates:
  - package-ecosystem: uv
    directory: "/"
    schedule:
      interval: monthly
    commit-message:
      prefix: chore
      include: scope
    groups:
      python:
        patterns:
          - "*"
```

### Github Actions

```yaml
version: 2
updates:
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: monthly
    commit-message:
      prefix: chore
      include: scope
    groups:
      github-actions:
        patterns:
          - "*"
```


### Docker

```yaml
version: 2
updates:
  - package-ecosystem: "docker"
    directory: "/"
    schedule:
      interval: monthly
    commit-message:
      prefix: chore
      include: scope
```


### Terrafom

```yaml
version: 2
updates:
  - package-ecosystem: "terraform"
    directory: "/"
    schedule:
      interval: monthly
    commit-message:
      prefix: chore
      include: scope
    groups:
      terraform:
        patterns:
          - "*"
```

### Node.js (npm)

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "monthly"
    commit-message:
      prefix: chore
      include: scope
    groups:
      production:
        dependency-type: "production"
      development:
        dependency-type: "development"
```

## Reviewing and Merging Pull Requests

Once Dependabot detects an available update, it will automatically open a pull request. The PR will include 
information about the update, such as the version number and a summary of changes. You can review the changes, 
run your tests, and merge the PR if everything looks good. 
