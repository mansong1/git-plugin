#!/bin/sh
set -xe

# # If path setting is not set, then use current directory
# path=${PLUGIN_PATH:-.}
# mkdir -p ${path}
# cd ${path}

# # Clones the public git repo and checkout to a branch
# git ${PLUGIN_ARGS} clone https://${PLUGIN_GITHUB_USER}:${PLUGIN_GITHUB_TOKEN}@github.com/${PLUGIN_REPO_URL} .
# git checkout ${PLUGIN_BRANCH}

if [ -n "${PLUGIN_SSH_KEY}" ]; then
    mkdir -p ~/.ssh
    cat << EOF > id_rsa
    ${PLUGIN_SSH_KEY}
EOF
    mv id_rsa ~/.ssh
    chmod 600 ~/.ssh/id_rsa
fi
# Prints the last commit
git log -1 --stat