ssh_student --setup-script="python3 student/scripts/setup.py"

if [ -f "student/data.zip" ] && [ ! -f "student/data.csv" ]
then
	feedback-result failed
    feedback-msg -m "Vous avez bien téléchargé le fichier mais vous avez oublié de l'extraire !"
    exit
fi

if [ -f "student/data.csv" ]
then 
	feedback-result success
    feedback-msg -m "Bien joué, vous avez réussi à télécharger et extraire le fichier."
    exit
fi

feedback-result failed
feedback-msg -m "Vous n'avez pas téléchargé le fichier."