#!/bin/bash

# For Mode 2
INFILE=/user/R4_medium.fna  # Hadoop will look in HDFS Automatically
OUTFOLDER=/user/outTest1    # Hadoop will look in HDFS Automatically

INSTRUCTIONMAP=$HOME/Documents/test1_origin/map.py
INSTRUCTIONRED=$HOME/Documents/test1_origin/reduce.py

$HOME/hadoop-3.2.2/bin/hadoop jar $HOME/hadoop-3.2.2/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-input $INFILE \
-output $OUTFOLDER \
-mapper $INSTRUCTIONMAP \
-reducer $INSTRUCTIONRED \
-file $INSTRUCTIONMAP \
-file $INSTRUCTIONRED

# For Mode 3
# => The command For Mode 3 is exactly the same For Mode 2
