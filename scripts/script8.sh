#!/bin/bash

baseurl="http://api.nytimes.com/svc/search/v2/articlesearch.json"

key=""
query="Sciences"
day="01"

for i in {0..100}
do
    page=$i
    echo -e "page is: " $i
for a in {1980..2010}
do
    #echo "Year: $a"
    for c in {1..12}
    do
        if [ $c -lt 10 ]
        then
            month="0$c"
            #echo $month
        else
            month=$c
        fi
        year=$a

        # case ofwel switch statement, | betekent or
        case $month in
            01|04|06|09|11)
                day2="30"
                ;;
            03|05|07|08|10|12)
                day2="31"
                ;;
            02)
                day2="28"
                ;;
        esac

    echo -e "year is: " $a
    echo -e "month is: " $c
    requestUrl="$baseurl?q=$query&begin_date=$year$month$day&end_date=$year$month$day2&api-key=$key&page=$page"
    #echo $requestUrl
    joepie="$(curl -s $requestUrl | jq -c '.response.docs[]')"
    echo -e "Results written to JSON file: " $joepie
    echo -e $joepie >> $query.json
    sleep 0.2

    done
done
done
