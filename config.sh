#!/usr/bin/env bash
#
# Every variable here is consumed by bootstrap.sh, apps/*.sh or
# customizations/*.sh after sourcing, which shellcheck cannot follow.
# shellcheck disable=SC2034

# ----- general information -----
EMAIL_ADDRESS="foo.bar@mail.com";

# ----- osx -----
SCREENSHOT_LOC="${HOME}/Pictures/Screenshots";

# ----- time -----
TIMEZONE="America/Los_Angeles";
TIMESERVER="time.nist.gov";

# ----- git config -----
GIT_USER_NAME="Foo Bar";
GIT_USER_EMAIL="foo.bar@users.noreply.github.com";

# ----- app versions -----
# consumed by apps/java.sh, apps/nodejs.sh and apps/rust.sh
JAVA_VERSION="21";
NODE_VERSION="24";
RUSTUP_INSTALL_NIGHTLY="false";

# ----- exports -----
# ----- apps -----
