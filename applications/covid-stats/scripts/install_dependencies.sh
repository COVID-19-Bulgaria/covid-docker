#!/bin/sh

echo "Installing dependencies..."
pip install --no-cache-dir git+https://github.com/COVID-19-Bulgaria/covid-stats.git@master
echo "Finished installing dependencies."
