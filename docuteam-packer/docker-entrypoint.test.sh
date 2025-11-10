#!/usr/bin/env bash

set -e

# Start Xvfb
Xvfb :99 &
export DISPLAY=:99

exec "$@"
