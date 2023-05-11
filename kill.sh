optionParam=$1
ps -ef | grep $optionParam | grep -v grep | awk '{print $2}' | xargs kill -9
