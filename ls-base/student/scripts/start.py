import random
import string
import os
from sys import argv

progs = "#include <stdio.h> \n #include <string.h> \n int pal(char *str){ \n int i,j, k = 1; \n if(str==NULL) \n return -1; \n for (i = 0, j = strlen (str) - 1; i <= j; ++i, --j){ \n while(str[i]==' ')i++; \n while(str[j]==' ')j--; \n if(i>j) break; \n if (str [i] != str[j]) { \n k= 0; \n break; \n } \n } \n return k; \n}"

text = "The Linux kernel is a free and open-source,[5][6] monolithic, modular,[7] multitasking, Unix-like  operating system kernel.[8] \n It was conceived and created in 1991 by Linus Torvalds[9] for his i386-based PC, and it was soon adopted as the kernel for the GNU operating system,[10] \n which was created as a free replacement for UNIX.[11] \n Since then, it has spawned a large number of operating system distributions, commonly also called Linux." 


for i in range(10):
	path = os.path.join("/task/student", "")
	pythonfile = ''.join(random.choice(string.ascii_letters) for k in range(5))
	textfile   = ''.join(random.choice(string.ascii_letters) for k in range(5))
	bakfile    = ''.join(random.choice(string.ascii_letters) for k in range(5))
	
	pythonfile_path  = os.path.join(path, "."+pythonfile + ".py")
	textfile_path    = os.path.join(path, textfile + ".txt")
	bakfile_path     = os.path.join(path, "."+bakfile + ".bak")
	
	# creating python file
	file = open(pythonfile_path,"w")
	file.write(progs)
	file.write("\n")
	file.close()
	
	# creating text file
	file = open(textfile_path,"w")
	file.write(text)
	file.write("\n")
	file.close()
	
	# creating bak file
	file = open(bakfile_path,"w")
	file.write(progs)
	file.write("\n")
	file.close()
