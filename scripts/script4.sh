#use AWK to label all data between tabs as a field
#check the 2nd and 8th field for the term "Front Page"
#if a 'hit' is found, print the 1st field of that
#delete all characters from the time-stamp except for the year and month indicators
#use AWK to label all data between stripes ("-") as a field 
#use AWK to convert years into decades, print both fields seperated by a tab-space
#sort so that the decade/months are all mentioned like 1850/01 1850/02 ... 1890/03, etc. etc. 
#use UNIQ to count how many times each decade/month is named within the time-stamp
#use AWK to prepare file to look nice later on. 
#write output to text-file

cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print $1}' |  sed -E 's/-..T..:..:..Z//'| awk -F "-" '{print int($1/10)*10 "\t" $2}' | sort | uniq -c | awk '{print "\t" $1 "\t" $3 "\t" $2}'> maanden_per_decennium.txt 

#make it look nice

echo -e "Nr. of Articles\tMonth\tDecade" "\n" "$(cat maanden_per_decennium.txt)"

#add some extra feature

#by using a while statement, create a yes or no question.
while true; do
	#offer user a clue to what is expected of him or her
    read -p "Or would you like to see the top 5? Answer 'y' or 'n' " yn
    case $yn in
    	#tell script what to do when the user answered positive to the question
        [Yy]* ) cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print $1}' | sed -E 's/-..T..:..:..Z//'| awk -F "-" '{print int($1/10)*10 "\t" $2}' | sort | uniq -c | awk '{print "\t" $1 "\t" $3 "\t" $2}' | sort -nr | sed 5q > maanden_per_decennium_top5.txt 
				echo -e "Nr. of Articles\tMonth\tDecade" "\n" "$(cat maanden_per_decennium_top5.txt)"; break;;
		#tell script what to do when the user answers negative to the question
        [Nn]* ) exit;;
		#tell script to guide to user in case of an unknown or incorrect reply, allow user another chance
        * ) echo "Please answer yes or no.";;
    esac
done

#remove left-overs:

rm maanden_per_decennium.txt
rm maanden_per_decennium_top5.txt

#needed improvements: the months that have no artciles should also be shown with value "0" to create a complete overview

#ik zag je kijken! 
