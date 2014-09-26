baseurl="http://api.nytimes.com/svc/search/v2/articlesearch.json"

key="e011d3c8dfcd2c63f5465ecd97c02526:14:69382243"
query=""
field="source"
search_field="The+New+York+Times"
page=0

requestUrl="$baseurl?fq=$field:(%22$search_field%22)&api-key=$key&page=$page"

results=`curl -s $requestUrl | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "hits=" $results
