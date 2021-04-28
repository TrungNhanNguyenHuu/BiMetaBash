#!/bin/bash

# For Mode 2
INSTRUCTION_FILE=$HOME/Documents/test3_mrjob_library/load_read.py

ID_OUT=$(echo $RANDOM % 100 + 1 | bc)
INPUT_FILE=hdfs:///user/R4_medium.fna
OUTFOLDER=hdfs:///user/out_load_read_$ID_OUT # Use in Mode 2 and Mode 3

CONF_FILE=$HOME/mrjob.conf

python3 $INSTRUCTION_FILE $INPUT_FILE --output $OUTFOLDER -r hadoop --conf-path $CONF_FILE

# For Mode 3
# => Lenh y chang;

# For Compare
# Is this correct? => WRONG !!!!!
# python word_count.py hdfs://localhost:9000/user/dhuy237/input/readme.rst --output hdfs://localhost:9000/output/ -r hadoop