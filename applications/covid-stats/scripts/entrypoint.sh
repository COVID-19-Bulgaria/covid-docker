#!/bin/sh

R -e "covid19bulgaria::publish_all_charts(path = '${COVID_STATS_PATH_CONTAINER}/')"

git add . -A
git commit -m "Charts automatically generated for $(date '+%d.%m.%Y %H:%M')"
git push