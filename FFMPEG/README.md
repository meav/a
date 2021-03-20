usage: ffmpeg [options] [[infile options] -i infile]... {[outfile options] outfile}

ffmpeg -i video.ext -i audio.ext -c copy -map "0:v:0" -map "1:a:0" output.ext

ffmpeg -i input.ext -map 0 -c copy -ss 00:00:00 -to 00:30:00 output.ext

ffmpeg -i input.ext -f ffmetadata FFMETADATAFILE

ffmpeg -i FFMETADATAFILE -i input.ext -map 1 -c copy -map_metadata 0 output.ext

ffmpeg -i input.ext -map 0:s:0 subs.ext

ffmpeg -i input.ext -map 0 -c copy -map -0:s output.ext

ffmpeg -i input.ext -i inputsub1.ext -i inputsub2.ext -map 0 -map 1 -map 2 -c copy -metadata:s:s:0 language=sub1 -metadata:s:s:1 language=sub2 output.ext

for /L %i in (1,1,3) do echo %i

(for %i in (*.mp4) do @echo file '%i') > mylist.txt

ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.mp4

ffmpeg -i input.ts -c copy -bsf:a aac_adtstoasc output.mp4
