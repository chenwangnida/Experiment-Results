for((i=40; i<90; i++))
do
qsub Robust4_70.sh $i owlstc_30_100_Robust4_70
#qsub ECJTreeTest.sh $i
done
