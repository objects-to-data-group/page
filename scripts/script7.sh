# Enter Base URL 
baseurl="http://api.nytimes.com/svc/search/v2/articlesearch.json"

# Enter API key"
key="sample-key"

# Create two queries you want to compare
query1="Science"
query2="Humanities"

# Add-on by Sjoerd, to allow search for front-page articles, and quiker adaptions to code:
field="type_of_material"
field2="section_name"
field_query1="front+page"
tekst1="front-page articles in the"

# The following lines allow you to select a single decade
begin_date_year="1850"
begin_date_month="01"
begin_date_day="01"
end_date_year="1859"
end_date_month="12"
end_date_day="31"
begin_date_year2="1860"
end_date_year2="1869"
begin_date_year3="1870"
end_date_year3="1879"
begin_date_year4="1880"
end_date_year4="1889"
begin_date_year5="1890"
end_date_year5="1899"
begin_date_year6="1900"
end_date_year6="1909"
begin_date_year7="1910"
end_date_year7="1919"
begin_date_year8="1920"
end_date_year8="1929"
begin_date_year9="1930"
end_date_year9="1939"
begin_date_year10="1940"
end_date_year10="1949"
begin_date_year11="1950"
end_date_year11="1959"
begin_date_year12="1960"
end_date_year12="1969"
begin_date_year13="1970"
end_date_year13="1979"
begin_date_year14="1980"
end_date_year14="1989"
begin_date_year15="1990"
end_date_year15="1999"
begin_date_year16="2000"
end_date_year16="2009"

# Since the first results immediately show the total number of hits we only need page 0
page=0

# Establish the specific URL based on the pre-defined variables using query1
requestUrl="$baseurl?fq=$query1&api-key=$key&page=$page"

# Filter the number of hits from the results (this part of the code is still a bit messy)
results=`curl -s $requestUrl | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the results
echo -e $query1 "articles in database:" '\t' $results

# Build a second URL that does the same for query2
requestUrl2="$baseurl?fq=$query2&api-key=$key&page=$page"

# Filter the number of hits from the 2nd results
results2=`curl -s $requestUrl2 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the second results
echo -e $query2 "articles in database: " '\t' $results2  '\n'

# Build a third URL 
requestUrl3="$baseurl?begin_date=$begin_date_year$begin_date_month$begin_date_day&end_date=$end_date_year$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"

# Filter the number of hits from the 3rd results
results1850h=`curl -s $requestUrl3 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the third results
echo -e $query1 "articles in the 1850's:" '\t' $results1850h

# Add-on by Sjoerd: build query to look for front-page articles. 
requestUrl20="$baseurl?begin_date=$begin_date_year$begin_date_month$begin_date_day&end_date=$end_date_year$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"

# Filter the number of hits from the add-on:
results1850y=`curl -s $requestUrl20 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the results of the add-on
echo -e $query1 $tekst1 "1850's:" '\t' $results1850y '\n'

# Build a fourth URL
requestUrl4="$baseurl?begin_date=$begin_date_year$begin_date_month$begin_date_day&end_date=$end_date_year$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"

# Filter the number of hits from the 4th results
results1850s=`curl -s $requestUrl4 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the fourth results
echo -e $query2 "articles in the 1850's:" '\t' $results1850s 

# Add-on by Sjoerd: build query to look for front-page articles. 
requestUrl21="$baseurl?begin_date=$begin_date_year$begin_date_month$begin_date_day&end_date=$end_date_year$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"

# Filter the number of hits from the add-on:
results1850z=`curl -s $requestUrl21 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

# Display the results of the add-on
echo -e $query2 $tekst1 "1850's:" '\t' $results1850z '\n'

# 1860's 
requestUrl5="$baseurl?begin_date=$begin_date_year2$begin_date_month$begin_date_day&end_date=$end_date_year2$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1860h=`curl -s $requestUrl5 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1860's:" '\t' $results1860h

# ADD-ON (Sjoerd)
requestUrl22="$baseurl?begin_date=$begin_date_year2$begin_date_month$begin_date_day&end_date=$end_date_year2$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1860y=`curl -s $requestUrl22 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1860's:" '\t' $results1860y '\n'

