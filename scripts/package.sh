#!/usr/bin/env bash
# Packages the pack into <id>_<version>.zip and prints the facts the registry needs.
# Needs: jq, rsync, zip, sha256sum.
set -euo pipefail

PACK_ID=$(jq -r '.id' pack.json)
VERSION=$(jq -r '.version' pack.json)
ZIP_NAME="${PACK_ID}_${VERSION}.zip"

STAGE_DIR=$(mktemp -d)

# Pack files only: leave out repo and dev-only paths.
rsync -a \
  --exclude='.git' \
  --exclude='.github' \
  --exclude='scripts' \
  --exclude='*.zip' \
  --exclude='.gitignore' \
  ./ "$STAGE_DIR"/

rm -f "./${ZIP_NAME}"
(cd "$STAGE_DIR" && zip -r -q "${ZIP_NAME}" .)
mv "${STAGE_DIR}/${ZIP_NAME}" "./${ZIP_NAME}"
rm -rf "$STAGE_DIR"

SHA256=$(sha256sum "./${ZIP_NAME}" | cut -d' ' -f1)
SIZE_BYTES=$(wc -c < "./${ZIP_NAME}" | tr -d ' ')

echo "zip_name=${ZIP_NAME}"
echo "pack_id=${PACK_ID}"
echo "version=${VERSION}"
echo "sha256=${SHA256}"
echo "size_bytes=${SIZE_BYTES}"
