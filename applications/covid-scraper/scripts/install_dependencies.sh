#!/bin/sh

echo "Installing dependencies..."
bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3
echo "Finished installing dependencies."
