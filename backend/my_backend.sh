#!/bin/bash
set -e

LOG_FILE=/app/build.log

echo "------------------[INFO] Installing dependencies...------------" | tee -a "$LOG_FILE"
npm install | tee -a "$LOG_FILE"

npm rebuild sqlite3

echo "------------------[INFO] Building project...------------------" | tee -a "$LOG_FILE"
npm run build | tee -a "$LOG_FILE"

echo "------------------[INFO] Starting application...------------------" | tee -a "$LOG_FILE"
npm run start | tee -a "$LOG_FILE"