requestUrl6="$baseurl?begin_date=$begin_date_year2$begin_date_month$begin_date_day&end_date=$end_date_year2$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1860s=`curl -s $requestUrl6 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1860's:" '\t' $results1860s  

# ADD-ON (Sjoerd)
requestUrl23="$baseurl?begin_date=$begin_date_year2$begin_date_month$begin_date_day&end_date=$end_date_year2$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1860z=`curl -s $requestUrl23 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1860's:" '\t' $results1860z  '\n'

# 1870's 
requestUrl7="$baseurl?begin_date=$begin_date_year3$begin_date_month$begin_date_day&end_date=$end_date_year3$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1870h=`curl -s $requestUrl7 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1870's:" '\t' $results1870h

# ADD-ON (Sjoerd)
requestUrl24="$baseurl?begin_date=$begin_date_year3$begin_date_month$begin_date_day&end_date=$end_date_year3$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1870y=`curl -s $requestUrl24 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1870's:" '\t' $results1870y '\n'

requestUrl8="$baseurl?begin_date=$begin_date_year3$begin_date_month$begin_date_day&end_date=$end_date_year3$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1870s=`curl -s $requestUrl8 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1870's:" '\t' $results1870s  

# ADD-ON (Sjoerd)
requestUrl25="$baseurl?begin_date=$begin_date_year3$begin_date_month$begin_date_day&end_date=$end_date_year3$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1870z=`curl -s $requestUrl25 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1870's:" '\t' $results1870z  '\n'

# 1880's 
requestUrl9="$baseurl?begin_date=$begin_date_year4$begin_date_month$begin_date_day&end_date=$end_date_year4$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1880h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1880's:" '\t' $results1880h

# ADD-ON (Sjoerd)
requestUrl26="$baseurl?begin_date=$begin_date_year4$begin_date_month$begin_date_day&end_date=$end_date_year4$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1880y=`curl -s $requestUrl26 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1880's:" '\t' $results1880y '\n'

requestUrl10="$baseurl?begin_date=$begin_date_year4$begin_date_month$begin_date_day&end_date=$end_date_year4$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1880s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1880's:" '\t' $results1880s  

# ADD-ON (Sjoerd)
requestUrl27="$baseurl?begin_date=$begin_date_year4$begin_date_month$begin_date_day&end_date=$end_date_year4$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1880z=`curl -s $requestUrl27 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1880's:" '\t' $results1880z  '\n'

# 1890's 
requestUrl9="$baseurl?begin_date=$begin_date_year5$begin_date_month$begin_date_day&end_date=$end_date_year5$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1890h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1890's:" '\t' $results1890h

# ADD-ON (Sjoerd)
requestUrl28="$baseurl?begin_date=$begin_date_year5$begin_date_month$begin_date_day&end_date=$end_date_year5$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1890y=`curl -s $requestUrl28 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1890's:" '\t' $results1890y '\n'

requestUrl10="$baseurl?begin_date=$begin_date_year5$begin_date_month$begin_date_day&end_date=$end_date_year5$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1890s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1890's:" '\t' $results1890s  

# ADD-ON (Sjoerd)
requestUrl29="$baseurl?begin_date=$begin_date_year5$begin_date_month$begin_date_day&end_date=$end_date_year5$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1890z=`curl -s $requestUrl29 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1890's:" '\t' $results1890z '\n'

# 1900's 
requestUrl9="$baseurl?begin_date=$begin_date_year6$begin_date_month$begin_date_day&end_date=$end_date_year6$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1900h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1900's:" '\t' $results1900h

# ADD-ON (Sjoerd)
requestUrl30="$baseurl?begin_date=$begin_date_year6$begin_date_month$begin_date_day&end_date=$end_date_year6$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1900y=`curl -s $requestUrl30 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1900's:" '\t' $results1900y '\n'

requestUrl10="$baseurl?begin_date=$begin_date_year6$begin_date_month$begin_date_day&end_date=$end_date_year6$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1900s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1900's:" '\t' $results1900s  

# ADD-ON (Sjoerd)
requestUrl31="$baseurl?begin_date=$begin_date_year6$begin_date_month$begin_date_day&end_date=$end_date_year6$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1900z=`curl -s $requestUrl31 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1900's:" '\t' $results1900z '\n'

