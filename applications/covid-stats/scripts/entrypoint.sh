#!/bin/sh

echo "$(date '+%d.%m.%Y %H:%M') Start building plots from scraped data..."
covid_stats

echo "$(date '+%d.%m.%Y %H:%M') Start building plots from external data..."
covid_stats --external

git add . -A
git commit -m "Charts automatically generated for $(date '+%d.%m.%Y %H:%M')"
git push