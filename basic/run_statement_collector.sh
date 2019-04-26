#!/bin/bash

#runs with Python2.7 If your local env default is Python3, then replace "python" with "python2" below.
#CONFIG FILE NEEDS TO BE FILLED OUT WITH YOUR API INFO before running this, or it will not be able to access the Twitter API.  Apply for access here - https://developer.twitter.com/en/apply-for-access

#usage: ./run_statement_collector.sh

set -x

DATA_PATH=data

QUERY="from:INSERTUSERNAMEHERE" #insert user names or whatever twitter query string you want here.
SINCE_ID="FIRSTTWEETGOESHERE"  # If you want to start at a specific tweet
DATA_FILE=twitter_dump.json

#most recent 7 days version
python main.py --data-path ${DATA_PATH} --data-file ${DATA_FILE} --query "${QUERY}"
#since specific ID version
#python main.py --data-path ${DATA_PATH} --data-file ${DATA_FILE} --query "${QUERY}" --since-id ${SINCE_ID}
