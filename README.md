## Terraform Deployment Using Github Actions
This document will provide you all the details how to configure the github actions to trigger the terraform deployment.

## Basics of Github actions in the workflow
1. Use a build matrix if you want your workflow to run tests across multiple combinations of operating systems, platforms, and languages.
2. Use of matrix to run the workflow for different environments or even you can set different variables as per the environment if needed.
3. Connect to GCP env using Github secrets
4. Use of `workflow-dispatch` to trigger the workflow manually
5. Use of `max-parallel' to run the job for both the environments in parallel
6. Set working directory to any of your subfolder
7. Use of Environments in the workflow to approve the changes for higher environments if needed.

* Please refer the doc for [Github actions](https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions) 
* Please refer the doc for [Workflow syntax for Github actions](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions#jobsjob_idstepsuses)
* How to [Automate Terraform with GitHub Actions](https://learn.hashicorp.com/tutorials/terraform/github-actions)
