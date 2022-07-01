from random import shuffle 
import os

parent_dir = os.getcwd()

# Create the file tree :
info_dir  = os.path.join(parent_dir, "student", "2021", "informatique")
philo_dir = os.path.join(parent_dir, "student", "2021", "philo")

if not os.path.exists(info_dir):
    os.makedirs(info_dir, exist_ok=True)
if not os.path.exists(philo_dir):
    os.makedirs(philo_dir, exist_ok=True)


# Files given to the student to sort
files = ["philo-concepts.txt", "info-data-structure.txt", "philo-theorie.txt", "info-tuyaux.txt", "info-projet.py"]

# Shuffle files so you get something different on every try
shuffle(files)

# Put the files in the directories
for i, file in enumerate(files):
    dest = os.path.join(parent_dir, "student", "2021", "informatique" if i % 2 == 0 else "philo", file)

    with open(dest, "w+") as f:
        f.write("# Ceci est le fichier '{}'".format(file))
