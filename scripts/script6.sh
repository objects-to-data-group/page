#letting the user know he or she is in for a wait.. 
echo "Finding days of January, one moment please..." 

#create a variable for the entire span of years
for i in {1850..2015}; do 

#label variable as year and add days of the week
year=$i
day=zo
day2=ma
day3=di
day4=wo
#express "do" between quotes because it would otherwise be read as another do-statement. 
day5="do"
day6=vr
day7=za

#1. use NCAL to pop-up calender in command-line-interface, use variable to know for sure all years will be checked 
#2. use SED to replace empty spaces with underscores so that AWK can read them properly
#3. let AWK print the first 11 fields which display the first 3 months
#4. use SED and TAIL do filter out the line which holds the day.nr's of monday in the first month
#5. use SED to remove the monday-indicator "ma" 
#6. Print the results into a text file

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 3q | tail +3 | sed -E 's/'$day2'//' > jan_-$day2-_$year.txt

#create an explaing output and paste the results of step nr. 6 behind it. Add this line to another text-file.
#make sure to write into the other textfile via ">>" becauce the script will iterate over this line multiple times (once per year)
echo -e "maandag januari $year=" "$(cat jan_-$day2-_$year.txt)" >> total_output2.txt

#remove temp. files because they will stack-up and clutter the user's drive 
rm jan_-$day2-_$year.txt

#re-do first scriptline but instead of filtering out monday, filter out thuesday
ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 4q | tail +4 | sed -E 's/'$day3'//' > jan_-$day3-_$year.txt

#idem, etc.. 
echo -e "dinsdag januari $year=" "$(cat jan_-$day3-_$year.txt)" >> total_output2.txt

rm jan_-$day3-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 5q | tail +5 | sed -E 's/'$day4'//' > jan_-$day4-_$year.txt

echo -e "woensdag januari $year=" "$(cat jan_-$day4-_$year.txt)" >> total_output2.txt

rm jan_-$day4-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 6q | tail +6 | sed -E 's/'$day5'//' > jan_-$day5-_$year.txt

echo -e "donderdag januari $year=" "$(cat jan_-$day5-_$year.txt)" >> total_output2.txt

rm jan_-$day5-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 7q | tail +7 | sed -E 's/'$day6'//' > jan_-$day6-_$year.txt

echo -e "vrijdag januari $year=" "$(cat jan_-$day6-_$year.txt)" >> total_output2.txt

rm jan_-$day6-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 8q | tail +8 | sed -E 's/'$day7'//'  > jan_-$day7-_$year.txt

echo -e "zaterdag januari $year=" "$(cat jan_-$day7-_$year.txt)" >> total_output2.txt

rm jan_-$day7-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 9q | tail +9 | sed -E 's/'$day'//'  > jan_-$day-_$year.txt

echo -e "zondag januari $year=" "$(cat jan_-$day-_$year.txt)" >> total_output2.txt

rm jan_-$day-_$year.txt

#get total output file and copy it to another file, the output will be used again later in the script and would clutter. 
echo -e "$(cat total_output2.txt)" > total_January.txt

done

#remove total output file
rm total_output2.txt

#inform user the days of month 1 have been uncovered.  
echo "Days of January have been uncovered and written into total_January.txt"

#start another circle, now for May. 
echo "Finding days of May, one moment please..." 

for i in {1850..2015}; do 

year=$i
day=zo
day2=ma
day3=di
day4=wo
day5="do"
day6=vr
day7=za

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 11q | tail +11 | sed -E 's/'$day2'//' > mei_-$day2-_$year.txt

echo -e "maandag mei $year=" "$(cat mei_-$day2-_$year.txt)" >> total_output2.txt

rm mei_-$day2-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 12q | tail +12 | sed -E 's/'$day3'//' > mei_-$day3-_$year.txt

echo -e "dinsdag mei $year=" "$(cat mei_-$day3-_$year.txt)" >> total_output2.txt

rm mei_-$day3-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 13q | tail +13 | sed -E 's/'$day4'//' > mei_-$day4-_$year.txt

echo -e "woensdag mei $year=" "$(cat mei_-$day4-_$year.txt)" >> total_output2.txt

rm mei_-$day4-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 14q | tail +14 | sed -E 's/'$day5'//' > mei_-$day5-_$year.txt

echo -e "donderdag mei $year=" "$(cat mei_-$day5-_$year.txt)" >> total_output2.txt

rm mei_-$day5-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 15q | tail +15 | sed -E 's/'$day6'//' > mei_-$day6-_$year.txt

echo -e "vrijdag mei $year=" "$(cat mei_-$day6-_$year.txt)" >> total_output2.txt

rm mei_-$day6-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 16q | tail +16 | sed -E 's/'$day7'//'  > mei_-$day7-_$year.txt

echo -e "zaterdag mei $year=" "$(cat mei_-$day7-_$year.txt)" >> total_output2.txt

rm mei_-$day7-_$year.txt

ncal $year | sed -e 's/ /_/g' | awk -F "_" '{print $1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11}' | sed 17q | tail +17 | sed -E 's/'$day'//'  > mei_-$day-_$year.txt

echo -e "zondag mei $year=" "$(cat mei_-$day-_$year.txt)" >> total_output2.txt

rm mei_-$day-_$year.txt

echo -e "$(cat total_output2.txt)" > total_May.txt

done

rm total_output2.txt

echo "Days of May have been uncovered and written into total_May.txt"
