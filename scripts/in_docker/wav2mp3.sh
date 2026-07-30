cd /app/wav

for f in *.wav; do
    line=${f%.wav}
    ffmpeg -nostdin -i "$f" -q:a 0 "/app/mp3/$line.mp3"
done
