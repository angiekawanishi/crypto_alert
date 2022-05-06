## Angie Kawanishi
## Unix project: Crypto Price Alert

## Description: This program sets up a cronjob to send periodic requests to the 
##              CoinMarketCap API to track the price of a user specified coin. 
##              When the price reaches user's desired price point, alerts will
##              be sent to the user's email.

## Usage: make sure crypto.sh is in the home directory with execution permission
##        run "sh main.sh" 
## Warning: You will be spammed with emails if the price stays within your set 
##          price point.


echo "Enter the official symbol of the coin you want to track (eg.'BTC' for bitcoin)"
read coin

echo "Enter the price point at which you want the alert to be sent"
read price

echo "Enter the trigger operation 'above' or 'below' "
echo "(If you enter 'above', alert will be sent if the price goes above your price point, vice versa)"
read op

echo "Enter your email"
read mail


# Schedule a cron job for periodic API calls (every 5 minutes)
(crontab -l; echo "0,5,10,15,20,25,30,35,40,45,50,55 * * * * ~/crypto.sh $coin $price $op $mail") | sort -u | crontab -
echo "Added new crontab"
