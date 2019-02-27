ffmpeg -i input.ext -map 0 -c copy -ss 00:00:00 -to 00:30:00 output.ext

ffmpeg -i input.ext -f ffmetadata FFMETADATAFILE

ffmpeg -i input.ext -i FFMETADATAFILE -map 0 -c copy -map_metadata 1 output.ext

ffmpeg -i input.ext -map 0:s:0 subs.ext

ffmpeg -i input.ext -map 0 -c copy -map -0:s output.ext

ffmpeg -i input.ext -i inputsub1.ext -i inputsub2.ext -map 0 -map 1 -map 2 -c copy -metadata:s:s:0 language=sub1 -metadata:s:s:1 language=sub2 output.ext
