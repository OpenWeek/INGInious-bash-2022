ssh_student --setup-script="python3 student/scripts/setup.py"

if [ $(ls "student/" | grep -e ".zip" -c) -ne "6" ]
then 
	feedback-msg -ae -m "Vous n'avez pas téléchargé l'entièreté des fichiers demandés. \n\n"
    feedback-result failed
    exit
fi

if [ $(grep "worker@" /task/student/.ssh_logs | cut -d '$' -f2 | grep -e "curl" -c) -gt "1" ]
then 
	feedback-msg -ae -m "Vous avez utilisé plusieurs appels à la commande ``curl`` pour télécharger les fichiers, un seul appel est nécéssaire. Vous pouvez aller lire la page de manuel de cette commande pour plus d'informations. \n\n" 
fi


if [ $(ls "student/" | grep -e ".csv" -c) -ne "6" ]
then 
	feedback-msg -ae -m "Vous n'avez pas 'dézippé' l'entièreté des fichiers demandés. \n\n"
    feedback-result failed
    exit
fi

if [ $(grep "worker@" /task/student/.ssh_logs | cut -d '$' -f2 | grep -e "unzip" -c) -gt "1" ]
then 
	feedback-msg -ae -m "Vous avez utilisé plusieurs appels à la commande ``unzip`` pour dézipper les fichiers, un seul appel est nécéssaire. Vous pouvez aller lire la page de manuel de cette commande pour plus d'informations. (ou faire des recherches sur internet) \n\n" 
fi

if [ ! -f "student/answer.txt" ]
then
	feedback-msg -ae -m "Vous avez oublié de mettre vos réponses dans le fichier ``answer.txt.`` \n\n"
    feedback-result failed
    exit
fi

solutions=("7959.00000000" "1593982800000" "23879.95000000" "1030.79130900")
isFailed="False"

for i in {0..3}
do
	if [ $(cat "student/answer.txt" | grep -e ${solutions[$i]} -c) -ne "1" ]
    then
    	isFailed="True"
        feedback-msg -ae -m "Vous avez oublié la solution au point : $(($i+1)) \n\n"
    fi
done

if [ $isFailed = "True" ]
then 
	feedback-result failed
    exit
fi

callToSort=$(grep "worker@" /task/student/.ssh_logs | cut -d '$' -f2 | grep -e "sort" -c)
if [ "$callToSort" -gt "3" ]
then 
	feedback-msg -ae -m "Bien joué ! Vous avez réussi l'exercice, néanmoins vous avez effectué $callToSort appels à ``sort`` alors que l'exercice est faisable avec seulement 3 appels ! \n\n"
	feedback-result success
    exit
fi

feedback-msg -ae -m "Bien joué, vous avez réussi avec le minimum d'appel aux commandes ! \n\n"
feedback-result success