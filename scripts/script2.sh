# Print number of news-items with New York Times as a source, and give a total count per decade. Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{print int($1/10)*10,$6}' | grep 'The New York Times' | sort | uniq -c | awk '{print $1 "\t" $2}' > artikelen_per_decennium.txt

# Print number of Front-page-articles with New York Times as a source (the dataset only contains Front-page-articles from the New York Times), and give a total count per decade.  Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print int($1/10)*10}' | sort | uniq -c | awk '{print $1}' > voorpagina_artikelen_per_decennium.txt

# Combine the previously created text files into one new text file.
paste artikelen_per_decennium.txt voorpagina_artikelen_per_decennium.txt > artikelen_berekening.txt

# Calculate percentage of front page articles by dividing number of front page articles by total number of articles in the previously created text file. Paste results into a new text file.
cat artikelen_berekening.txt | awk -F '\t' '{printf"%2.1f\n",($3/$1*100)"%"}' | awk '{print $1,"%"}' > percentage_voorpagina_artikelen.txt

# Show an explanation of output (create legenda):
echo -e "art\tdecade\tfront\t"

# Create output by pasting the previously created text files
paste artikelen_per_decennium.txt voorpagina_artikelen_per_decennium.txt percentage_voorpagina_artikelen.txt

result1=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 1 && NR <= 1' | sed 's/%//')
result2=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 2 && NR <= 2' | sed 's/%//')
result3=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 3 && NR <= 3' | sed 's/%//')
result4=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 4 && NR <= 4' | sed 's/%//')
result5=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 5 && NR <= 5' | sed 's/%//')
result6=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 6 && NR <= 6' | sed 's/%//')
result7=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 7 && NR <= 7' | sed 's/%//')
result8=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 8 && NR <= 8' | sed 's/%//')
result9=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 9 && NR <= 9' | sed 's/%//')
result10=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 10 && NR <= 10' | sed 's/%//')
result11=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 11 && NR <= 11' | sed 's/%//')
result12=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 12 && NR <= 12' | sed 's/%//')
result13=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 13 && NR <= 13' | sed 's/%//')
result14=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 14 && NR <= 14' | sed 's/%//')
result15=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 15 && NR <= 15' | sed 's/%//')
result16=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 16 && NR <= 16' | sed 's/%//')

echo ' '

# Print number of news-items with New York Times as a source, and give a total count per month. Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{print $1}' | grep - | sed -e 's/....-//' | sed 's/-..T..:..:..Z//' | sort | uniq -c | awk '{print $1 "\t" $2}' > artikelen_per_maand.txt

# Print number of Front-page-articles with New York Times as a source (the dataset only contains Front-page-articles from the New York Times), and give a total count per month.  Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print $1}' | sed -e 's/....-//' | sed 's/-..T..:..:..Z//' | sort | uniq -c | awk '{print $1}' > voorpagina_artikelen_per_maand.txt

# Combine the previously created text files into one new text file.
paste artikelen_per_maand.txt voorpagina_artikelen_per_maand.txt > artikelen_berekening.txt

# Calculate percentage of front page articles by dividing number of front page articles by total number of articles in the previously created text file. Paste results into a new text file.
cat artikelen_berekening.txt | awk -F '\t' '{printf"%2.1f\n",($3/$1*100)}' | awk '{print $1,"%"}' > percentage_voorpagina_artikelen.txt

# Show an explanation of output (create legenda):
echo -e "art\tmonth\tfront\t"

# Create output by pasting the previously created text files
paste artikelen_per_maand.txt voorpagina_artikelen_per_maand.txt percentage_voorpagina_artikelen.txt

result17=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 1 && NR <= 1' | sed 's/%//')
result18=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 2 && NR <= 2' | sed 's/%//')
result19=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 3 && NR <= 3' | sed 's/%//')
result20=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 4 && NR <= 4' | sed 's/%//')
result21=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 5 && NR <= 5' | sed 's/%//')
result22=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 6 && NR <= 6' | sed 's/%//')
result23=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 7 && NR <= 7' | sed 's/%//')
result24=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 8 && NR <= 8' | sed 's/%//')
result25=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 9 && NR <= 9' | sed 's/%//')
result26=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 10 && NR <= 10' | sed 's/%//')
result27=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 11 && NR <= 11' | sed 's/%//')
result28=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 12 && NR <= 12' | sed 's/%//')

