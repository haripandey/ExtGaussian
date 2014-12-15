ExtGaussian
===========

this script will extract normal modes, force constants and frequencies from gaussian outpu in nice formatted form

 This is very simple code to extract  force constant, normal mode and normalmode frequencies from gaussian09 harmonic or anharmonic MP2/631G** or any another besis set/method calculation.
Gaussian out put comntains the normal modes in the format
                     1                      2                      3
                     A                      A                      A
 Frequencies --    29.6446               168.7698               265.0094
 Red. masses --     7.9650                 5.2417                 6.4734
 Frc consts  --     0.0041                 0.0880                 0.2679
 IR Inten    --     0.0000                 0.8445                 0.8684
  Atom  AN      X      Y      Z        X      Y      Z        X      Y      Z
     1   6     0.00   0.00   0.00     0.00   0.00   0.28     0.00   0.15   0.00
     2   6     0.00   0.00   0.20     0.00   0.00   0.04    -0.15   0.06   0.00
     3   6     0.00   0.00   0.20     0.00   0.00  -0.26    -0.13  -0.17   0.00
     4   6     0.00   0.00   0.00     0.00   0.00  -0.31     0.00  -0.24   0.00

..........................................................................................
...................................................................................
.............................
after thousends of lines it will have force constants as:
This script will have out put inthe form:
 (1)eigen_vector.txt
         1       6       0.00    0.00    0.00
	 2       6       0.00    0.00    0.20
         3       6       0.00    0.00    0.20
         1       6       0.00    0.00    0.28
         2       6       0.00    0.00    0.04
         3       6       0.00    0.00   -0.26
(2)frequency.txt:   29.6446
                    168.7698
                    265.0094

(3) force_const.txt: it will extract force constants

you can modify this file to extract any information from gaussian output file.








