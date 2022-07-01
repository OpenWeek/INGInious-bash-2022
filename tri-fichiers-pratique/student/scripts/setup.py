import random
import string
import os

path = os.path.join(os.getcwd(), "student")

with open(os.path.join(path, "Makefile"), "w+") as file :
    file.write("# Ceci est un Makefile, il doit toujours se positionner à la racine du projet")

# NOTE: The README is a markdown file, if we change it to a txt file, the students will have to write a regex
with open(os.path.join(path, "README.md"), "w+") as file:
    file.write("Ceci est le README du projet, il doit toujours se trouver à la racine du projet et expliquer le contenu de celui-ci")

for i in range(5):
	
    pythonfile = ''.join(random.choice(string.ascii_letters) for k in range(5))
    tmpfile    = 'tmp' + ''.join(random.choice(string.ascii_letters) for k in range(5))
    cfile      = ''.join(random.choice(string.ascii_letters) for k in range(5))

    pythonfile_path  = os.path.join(path, pythonfile + ".py")
    tmpfile_path     = os.path.join(path, tmpfile + random.choice([".txt", ".py", ".c"]))
    cfile_path       = os.path.join(path, cfile + ".c")

	# creating python file
    with open(pythonfile_path, "w") as file:
        file.write("# Ceci est un fichier python inutile !\n")

	# creating text file
    with open(tmpfile_path, "w") as file:
	    file.write("#define S 'ceci est une instruction fonctionnant en C et en python mais n'ayant pas le même sens ! \n'")
	
	# creating c file
    with open(cfile_path, "w") as file:
        file.write("// Ceci est un programme C inutile !\n")