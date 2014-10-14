# WHHHAAAAA {1} {2} ::: {Hulk} ::: {mode} 
# let's hammer the effin nyt server, ban me mofo's...

# 1: install parallell -> Terminal: brew install parallel
# then  automate the request with parallel
parallel -j2 --progress --delay 0.01 --results effinresults "curl -sL "\
"'http://api.nytimes.com/svc/search/v2/articlesearch.json?q=humanities+decay'"\
"'&begin_date={1}0101&end_date={1}1231&page={2}&api-key='"\
"'insert key'" ::: {1859..1859} ::: {0..99} > /dev/null
# install tree -> Terminal: brew install tree
# lets look at the beautifull file tree:
tree effinresults | head

 # lets combine and process with cat and jq FTW (if u know what your doing with jq, and im still a JaQass))
cat effinresults/1/*/2/*/stdout | jq -c '.response.docs[] | {date: .pub_date, source: .source, page: .print_page}' > all_articles.json

# dafuq's going on here? 
# well, first we automate the request with parallel and we hammer the server with a time-out of 1/10th of a second (100 milliseconds)
# and 3 cores (-j3) because we're mad at the nyt api and ourselfs because this is taking way to long.
# then we automate even further with parallel and let it curl (silent and location (if they moved the url the request won't fail because we follow to the new location)
# (-sL)) the nyt api results for us with the parameters we gave and we save the results in the folder we let it create called effinresults 
# (because we're still mad...)
# we also let it automate the request from a certain period we want with {1} and {2} which are placeholders for 
# the years we specify later on (::: {1951..1959} ::: {0..99} which are the date range we want to hammer the server with and the pages we request)
# the nyt api give us 100 pages, so we have to request all pages (0-99) because we want it all baby...
# then we send the results to dev/null to remove the data (in a way the datastream experiences a digital death, but in a wierd way we also 
# saved it (it's hidden in the standardoutput (stdout) in effinresults/1/year(*=anychar)2/*/stdout) which we itterate over with jq
# to save only the key/values that were interested in (date, source, page).).

# now where going to find all the first page humanities articles
cat all_articles.json | jq 'select(.page=="1") | {date: .date, source: .source, page: .page}' > first_pages_only.json
