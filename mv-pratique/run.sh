ssh_student --setup-script "python3 student/scripts/start.py"

parent_dir="student/2021/"
files=("informatique/info-data-structure.txt" "informatique/info-tuyaux.txt" "informatique/info-projet.py" "philo/philo-concepts.txt" "philo/philo-theorie.txt")

let "error = 0"

for path in "${files[@]}" 
do
    if [ ! -f "$parent_dir$path" ] 
    then 
    	feedback-msg -ae -m "Vous avez oublié de déplacer le fichier : $parent_dir$path \n\n"
    	let "error += 1"
    fi 
done

let "grade = 100 - 20*$error" 
feedback-grade $grade

if [ "$error" -ne "0" ] 
then
	feedback-msg -a -m "Vous n'avez pas remis tous les fichiers en ordre ! Vous avez commis $error erreurs"
	feedback-result failed
else 
	feedback-msg -a -m "Bien joué, vous avez réussi à tout remettre en ordre !"
	feedback-result success
fi