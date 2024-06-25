# my-shell-project/scripts/backup.sh

#!/bin/bash

# Backup a directory to a specified location.

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 source_directory target_directory"
  exit 1
fi

SOURCE_DIR=$1
TARGET_DIR=$2

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Source directory does not exist."
  exit 1
fi

mkdir -p "$TARGET_DIR"

BACKUP_NAME=$(basename "$SOURCE_DIR")_$(date +%Y%m%d%H%M%S).tar.gz

tar -czf "$TARGET_DIR/$BACKUP_NAME" -C "$SOURCE_DIR" .

echo "Backup of $SOURCE_DIR completed successfully to $TARGET_DIR/$BACKUP_NAME"
