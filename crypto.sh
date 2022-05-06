# Script that will be run every 5 minutes
# Arguments:
#           $1 - coin symbol
#           $2 - price point
#           $3 - trigger operation ('above' or 'below')
#           $4 - email address

string=$( curl -H 'X-CMC_PRO_API_KEY: e1be6383-3a78-4796-8354-4f40b513e166' -H 'Accept: application/json' -d "symbol=$1&convert=USD" -G https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest | python -m json.tool | grep price | sed -n 's/"price": //p' | sed "s/\..*//" )

#echo $string | mailx -s "Price" $4
#echo "$((string + 0)) vs  $(($2 + 0))"


if [ $3 == "above" ]
then
  if [ $((string + 0)) -gt $(($2 + 0)) ]
  then
    echo "Price for your coin is currently $((string + 0)), above your target value $2 " | mailx -s "Price Alert for $1" $4
  fi
elif [ $3 == "below" ]
then
  if [ $((string + 0)) -lt $(($2 + 0)) ]
  then
    echo "Price for your coin is currently $((string + 0)), below your target value $2 " | mailx -s "Price Alert for $1" $4
  fi
fi