# 1910's 
requestUrl9="$baseurl?begin_date=$begin_date_year7$begin_date_month$begin_date_day&end_date=$end_date_year7$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1910h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1910's:" '\t' $results1910h

# ADD-ON (Sjoerd)
requestUrl32="$baseurl?begin_date=$begin_date_year7$begin_date_month$begin_date_day&end_date=$end_date_year7$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1910y=`curl -s $requestUrl32 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1910's:" '\t' $results1910y '\n'

requestUrl10="$baseurl?begin_date=$begin_date_year7$begin_date_month$begin_date_day&end_date=$end_date_year7$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1910s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1910's:" '\t' $results1910s  

# ADD-ON (Sjoerd)
requestUrl33="$baseurl?begin_date=$begin_date_year7$begin_date_month$begin_date_day&end_date=$end_date_year7$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1910z=`curl -s $requestUrl33 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1910's:" '\t' $results1910z '\n'

# 1920's 
requestUrl9="$baseurl?begin_date=$begin_date_year8$begin_date_month$begin_date_day&end_date=$end_date_year8$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1920h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1920's:" '\t' $results1920h

# ADD-ON (Sjoerd)
requestUrl34="$baseurl?begin_date=$begin_date_year8$begin_date_month$begin_date_day&end_date=$end_date_year8$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1920y=`curl -s $requestUrl34 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1920's:" '\t' $results1920y '\n'

requestUrl10="$baseurl?begin_date=$begin_date_year8$begin_date_month$begin_date_day&end_date=$end_date_year8$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1920s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1920's:" '\t' $results1920s 

# ADD-ON (Sjoerd)
requestUrl35="$baseurl?begin_date=$begin_date_year8$begin_date_month$begin_date_day&end_date=$end_date_year8$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1920z=`curl -s $requestUrl35 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1920's:" '\t' $results1920z '\n'

# 1930's 
requestUrl9="$baseurl?begin_date=$begin_date_year9$begin_date_month$begin_date_day&end_date=$end_date_year9$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1930h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1930's:" '\t' $results1930h

# ADD-ON (Sjoerd)
requestUrl36="$baseurl?begin_date=$begin_date_year9$begin_date_month$begin_date_day&end_date=$end_date_year9$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1930y=`curl -s $requestUrl36 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1930's:" '\t' $results1930y '\n'                                        

requestUrl10="$baseurl?begin_date=$begin_date_year9$begin_date_month$begin_date_day&end_date=$end_date_year9$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1930s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1930's:" '\t' $results1930s  

# ADD-ON (Sjoerd)
requestUrl37="$baseurl?begin_date=$begin_date_year9$begin_date_month$begin_date_day&end_date=$end_date_year9$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1930z=`curl -s $requestUrl37 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1930's:" '\t' $results1930z '\n' 

# 1940's 
requestUrl9="$baseurl?begin_date=$begin_date_year10$begin_date_month$begin_date_day&end_date=$end_date_year10$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1940h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1940's:" '\t' $results1940h

echo -e "\n" "Experiencing some problems.." "\n" "chasing the cat..."

sleep 4.0

echo -e "\n" "got it!"

sleep 3.0 

open http://www.simonlovell.co.uk/wp-content/uploads/2013/02/save-kitten.jpg

sleep 10.0

echo -e "\n" "Allright we'll let it live for now. Continuing..."

sleep 2.0

# ADD-ON (Sjoerd)
requestUrl38="$baseurl?begin_date=$begin_date_year10$begin_date_month$begin_date_day&end_date=$end_date_year10$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1940y=`curl -s $requestUrl38 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1940's:" '\t' $results1940y '\n' 

requestUrl10="$baseurl?begin_date=$begin_date_year10$begin_date_month$begin_date_day&end_date=$end_date_year10$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1940s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1940's:" '\t' $results1940s  

# ADD-ON (Sjoerd)
requestUrl39="$baseurl?begin_date=$begin_date_year10$begin_date_month$begin_date_day&end_date=$end_date_year10$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1940z=`curl -s $requestUrl39 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1940's:" '\t' $results1940z '\n' 

# 1950's 
requestUrl9="$baseurl?begin_date=$begin_date_year11$begin_date_month$begin_date_day&end_date=$end_date_year11$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1950h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1950's:" '\t' $results1950h

