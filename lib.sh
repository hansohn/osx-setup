#!/usr/bin/env bash
#
# Shared helpers. Sourced by install.sh before anything else, and independently
# by the apps/*.sh scripts so they still work when sourced on their own.

# is_enabled VALUE
#
# True for true/yes/on/1 in any case, false for everything else. Config flags are
# hand-edited, so "TRUE" and "yes" have to mean what the author obviously meant
# rather than silently reading as off.
#
# Bash 3.2 compatible on purpose: /bin/bash on a factory Mac is 3.2.57 and
# preflight.sh runs before Homebrew installs bash 5, so ${var,,} is unavailable
# exactly where this is needed most.
is_enabled() {
  case "$(printf '%s' "${1:-}" | tr '[:upper:]' '[:lower:]')" in
    true|yes|on|1) return 0 ;;
    *)             return 1 ;;
  esac
}
