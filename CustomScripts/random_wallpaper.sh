#!/usr/bin/env bash
while true; do
  feh --bg-fill --randomize $1/* 
  sleep $2
done