# ADD-ON (Sjoerd)
requestUrl40="$baseurl?begin_date=$begin_date_year11$begin_date_month$begin_date_day&end_date=$end_date_year11$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1950y=`curl -s $requestUrl40 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1950's:" '\t' $results1950y '\n' 

requestUrl10="$baseurl?begin_date=$begin_date_year11$begin_date_month$begin_date_day&end_date=$end_date_year11$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1950s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1950's:" '\t' $results1950s 

# ADD-ON (Sjoerd)
requestUrl50="$baseurl?begin_date=$begin_date_year11$begin_date_month$begin_date_day&end_date=$end_date_year11$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1950z=`curl -s $requestUrl50 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1950's:" '\t' $results1950z '\n' 

# 1960's 
requestUrl9="$baseurl?begin_date=$begin_date_year12$begin_date_month$begin_date_day&end_date=$end_date_year12$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1960h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1960's:" '\t' $results1960h

# ADD-ON (Sjoerd)
requestUrl51="$baseurl?begin_date=$begin_date_year12$begin_date_month$begin_date_day&end_date=$end_date_year12$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1960y=`curl -s $requestUrl51 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1960's:" '\t' $results1960y '\n' 

requestUrl10="$baseurl?begin_date=$begin_date_year12$begin_date_month$begin_date_day&end_date=$end_date_year12$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1960s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1960's:" '\t' $results1960s 

# ADD-ON (Sjoerd)
requestUrl52="$baseurl?begin_date=$begin_date_year12$begin_date_month$begin_date_day&end_date=$end_date_year12$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1960z=`curl -s $requestUrl52 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1960's:" '\t' $results1960z '\n' 

# 1970's 
requestUrl9="$baseurl?begin_date=$begin_date_year13$begin_date_month$begin_date_day&end_date=$end_date_year13$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1970h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1970's:" '\t' $results1970h

# ADD-ON (Sjoerd)
requestUrl53="$baseurl?begin_date=$begin_date_year13$begin_date_month$begin_date_day&end_date=$end_date_year13$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
results1970y=`curl -s $requestUrl53 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 $tekst1 "1970's:" '\t' $results1970y '\n' 

requestUrl10="$baseurl?begin_date=$begin_date_year13$begin_date_month$begin_date_day&end_date=$end_date_year13$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1970s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1970's:" '\t' $results1970s  

# ADD-ON (Sjoerd)
requestUrl54="$baseurl?begin_date=$begin_date_year13$begin_date_month$begin_date_day&end_date=$end_date_year13$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
results1970z=`curl -s $requestUrl54 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 $tekst1 "1970's:" '\t' $results1970z '\n'

# 1980's
#requestUrl9="$baseurl?begin_date=$begin_date_year14$begin_date_month$begin_date_day&end_date=$end_date_year14$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
#results1980h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
#echo -e $query1 "articles in the 1980's:" '\t' $results1980h

# ADD-ON (Sjoerd) - 80's veld 1 
#requestUrl55="$baseurl?begin_date=$begin_date_year14$begin_date_month$begin_date_day&end_date=$end_date_year14$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field:%28%22$field_query1%22%29"
#results1980y=`curl -s $requestUrl55 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'` 

#echo -e $results1980y > 1980_oudveld.txt

#ADD-ON (Sjoerd) - 80's veld 2
#requestUrl110="$baseurl?begin_date=$begin_date_year14$begin_date_month$begin_date_day&end_date=$end_date_year14$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1&fq=$field2:%28%22$field_query1%22%29"
#results1982y=`curl -s $requestUrl110 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'` 

#echo -e $results1982y > 1980_nieuwveld.txt

#echo -e "$(cat 1980_oudveld.txt)" "$(cat 1980_nieuwveld.txt)" | awk '{print $1 + $2}' > test5.txt

#echo -e $query1 $tekst1 "1980's:" '\t' "$(cat test5.txt)" '\n'

#requestUrl10="$baseurl?begin_date=$begin_date_year14$begin_date_month$begin_date_day&end_date=$end_date_year14$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
#results1980s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
#echo -e $query2 "articles in the 1980's:" '\t' $results1980s

# ADD-ON (Sjoerd) - 80's veld 1
#requestUrl56="$baseurl?begin_date=$begin_date_year14$begin_date_month$begin_date_day&end_date=$end_date_year14$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field:%28%22$field_query1%22%29"
#results1980z=`curl -s $requestUrl56 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

