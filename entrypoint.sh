#!/bin/sh
echo "Starting Xray with UUID: 24b4b1e1-7a89-45f6-858c-242cf53b5bdb"
exec xray run -config /etc/xray/config.json