echo ' '

# Print number of news-items with New York Times as a source, and give a total count per day of the month. Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{print $1}' | grep - | sed -e 's/.//11g' | sed -e 's/.*-//' | sort | uniq -c | awk '{print $1 "\t" $2}' > artikelen_per_dag.txt

# Print number of Front-page-articles with New York Times as a source (the dataset only contains Front-page-articles from the New York Times), and give a total count per day of the month.  Paste results into a text file.
cat nytimes_humanities_tabbed.csv | awk -F '\t' '{if ($2 ~ "Front Page" || $8 ~ "Front Page") print $1}' | sed -e 's/.//11g' | sed -e 's/.*-//' | sort | uniq -c | awk '{print $1}' > voorpagina_artikelen_per_dag.txt

# Combine the previously created text files into one new text file.
paste artikelen_per_dag.txt voorpagina_artikelen_per_dag.txt > artikelen_berekening.txt

# Calculate percentage of front page articles by dividing number of front page articles by total number of articles in the previously created text file. Paste results into a new text file.
cat artikelen_berekening.txt | awk -F '\t' '{printf"%2.1f\n",($3/$1*100)"%"}' | awk '{print $1,"%"}' > percentage_voorpagina_artikelen.txt

# Show an explanation of output (create legenda):
echo -e "art\tday\tfront\tperc"

# Create output by pasting the previously created text files
paste artikelen_per_dag.txt voorpagina_artikelen_per_dag.txt percentage_voorpagina_artikelen.txt



