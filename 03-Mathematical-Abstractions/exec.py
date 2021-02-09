#!/usr/bin/env python
import os

def main(args):
	if os.path.exists("result.csv"):
		os.remove("result.csv")
	if os.path.exists("automatic_differentiation.mod"):
		os.remove("automatic_differentiation.mod")
	if os.path.exists("main"):
		os.remove("main")
	os.system("gfortran automatic_differentiation.f90 print_table.f90 -o main")
	os.system("./main")
	os.system("python resultsPlot.py")
	
	return 0

if __name__ == '__main__':
    import sys
    sys.exit(main(sys.argv))
