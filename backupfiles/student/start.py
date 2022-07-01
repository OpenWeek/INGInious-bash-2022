import random
import string
import os
from sys import argv

dir_ = argv[1]

os.mkdir("/task/student/" + dir_)
secret=0
progs = "class Hello{ \n public static void main(String args[]){ \n System.out.println(\"Hello from java code\");  \n } \n }"  
for i in range(50):
	path = os.path.join("/task/student", dir_)
	level = int(random.choice(string.digits))
	for k in range(level):
		dir_name = ''.join(random.choice(string.ascii_letters) for k in range(8))
		path = os.path.join(path, dir_name)
		os.mkdir(path)
    
	f_name = ''.join(random.choice(string.ascii_letters) for k in range(8))
	path = os.path.join(path, f_name + ".java")
	file = open(path,"w")
	file.write(progs)
	file.write("\n")
	secret=secret+1
	file.close()
    
print(secret, file=open("/task/student/secret", "w"))