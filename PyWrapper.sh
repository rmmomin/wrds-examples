#!/bin/sh
#$ -cwd
#$ -m abe
#$ -M rmomin0@chicagobooth.edu
echo "Starting job at `date`" 
python PyProgram.py &> PyProgram.out
echo "Finished job at `date`"

