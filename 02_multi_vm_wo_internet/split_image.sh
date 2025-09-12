#!/usr/bin/env bash
# Splits noble-server-cloudimg-amd64.img into parts of given size (default 100M)
# Usage: ./split_noble.sh [chunk-size]
# Example: ./split_noble.sh 200M

set -euo pipefail

file="noble-base.qcow2"
chunk_size="${1:-100M}"

if [ ! -f "$file" ]; then
  echo "Error: file not found: $file" >&2
  exit 2
fi

outdir="${file}_parts"
mkdir -p -- "$outdir"

prefix="${outdir}/${file}.part."
suffix_len=4

echo "Splitting '$file' into chunks of size $chunk_size ..."
split --numeric-suffixes=1 --suffix-length="$suffix_len" -b "$chunk_size" -- "$file" "$prefix"

echo "Generating checksums for chunks..."
(
  cd -- "$outdir"
  for p in $(ls -1 | sort -V); do
    md5sum "$p"
  done
) > "$outdir/md5sums.txt"

# Save checksum of original file for later verification
md5sum "$file" > "$outdir/original_file.md5"

rm -f $file

echo "Done. Parts stored in: $outdir"
echo "Checksums: $outdir/md5sums.txt (chunks), $outdir/original_file.md5 (whole file)"


