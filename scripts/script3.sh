echo -e "Month:
January
February    
March   
April   
May 
June    
July    
August  
September   
October 
November    
December" > months.txt

#use AWK to label all data between tabs as a field
#check the 2nd and 8th field for the term "Front Page"
#if a 'hit' is found, print the 1st field of that
#delete all characters from the time-stamp except for the month-indication
#sort so that the months are 01, 02, 03, etc
#use UNIQ to count how many times each month is named within the time-stamp
#write output to text-file

cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print $1}' | sed -E 's/....-//' | sed -E 's/-..T..:..:..Z//' | sort | uniq -c > artikelen_per_maand.txt 

#use echo to print results with a legenda. 

echo -e "Art:" "\n" "$(cat artikelen_per_maand.txt)" | awk '{print $1}' > overzicht_maanden.txt

#Attach months.txt to make it look nice!

paste overzicht_maanden.txt months.txt

#add some extra feature

#by using a while statement, create a yes or no question.
while true; do
	#offer user a clue to what is expected of him or her
    read -p "Or would you like to see the results ordered by popularity? Answer 'y' or 'n' " yn
    case $yn in
    	#tell script what to do when the user answered positive to the question
        [Yy]* ) cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print $1}' | sed -E 's/....-//' | sed -E 's/-..T..:..:..Z//' | sort | uniq -c | sort -nr > top_artikelen_per_maand.txt 
				echo -e "Art:" "\n" "$(cat top_artikelen_per_maand.txt)" | awk '{print $1}' > overzicht_top_maanden.txt 
				paste overzicht_top_maanden.txt months.txt; break;;
		#tell script what to do when the user answers negative to the question		
        [Nn]* ) exit;;
		#tell script to guide to user in case of an unknown or incorrect reply, allow user another chance
        * ) echo "Please answer yes or no.";;
    esac
done

#remove left-overs:

rm artikelen_per_maand.txt
rm overzicht_maanden.txt
rm top_artikelen_per_maand.txt
rm overzicht_top_maanden.txt
rm months.txt

#ik zag je kijken! 
