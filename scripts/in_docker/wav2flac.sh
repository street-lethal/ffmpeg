cd /app/wav
ls -1 *.wav | sed -e 's/\.wav$//' > /tmp/filename.txt
while read line
do
  ffmpeg -i "/app/wav/$line.wav" -c:a flac "/app/flac/$line.flac"
done < /tmp/filename.txt
