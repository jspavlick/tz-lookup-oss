#!/bin/bash
set -ex
TZ="2023b"

rm -rf timezones.geojson.zip combined.json ne_10m_urban_areas.*
curl -L --retry 3 -C - \
  -O "https://github.com/evansiroky/timezone-boundary-builder/releases/download/$TZ/timezones.geojson.zip" \
  -O 'https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_urban_areas.zip'
unzip timezones.geojson.zip
unzip ne_10m_urban_areas.zip 
ogr2ogr -f GeoJSON ne_10m_urban_areas.json ne_10m_urban_areas.shp
echo "Generating SWIFT file"
node pack.js tz_template.swift > tz.swift
