#!/bin/sh
RECORD_FILE="alsa_record.wav"
RECORD_FOLDER="/tmp/shazam_on_linux"

if [ ! -e $RECORD_FOLDER ]
then
  mkdir $RECORD_FOLDER
fi

# Remove already recorded file if it exists
if [ -e ${RECORD_FOLDER}/${RECORD_FILE} ]
then
  rm ${RECORD_FOLDER}/${RECORD_FILE} 
fi

# record current song being played using Also loop device
timeout 5 arecord -c 2 -f S32_LE -r 48000 -D loopout ${RECORD_FOLDER}/${RECORD_FILE} > /dev/null 2>&1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# identidy recorded file
python2 ${DIR}/identify_sound.py -s ${RECORD_FOLDER}/${RECORD_FILE} -c $1

