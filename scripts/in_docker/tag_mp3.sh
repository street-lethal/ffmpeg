#!/bin/sh

set -eu

cd /app/mp3
for file in *.mp3; do
    [ -f "$file" ] || continue

    base=${file%.mp3}

    # 先頭の数字
    track=$(printf '%s\n' "$base" |
        sed -E 's/^([0-9]+)[[:space:]]*-?[[:space:]]*(.*)$/\1/')

    # タイトル
    title=$(printf '%s\n' "$base" |
        sed -E 's/^([0-9]+)[[:space:]]*-?[[:space:]]*(.*)$/\2/')

    track=$((10#$track))

    ffmpeg -nostdin \
        -i "$file" \
        -codec copy \
        -metadata artist="$ARTIST" \
        -metadata album="$ALBUM" \
        -metadata genre="$GENRE" \
        -metadata track="$track" \
        -metadata title="$title" \
        "/app/mp3/tagged/$file"

    printf '%s: track=%d title="%s"\n' "$file" "$track" "$title"
done
