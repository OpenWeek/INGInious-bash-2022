import random
import string
import os
from sys import argv

file1 = argv[1]
file2 = argv[2]

progs = "class Hello{ \n public static void main(String args[]){ \n System.out.println(\"Hello from java code\");  \n } \n }"  

    
path = os.path.join("student/", file1)
file = open(path,"w")
file.write(progs)
file.write("\n")
file.close()

path = os.path.join("student/", file2)
file = open(path,"w")
file.write(progs)
file.write("\n")
file.close()