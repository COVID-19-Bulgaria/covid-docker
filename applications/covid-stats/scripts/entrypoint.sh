#!/bin/sh

covid_stats

git add . -A
git commit -m "Charts automatically generated for $(date '+%d.%m.%Y %H:%M')"
git push