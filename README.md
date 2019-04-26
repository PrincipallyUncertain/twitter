# Twitter API access scripts and python programs

## Description
Python based Webscrapers (with shell script wrappers) to pull data from both the [Free Twitter API](https://developer.twitter.com/en/docs/tweets/search/api-reference/get-search-tweets.html) and the [Premium Twitter API](https://developer.twitter.com/en/docs/tweets/search/api-reference/premium-search). The difference is [described here](https://blog.twitter.com/developer/en_us/topics/tools/2017/introducing-twitter-premium-apis.html)

## Getting started:
* The wrapper scripts are written in Bash, a unix shell script.  Windows users, you can do this through a Bash for Windows utility (I recommend [Cygwin](https://www.cygwin.com/); it is free and open source).
* The free twitter API is written in Python 2.7 and uses the [Tweepy](https://github.com/tweepy/tweepy) library (which you will need to install).
* The premium twitter API is written in Python3 and uses Twitter's [search-tweets-python](https://github.com/twitterdev/search-tweets-python) library (which you will need to install).
* This assumes a Unix/Linux based filesystem.  For Windows, change the download and file directories accordingly (specifically, replace the "~" home directory with wherever you are working in Windows).
* You WILL NEED a Twitter account (free to set up).
* You WILL NEED a Twitter developer API key to access this API.  [You can apply for either a free or premium one here](https://developer.twitter.com/en/apply-for-access).  The Premium one will need some justification (such as non-commercial research) to be granted.
* You will need to replace the details of the configuration files in both the free or the Premium subdirectories with your credentials
* Guidelines for queries to the [free](https://developer.twitter.com/en/docs/tweets/search/api-reference/get-search-tweets.html) and [premium](https://developer.twitter.com/en/docs/tweets/search/api-reference/premium-search) APIs.

## Acknowledgement
* This software can be used for any non-commercial purpose as long as Patrick W. Zimmerman of [Principally Uncertain](https://principallyuncertain.com) is given credit for its creation.  
* More help for digital historians, data journalists, and interested folk can be found by joining the [Digital Historians Slack group](https://forms.gle/hJUGumGie913mn5y7)
