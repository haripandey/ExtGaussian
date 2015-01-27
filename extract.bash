#!/bin/bash
##COPY RIGHT::: HARI DATT PANDEY/Dr. David M. Leitner, DEPARTMENT OF CHEMICAL PHYSICS, UNIVERSITY OF NEVADA RENO.
######This script extract , frequencies, eigen vector, and cubic force constants 
###### Eigen vector will be in the form of (X,Y,Z), 
##### eigen_vector.txt , frequency.txt and eigen_vector.txt are out put  files
##### out.out is input file from Gaussian09,  anharmonic MP3/631G** opt+freq 
echo "COPY RIGHT::: HARI DATT PANDEY/DAVID M. LEITNER, DEPARTMENT OF CHEMICAL PHYSICS, UNIVERSITY OF NEVADA RENO."
echo " Friends! did you find this script usefule ?" 
echo " I will appreciate if you cite department of chemical physics, University of nevada Reno"

awk '/and normal/,/Harmonic frequencies/ {print}' out.out> t.doc

#####PRINT FREQUENCY IN SINGLE COLUMN#############################.

awk '
{ if ($1 == "Frequencies" && $2=="--")
   {
    for (i=3; i<=NF; i++)
     {
      print $i;
     }
   }
}' t.doc > freqs.doc

echo "Enter number of mode="
read q
echo "$q"
awk -v n=$q 'NR<= n' freqs.doc>frequency.txt
#######################################################
sed -e '1d' t.doc>11.doc
sed -e '/^                    /,+6 d' 11.doc> 22.doc

sed -e '/^ -------------------/,+10000000000 d' 22.doc> eig.docs
########################PARSE EIGEN VECTOR#############################

echo "Enter number of mode/3="
read m
echo "Enter number of atoms="
read c
echo "m=" $m
echo "c=" $c
for i in `seq 1 $m`;
#######for i in `seq 1 12`;
do
awk  '{print " ","\t", $1 ,"\t", $2,"\t", $3, "\t", $4,"\t", $5 "\t";}' eig.docs> 1.doc
#sed -n '1,cp' 1.doc>a1.doc
awk -v n1=$c 'NR<= n1' 1.doc>a1.doc
awk  '{print " ","\t", $1 ,"\t", $2,"\t", $6,"\t",$7,"\t",$8 "\t";}' eig.docs> 2.doc
##sed -n '1,cp' 2.doc>a2.doc
awk -v n1=$c 'NR<= n1' 2.doc>a2.doc
awk  '{print " ","\t", $1 ,"\t", $2,"\t", $9,"\t",$10,"\t",$11 "\t";}' eig.docs> 3.doc
##sed -n '1,cp' 3.doc>a3.doc
awk -v n1=$c 'NR<= n1' 3.doc>a3.doc


cat a1.doc a2.doc a3.doc >>eigen_vector.txt

##sed '1,cd' eig.docs>e.docs
####awk -v n1=$c 'NR<= c' eig.doc>e.docs

awk -v n1=$c 'NR <= n1 {next} {print}' eig.docs>e.docs

mv e.docs eig.docs
done
########################## CUBIC FORCE CONSTANTS###############
awk '/CUBIC FORCE CONSTANTS IN NORMAL MODES/,/2nd derivatives larger/ {print}' out.out > t
sed -e '/^ :       QUARTIC FORCE CONSTANTS IN NORMAL MODES       :/,+100000000000 d' t> tt.doc
head -n -4 tt.doc>force_const.txt
rm *.doc*
