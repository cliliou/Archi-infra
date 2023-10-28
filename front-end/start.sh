#!/bin/sh
echo "VITE_IP=$VITE_IP" > .env & http-server dist