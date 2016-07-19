#!/bin/bash

# on OSX is available: libfdk_aac
AUDIOCODEC=libfaac

for FILENAME in *.ts
do
   # get file name without extension
   NAME=`echo $FILENAME | cut -d'.' -f 1`
   RESOLUTION="$(ffmpeg -i "$FILENAME" 2>&1 | grep Stream | grep -oP ', \K[0-9]+x[0-9]+')"
   #echo $NAME $HEIGHT
   if [[ $RESOLUTION == *"1280x720"* ]] || [[ $RESOLUTION == *"1920x1080"* ]] 
   then
  	echo $FILENAME "is HD or FullHD (and already h264)";
    echo "converting only the audio stream and moving the video stream to new container"
    ffmpeg -i "$FILENAME" -c:v copy -c:a $AUDIOCODEC "$NAME.mp4"
	mv $FILENAME converted
	mv $NAME.mp4 ../
   elif [[ $RESOLUTION == *"720x576"* ]]
   then
    echo $FILENAME "is SD (and probably just mpeg2)"
    echo "converting video and audio stream"
	ffmpeg -i "$FILENAME" -vcodec libx264 -r 25 -acodec $AUDIOCODEC "$NAME.mp4"
	mv $FILENAME converted
	mv $NAME.mp4 ../
   fi
done
