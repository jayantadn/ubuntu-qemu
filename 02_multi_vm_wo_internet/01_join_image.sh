#!/usr/bin/env bash

set -euo pipefail

outdir="noble-base.qcow2.img_parts"
outfile="noble-base.qcow2.img"

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
