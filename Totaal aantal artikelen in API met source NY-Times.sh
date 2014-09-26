baseurl="http://api.nytimes.com/svc/search/v2/articlesearch.json"

key="plak hier je eigen key"
query=""
field="source"
search_field="The+New+York+Times"
page=0

requestUrl="$baseurl?fq=$field:(%22$search_field%22)&api-key=$key&page=$page"

results=`curl -s $requestUrl | awk -F ':' '{print $4}' | sed -E 's/,"time"//'`

echo "hits=" $results