#echo -e $results1980z > 1980_oudveld2.txt

# ADD-ON (Sjoerd) - 80's veld 2
#requestUrl112="$baseurl?begin_date=$begin_date_year14$begin_date_month$begin_date_day&end_date=$end_date_year14$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2&fq=$field2:%28%22$field_query1%22%2A%29"
#results1982z=`curl -s $requestUrl112 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

#echo -e $results1982z > 1980_nieuwveld2.txt

#echo -e "$(cat 1980_oudveld2.txt)" "$(cat 1980_nieuwveld2.txt)" | awk '{print $1 + $2}' > test10.txt

#echo -e $query2 $tekst1 "1980's:" '\t' "$(cat test5.txt)" '\n'

# 1990's 
requestUrl9="$baseurl?begin_date=$begin_date_year15$begin_date_month$begin_date_day&end_date=$end_date_year15$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results1990h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 1990's:" '\t' $results1990h

echo -e '\n' "---" '\n' "Feel free to go and grab a coffee, this may take a while..." '\n' "---" '\n'

# ADD-ON (Sjoerd)
for i in {1990..1999}; do
	pipo=$i

cat $query1.json | grep 'pub_date":"'$pipo | jq '.section_name' | grep -i front | wc -l > jupie.txt

echo -e $pipo ": " "$(cat jupie.txt)" >> jupie2.txt

done 

snel="$(cat jupie2.txt | awk '{ sum += $3 } END { print sum }')"

echo -e $query1 $tekst1 "1990's:" '\t' $snel '\n'

requestUrl10="$baseurl?begin_date=$begin_date_year15$begin_date_month$begin_date_day&end_date=$end_date_year15$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results1990s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 1990's:" '\t' $results1990s

# ADD-ON (Sjoerd)
for i in {1990..1999}; do
	rood=$i

cat nytimes_humanities_flat.json | grep 'pub_date": "'$rood | jq '.section_name' | grep -i front | wc -l > jupie5.txt

echo -e $rood ": " "$(cat jupie5.txt)" >> jupie6.txt

done 

traag="$(cat jupie6.txt | awk '{ sum += $3 } END { print sum }')"

echo -e $query2 $tekst1 "1990's" '\t' $traag '\n'


