ffmpeg -i INPUT -f ffmetadata FFMETADATAFILE

ffmpeg -i input.ext -i FFMETADATAFILE -map_metadata 1 -map 0 -c copy output.mkv

ffmpeg -i input.ext -map 0:s:0 subs.srt

ffmpeg -i input.ext -map 0 -map -0:s -codec copy output.mkv

ffmpeg -i input.ext -i inputsub1.ext -i inputsub2.ext -map 0 -map 1 -map 2 -c copy -metadata:s:s:0 language=sub1 -metadata:s:s:1 language=sub2 output.mkv
