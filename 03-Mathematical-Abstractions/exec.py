import os

if os.path.exists("result.csv"):
        os.remove("result.csv")
if os.path.exists("automatic_differentiation.mod"):
        os.remove("automatic_differentiation.mod")
if os.name == "nt":
    if os.path.exists("main.exe"):
            os.remove("main.exe")
else:
    if os.path.exists("main"):
            os.remove("main")
os.system("gfortran automatic_differentiation.f90 print_table.f90 -o main")
if os.name == "nt":
        os.system("main.exe")
else:
        os.system("./main")
os.system("python resultsPlot.py")
