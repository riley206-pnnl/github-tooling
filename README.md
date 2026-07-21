# VOLTTRON
VOLTTRON™ is an open source platform for distributed sensing and control.
The platform provides services for collecting and storing data from buildings and devices and provides an
environment for developing applications which interact with that data.

## github tools
This repository contains github tools used by multiple volttron agent and library repositories

 - The folder .github/workflows contains reusable workflows used by workflows called by other volttron repositories
 - The folder actions-all-repositories contains workflows that need to be present in all volttron agent and library
   repositories and contains actions that does code analysis, testing, release etc. Some of these workflows simply set
   the right project name, environment and call the reusable workflows in this repository's .github/workflow
 - The tooling folder contains tools useful for other volttron repositories

## Propagating files to multiple repositories

Whenever there is changes in workflows in actions-all-repositories folder, the changes need to be propagated to all
the volttron agent and library repositories. Once changes to yml files under action-all-repositories are approved and
merged into main branch of this repository, you can easily propagate the changes to other volttron repositories using
the tool [multi-gitter](https://github.com/lindell/multi-gitter)
Such propagation would also be needed files such as copyright and license that are there in every single eclipse-volttron repository

## Using multi-gitter

The script tooling/propagate-github-actions.sh is used as input to the ```multi-gitter run ``` to repeat a set of actions
across a set of matching repositories. The code can be simple copy a new file - say a new developer_notes.md or do some
sed/awk magic to update files.

To run the multi-gitter run command:

1. Clone this repository's main branch
2. Set your github token as an environment variable GITHUB_TOKEN
3. The tooling/multi-gitter-conf.yml is configured to look for specific repository, match repositories by regex or
   hard coded list of repositories. For example to propagate update in action-all-repositories, you can match
   volttron-* repos under eclipse-volttron with the exception
    of volttron-docs and volttron-ansible. You can update this in the config file are pass corresponding command line
    arguments to override the default configuration
4. The config yml provide multiple configuation options to determine the user name for commit, commit message, if a new
   PR should be created in all matching repos and if so what should be the name of the source branch etc. Please
   read through all options carefully.
5. The example configuration in tooling directory creates a PR with changes to the develop branch of all the volttron-* repositories
6. Your script should always finally place the changed files in the correct directory assuming the files are in the cloned destination repository
7. Always do a --dry-run first to verify
5. Run the following command with correct absolute path to propagate-github-actions.sh
   ```multi-gitter run 'bash /home/chandrika/modular-volttron/github-tooling/tooling/propagate-github-actions.sh' --dry-run --config tooling/multi-gitter-conf.yml```
6. If the dry-run list the correct repositories and changes then repeat the command without --dry-run and PRs will get
   created for all the matching repositories
7. Repeat the command again if changes have to propagated to main branch or any other branch.
   For this instead of updating the configuration file, you can send a additional  --base-branch option at command line
