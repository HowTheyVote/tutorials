#!/bin/bash
# Small script to ensure availability of latest data dump during local development.
# Only to be executed from the root directory of the repository.
# Attention: NO SAFETY MECHANISMS if executed from anywhere else.
# Keeps only the .csv files around and cleans up the downloaded .zip file after extraction.

ZIP_URL="http://github.com/HowTheyVote/data/releases/latest/download/export.zip"
TARGET_DIR="./content/data/"

ZIP_FILE="/tmp/dataexport.zip"

curl -L -o "$ZIP_FILE" "$ZIP_URL"

unzip -o "$ZIP_FILE" -d "$TARGET_DIR"

find "$TARGET_DIR" -type f ! -name "*.csv" ! -name ".keep" -delete

rm -f "$ZIP_FILE"
