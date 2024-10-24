#!/bin/sh
set -xeuo pipefail

python -m pip install . -vv --no-deps --no-build-isolation

# Create directories if they don't exist
mkdir -p "${PREFIX}/etc/conda/activate.d"
mkdir -p "${PREFIX}/etc/conda/deactivate.d"

# Copy activation scripts
cp "${RECIPE_DIR}/activate.sh" "${PREFIX}/etc/conda/activate.d/${PKG_NAME}-${PKG_VERSION}-vars.sh"

# Copy deactivation scripts
cp "${RECIPE_DIR}/deactivate.sh" "${PREFIX}/etc/conda/deactivate.d/${PKG_NAME}-${PKG_VERSION}-vars.sh"