# 2000's 
requestUrl9="$baseurl?begin_date=$begin_date_year16$begin_date_month$begin_date_day&end_date=$end_date_year16$end_date_month$end_date_day&api-key=$key&page=$page&q=$query1"
results2000h=`curl -s $requestUrl9 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query1 "articles in the 2000's:" '\t' $results2000h

echo -e '\n' "---" '\n' "Finished your coffee already? Allright, go ahead, take another one..." '\n' "---" '\n'

# ADD-ON (Sjoerd)
for i in {2000..2009}; do
	clown=$i

cat $query1.json | grep 'pub_date":"'$clown | jq '.section_name' | grep -i front | wc -l > jupie3.txt

echo -e $clown ": " "$(cat jupie.txt)" >> jupie4.txt

done 

snel2="$(cat jupie4.txt | awk '{ sum += $3 } END { print sum }')"

echo -e $query1 $tekst1 "2000's:" '\t' $snel2 '\n'

requestUrl10="$baseurl?begin_date=$begin_date_year16$begin_date_month$begin_date_day&end_date=$end_date_year16$end_date_month$end_date_day&api-key=$key&page=$page&q=$query2"
results2000s=`curl -s $requestUrl10 | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`
echo -e $query2 "articles in the 2000's:" '\t' $results2000s

# ADD-ON (Sjoerd)
for i in {2000..2009}; do
	haar=$i

cat nytimes_humanities_flat.json | grep 'pub_date": "'$haar | jq '.section_name' | grep -i front | wc -l > jupie7.txt

echo -e $haar ": " "$(cat jupie7.txt)" >> jupie8.txt

done 

traag2="$(cat jupie8.txt | awk '{ sum += $3 } END { print sum }')"

echo -e $query2 $tekst1 "2000's" '\t' $traag2


#rm 1980_oudveld.txt
#rm 1980_nieuwveld.txt
#rm 1980_oudveld2.txt
#rm 1980_nieuwveld2.txt
#rm test5.txt
#rm test10.txt


#Create CSS file
echo '#chart_div {
position: absolute;
top: 0px;
left: 0%;
width: 100%;
height: 500px;
border-bottom: 2px solid #ccd;
}
#chart2_div {
position: absolute;
top: 500px;
left: 0%;
width: 100%;
height: 500px;
}' > decade_chart.css


#Create html file
echo '<html>
  <head>
    <link rel="stylesheet" type="text/css" href="decade_chart.css">
    
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['\''Decade'\'', '\'''$query1''\'', '\'''$query2''\''],
          ['\''1850'\'',  '$results1850h',      '$results1850s'],
          ['\''1860'\'',  '$results1860h',      '$results1860s'],
          ['\''1870'\'',  '$results1870h',      '$results1870s'],
          ['\''1880'\'',  '$results1880h',      '$results1880s'],
          ['\''1890'\'',  '$results1890h',      '$results1890s'],
          ['\''1900'\'',  '$results1900h',      '$results1900s'],
          ['\''1910'\'',  '$results1910h',      '$results1910s'],
          ['\''1920'\'',  '$results1920h',      '$results1920s'],
          ['\''1930'\'',  '$results1930h',      '$results1930s'],
          ['\''1940'\'',  '$results1940h',      '$results1940s'],
          ['\''1950'\'',  '$results1950h',      '$results1950s'],
          ['\''1960'\'',  '$results1960h',      '$results1960s'],
          ['\''1970'\'',  '$results1970h',      '$results1970s'],
          ['\''1990'\'',  '$results1990h',      '$results1990s'],
          ['\''2000'\'',  '$results2000h',      '$results2000s']
        ]);

        var options = {
          title: '\'''Number of $query1 vs. $query2 articles in The New York Times''\'',
          curveType: '\''function'\'',
          legend: { position: '\''bottom'\'' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('\''chart_div'\''));

        chart.draw(data, options);
      }
    </script>
    
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['\''Decade'\'', '\'''$query1''\'', '\'''$query2''\''],
          ['\''1850'\'',  '$results1850y/$results1850h*100',      '$results1850z/$results1850s*100'],
          ['\''1860'\'',  '$results1860y/$results1860h*100',      '$results1860z/$results1860s*100'],
          ['\''1870'\'',  '$results1870y/$results1870h*100',      '$results1870z/$results1870s*100'],
          ['\''1880'\'',  '$results1880y/$results1880h*100',      '$results1880z/$results1880s*100'],
          ['\''1890'\'',  '$results1890y/$results1890h*100',      '$results1890z/$results1890s*100'],
          ['\''1900'\'',  '$results1900y/$results1900h*100',      '$results1900z/$results1900s*100'],
          ['\''1910'\'',  '$results1910y/$results1910h*100',      '$results1910z/$results1910s*100'],
          ['\''1920'\'',  '$results1920y/$results1920h*100',      '$results1920z/$results1920s*100'],
          ['\''1930'\'',  '$results1930y/$results1930h*100',      '$results1930z/$results1930s*100'],
          ['\''1940'\'',  '$results1940y/$results1940h*100',      '$results1940z/$results1940s*100'],
          ['\''1950'\'',  '$results1950y/$results1950h*100',      '$results1950z/$results1950s*100'],
          ['\''1960'\'',  '$results1960y/$results1960h*100',      '$results1960z/$results1960s*100'],
          ['\''1970'\'',  '$results1970y/$results1970h*100',      '$results1970z/$results1970s*100'],
          ['\''1990'\'',  '$snel/$results1990h*100',      '$traag/$results1990s*100'],
          ['\''2000'\'',  '$snel2/$results1990h*100',      '$traag2/$results1990s*100']
        ]);

        var options = {
          title: '\'''Percentage of $query1 vs. $query2 articles on the front page of The New York Times''\'',
          curveType: '\''function'\'',
          legend: { position: '\''bottom'\'' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('\''chart2_div'\''));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart_div"></div>
    <div id="chart2_div"></div>
  </body>
</html>' > decade_chart.html

#Open html file
open decade_chart.html

rm jupie.txt
rm jupie2.txt
rm jupie3.txt
rm jupie4.txt
rm jupie5.txt
rm jupie6.txt
rm jupie7.txt
rm jupie8.txt
