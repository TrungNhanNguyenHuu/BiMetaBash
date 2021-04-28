#!/bin/bash

python3 /home/tnhan/Documents/test3b2/create_dictionary.py

# For Mode 2
INSTRUCTION_FILE=$HOME/Documents/test3b2/load_create_document.py

ID_OUT=$(echo $RANDOM % 100 + 1 | bc)
INPUT_FILE=hdfs:///user/out_load_read/part-00000
OUTFOLDER=hdfs:///user/out_load_create_document_$ID_OUT # Use in Mode 2 and Mode 3

CONF_FILE=$HOME/mrjob.conf
UTILS_ZIP=$HOME/utils.zip

python3 $INSTRUCTION_FILE $INPUT_FILE --output $OUTFOLDER -r hadoop --conf-path $CONF_FILE --py-files $UTILS_ZIP

# For Mode 3
# => Lenh y chang;

# For Compare
# Is this correct? => WRONG !!!!!
# python word_count.py hdfs://localhost:9000/user/dhuy237/input/readme.rst --output hdfs://localhost:9000/output/ -r hadoop
