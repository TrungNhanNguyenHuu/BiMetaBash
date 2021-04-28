#!/bin/bash

# For Mode 2
INSTRUCTION_FILE=$HOME/Documents/test3c/create_corpus.py

INPUT_FILE=hdfs:///user/out_load_create_document_81/part-00000
OUTFOLDER=hdfs:///user/out_create_corpus # Use in Mode 2 and Mode 3

CONF_FILE=$HOME/mrjob.conf
UTILS_ZIP=$HOME/utils.zip
DICTIONARY=hdfs:///user/dictionary.pkl # Phai tu upload len hdfs bang tay

python3 $INSTRUCTION_FILE $INPUT_FILE --output $OUTFOLDER -r hadoop --conf-path $CONF_FILE --py-files $UTILS_ZIP --dictionary=$DICTIONARY

# For Mode 3
# => Lenh y chang;

# For Compare
# Is this correct? => WRONG !!!!!
# python word_count.py hdfs://localhost:9000/user/dhuy237/input/readme.rst --output hdfs://localhost:9000/output/ -r hadoop