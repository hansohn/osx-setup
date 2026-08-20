#!/usr/bin/env bash
#
# Deprecated shim. Renamed to install.sh -- the script converges an existing
# machine as readily as it sets up a new one, which "bootstrap" implied it did
# not. Remove after 1.0.

echo "==> WARNING: bootstrap.sh is deprecated and will be removed after 1.0. Use install.sh." >&2

exec "$(dirname "${BASH_SOURCE[0]}")/install.sh" "$@"
