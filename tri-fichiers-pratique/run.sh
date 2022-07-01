ssh_student --setup-script "python3 student/scripts/setup.py"

# Verify that the projet.tar file exists
if [ ! -f "student/projet.tar" ]
then 
    feedback-grade $grade
    feedback-msg -ae -m "Vous n'avez pas créé l'archive \n\n"
    feedback-result failed
    exit
fi

content=$(tar -tf student/projet.tar)
state="success"

# Checking if the directories are in the archive

if [ $(grep -e "c-files/$" <<< "$content" | wc -l) -ne 1 ]
then 
    feedback-msg -ae -m "Vous avez oublié de créér le dossier 'c-files'.\n\n"
    state="failed"
    
fi 

if [ $(grep -e "python-files/$" <<< "$content" | wc -l) -ne 1 ]
then 
    feedback-msg -ae -m "Vous avez oublié de créér le dossier 'python-files'.\n\n"
    state="failed"
fi 

# Checking if all C files are in the archive
if [ $(grep -e '\.c$' <<< "$content" | wc -l) -ne "5" ]
then 
    feedback-msg -ae -m "Vous avez oublié de placer certains fichiers .c dans l'archive.\n\n"
    state="failed"
fi

# Checking if all python files are in the archive
if [ $(grep -e '\.py$' <<< "$content" | wc -l) -ne "5" ]
then 
    feedback-msg -ae -m "Vous avez oublié de placer certains fichiers .py dans l'archive.\n\n"
    state="failed"
fi

# Checking if all C files are in c-files
if [ $(grep -e c-files <<< "$content" | wc -l) -ne "6" ]
then 
    feedback-msg -ae -m "Vous avez oublié de placer certains fichiers .c dans le dossier 'c-files'.\n\n"
    state="failed"
fi

# Checking if all python files are in python-files
if [ $(grep -e python-files <<< "$content" | wc -l) -ne "6" ]
then 
    feedback-msg -ae -m "Vous avez oublié de placer certains fichiers .py dans le dossier 'python-files'.\n\n"
    state="failed"
fi

if [ $(grep Makefile <<< "$content" | wc -l) -ne "1" ]
then 
    feedback-msg -ae -m "Vous n'avez pas placé le Makefile à la racine du projet.\n\n"
    state="failed"
fi

if [ $(grep README.md <<< "$content" | wc -l) -ne "1" ]
then 
    feedback-msg -ae -m "Vous n'avez pas placé le README à la racine du projet\n\n"
    state="failed"
fi

# Checking for tmp files
if [ $(grep -e 'tmp' <<< "$content" | wc -l) -ne "0" ]
then 
	feedback-msg -ae -m "Vous avez introduit des fichiers temporaires dans l'archive.\n\n"
    state="failed"
fi

if [ $state = "success" ]
then
    feedback-msg -ae -m "Bien joué, vous avez respecté le format de l'archive !.\n\n"
else
	feedback-msg -ae -m "Vous n'avez pas entièrement respecté le format de l'archive, vérifiez celui-ci avec le feedback fourni et réessayez !\n\n"
fi 

feedback-result $state