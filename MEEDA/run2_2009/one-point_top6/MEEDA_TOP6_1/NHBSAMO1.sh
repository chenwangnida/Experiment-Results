#!/bin/sh
#
#$ -S /bin/sh
#$ -wd /vol/grid-solar/sgeusers/wangchen
#
# End of the setup directives
##
if [ -d /local/tmp/wangchen/$JOB_ID ]; then
        cd /local/tmp/wangchen/$JOB_ID
else
        echo "Uh oh ! There's no job directory to change into "
        echo "Something is broken. I should inform the programmers"
        echo "Save some information that may be of use to them"
        echo "Here's LOCAL TMP "
        ls -la /local/tmp
        echo "AND LOCAL TMP wangchen"
        ls -la /local/tmp/wangchen
        echo "Exiting"
        exit 1
fi
#
# My local definines
DIR_GRID="/vol/grid-solar/sgeusers/wangchen/"
DIR_OUTPUT=$DIR_GRID$2 # Name of directory containing output
#
cp /vol/grid-solar/sgeusers/wangchen/codes/MENHBSA4SWSCTOP6.jar .
#cp /vol/grid-solar/sgeusers/wangchen/codes/wsc.params .
cp /vol/grid-solar/sgeusers/wangchen/datasets/wsc09_1/Set01MetaData/* .

java -jar MENHBSA4SWSCTOP6.jar $1.stat problem.xml services-output.xml taxonomy.owl $1

# Make sure the output directory exists before trying to copy data there
mkdir -p $DIR_OUTPUT

cp *.stat $DIR_OUTPUT

echo "Ran through OK"
