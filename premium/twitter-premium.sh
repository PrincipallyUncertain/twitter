#!/bin/bash

# This is a Twitter API scraper that pulls using the Premium API's 30day endpoint (up to 500 at a time, 250 pulls per month).  To switch to full archive, replace "30day" with "fullarchive" in your credential file (up to 100 at a time, 50 pulls per month)

#NOTE - you WILL NEED A TWITTER PREMIUM DEVELPOER API KEY to run this.  Get one here - https://developer.twitter.com/en/apply-for-access

#usage ./twitter-premium.sh

#raw command line for tester purposes that pulls the whole .json of the last 30 days:  ./tweet.sh search -q from:realDonaldTrump","maxResults":500 | jq '.["results"] | .[].extended_tweet | .full_text'

today=$(date +%Y%m%d) #normal one for day-of.
#today="$1" #if you need to add a date as a command-line argument

pull=$(python3 search-tweets-python/tools/search_tweets.py --max-results 500 --filter-rule "from:INSERTYOURQUERYHERE" --filename-prefix twitter_$today --credential-file .twitter_keys.yaml --no-print-stream)

  echo $pull

>twitter_$today.csv

#set variables and parse json with jq
id=$(cat twitter_$today.json | jq '.id_str')
fulltext=$(cat twitter_$today.json | jq '.extended_tweet | .full_text' | sed -e 's/null//g')
shorttext=$(cat twitter_$today.json | jq '.text')
created_at=$(cat twitter_$today.json | jq '.created_at')

#account for short tweets by taking the $shorttext value when $fulltext is an empty string
merge=$(paste <(echo "$id") <(echo "$created_at") <(echo "$fulltext") <(echo "$shorttext") -d ',')
echo "$merge" | sed -e 's/\"\,\"/\"\|\"/g' -e 's/\"\,\,\"/\"\|\|\"/g' | awk -F '|' -v OFS='|' '$1 { if ($3=="") $3=$4; print $1, $2, $3}' >> twitter1_$today.csv

#print column names to output file
echo "id|created at|text|tags|notes" > twitter_$today.csv

tac twitter1_$today.csv >> twitter_$today.csv
rm twitter1_$today.csv
