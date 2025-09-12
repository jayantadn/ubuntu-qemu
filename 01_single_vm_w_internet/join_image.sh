#!/usr/bin/env bash
# Joins noble-server-cloudimg-amd64.img parts back into original
# Usage: ./join_noble.sh

set -euo pipefail

outdir="noble-server-cloudimg-amd64.img_parts"
outfile="noble-server-cloudimg-amd64.img"

if [ ! -d "$outdir" ]; then
  echo "Error: directory not found: $outdir" >&2
  exit 2
fi

echo "Joining parts from $outdir -> $outfile ..."
: > "$outfile"
for p in $(ls -1 "$outdir" | grep '.part.' | sort -V); do
  echo "  appending $p"
  cat "$outdir/$p" >> "$outfile"
done

echo "Joined file created: $outfile"

# Verify checksum if available
if [ -f "$outdir/original_file.md5" ]; then
  echo "Verifying against original checksum..."
  md5sum -c "$outdir/original_file.md5"
else
  echo "No original_file.md5 found for verification."
fi

rm -rf $outdir

echo "Done."