result29=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 1 && NR <= 1' | sed 's/%//')
result30=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 2 && NR <= 2' | sed 's/%//')
result31=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 3 && NR <= 3' | sed 's/%//')
result32=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 4 && NR <= 4' | sed 's/%//')
result33=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 5 && NR <= 5' | sed 's/%//')
result34=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 6 && NR <= 6' | sed 's/%//')
result35=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 7 && NR <= 7' | sed 's/%//')
result36=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 8 && NR <= 8' | sed 's/%//')
result37=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 9 && NR <= 9' | sed 's/%//')
result38=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 10 && NR <= 10' | sed 's/%//')
result39=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 11 && NR <= 11' | sed 's/%//')
result40=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 12 && NR <= 12' | sed 's/%//')
result41=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 13 && NR <= 13' | sed 's/%//')
result42=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 14 && NR <= 14' | sed 's/%//')
result43=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 15 && NR <= 15' | sed 's/%//')
result44=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 16 && NR <= 16' | sed 's/%//')
result45=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 17 && NR <= 17' | sed 's/%//')
result46=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 18 && NR <= 18' | sed 's/%//')
result47=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 19 && NR <= 19' | sed 's/%//')
result48=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 20 && NR <= 20' | sed 's/%//')
result49=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 21 && NR <= 21' | sed 's/%//')
result50=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 22 && NR <= 22' | sed 's/%//')
result51=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 23 && NR <= 23' | sed 's/%//')
result52=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 24 && NR <= 24' | sed 's/%//')
result53=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 25 && NR <= 25' | sed 's/%//')
result54=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 26 && NR <= 26' | sed 's/%//')
result55=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 27 && NR <= 27' | sed 's/%//')
result56=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 28 && NR <= 28' | sed 's/%//')
result57=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 29 && NR <= 29' | sed 's/%//')
result58=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 30 && NR <= 30' | sed 's/%//')
result59=$(cat percentage_voorpagina_artikelen.txt | awk 'NR >= 31 && NR <= 31' | sed 's/%//')

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
border-bottom: 2px solid #ccd;
}
#chart3_div {
position: absolute;
top: 1000px;
left: 0%;
width: 100%;
height: 500px;
border-bottom: 2px solid #ccd;
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
          ['\''Decade'\'', '\''Percentage'\''],
          ['\''1850'\'',  '$result1'],
          ['\''1860'\'',  '$result2'],
          ['\''1870'\'',  '$result3'],
          ['\''1880'\'',  '$result4'],
          ['\''1890'\'',  '$result5'],
          ['\''1900'\'',  '$result6'],
          ['\''1910'\'',  '$result7'],
          ['\''1920'\'',  '$result8'],
          ['\''1930'\'',  '$result9'],
          ['\''1940'\'',  '$result10'],
          ['\''1950'\'',  '$result11'],
          ['\''1960'\'',  '$result12'],
          ['\''1970'\'',  '$result13'],
          ['\''1980'\'',  '$result14'],
          ['\''1990'\'',  '$result15'],
          ['\''2000'\'',  '$result16']
        ]);

        var options = {
          title: '\'''Percentage of Humanities articles on the front page of The New York Times per decade''\'',
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
          ['\''Month'\'', '\''Percentage'\''],
          ['\''January'\'',  '$result17'],
          ['\''February'\'',  '$result18'],
          ['\''March'\'',  '$result19'],
          ['\''April'\'',  '$result20'],
          ['\''May'\'',  '$result21'],
          ['\''June'\'',  '$result22'],
          ['\''July'\'',  '$result23'],
          ['\''August'\'',  '$result24'],
          ['\''September'\'',  '$result25'],
          ['\''October'\'',  '$result26'],
          ['\''November'\'',  '$result27'],
          ['\''December'\'',  '$result28']
        ]);

        var options = {
          title: '\'''Avarage percentage of Humanities articles on the front page of The New York Times per month''\'',
          legend: { position: '\''bottom'\'' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('\''chart2_div'\''));

        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['\''Decade'\'', '\''Percentage'\''],
          ['\''1'\'',  '$result29'],
          ['\''2'\'',  '$result30'],
          ['\''3'\'',  '$result31'],
          ['\''4'\'',  '$result32'],
          ['\''5'\'',  '$result33'],
          ['\''6'\'',  '$result34'],
          ['\''7'\'',  '$result35'],
          ['\''8'\'',  '$result36'],
          ['\''9'\'',  '$result37'],
          ['\''10'\'',  '$result38'],
          ['\''11'\'',  '$result39'],
          ['\''12'\'',  '$result40'],
          ['\''13'\'',  '$result41'],
          ['\''14'\'',  '$result42'],
          ['\''15'\'',  '$result43'],
          ['\''16'\'',  '$result44'],
          ['\''17'\'',  '$result45'],
          ['\''18'\'',  '$result46'],
          ['\''19'\'',  '$result47'],
          ['\''20'\'',  '$result48'],
          ['\''21'\'',  '$result49'],
          ['\''22'\'',  '$result50'],
          ['\''23'\'',  '$result51'],
          ['\''24'\'',  '$result52'],
          ['\''25'\'',  '$result53'],
          ['\''26'\'',  '$result54'],
          ['\''27'\'',  '$result55'],
          ['\''28'\'',  '$result56'],
          ['\''29'\'',  '$result57'],
          ['\''30'\'',  '$result58'],
          ['\''31'\'',  '$result59']
          
        ]);

        var options = {
          title: '\'''Avarage percentage of Humanities articles on the front page of The New York Times per day of the month''\'',
          legend: { position: '\''bottom'\'' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('\''chart3_div'\''));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="chart_div"></div>
    <div id="chart2_div"></div>
    <div id="chart3_div"></div>
  </body>
</html>' > decade_chart.html

#Open html file
open decade_chart.html

rm artikelen_per_decennium.txt
rm voorpagina_artikelen_per_decennium.txt
rm artikelen_berekening.txt
rm artikelen_per_maand.txt
rm voorpagina_artikelen_per_maand.txt
rm artikelen_per_dag.txt
rm voorpagina_artikelen_per_dag.txt
rm percentage_voorpagina_artikelen.txt
