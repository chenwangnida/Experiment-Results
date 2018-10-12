for i in 16 20 21 24 29
do
qsub NSGA2_4.sh $i 2009_CL_Hybrid2_EDA_4
#qsub ECJTreeTest.sh $i
done
