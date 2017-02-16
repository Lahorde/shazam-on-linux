#!/bin/sh
RECORD_FILE="alsa_record.wav"
RECORD_FOLDER="/tmp/shazam_on_linux"

if [ ! -e $RECORD_FOLDER ]
then
  mkdir $RECORD_FOLDER
fi

timeout 5 arecord -c 2 -f S32_LE -r 48000 -D loopout ${RECORD_FOLDER}/${RECORD_FILE} > /dev/null 2>&1
python2 /home/remi/projects/shazam_on_linux/IdentifyProtocolV1_2.py ${RECORD_FOLDER}/${RECORD_FILE}

