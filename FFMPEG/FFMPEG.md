ffmpeg -i INPUT -f ffmetadata FFMETADATAFILE

ffmpeg -i INPUT -i FFMETADATAFILE -map_metadata 1 -codec copy OUTPUT

ffmpeg -i input.ext -i 1.vtt -map 0 -c copy -map 1:0 -metadata:s:s:0 language=en output.mkv

ffmpeg -i input.mp4 -i 1.vtt -map 0 -c copy -map 1:0 -c:s mov_text -metadata:s:s:0 language=en output.mp4
