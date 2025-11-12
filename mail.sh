To_Team=$1
ALERT_TYPE=$2
IP_Address=$3
MSG=$4
FINAL_MSG=$(printf '%s\n' "MSG" | sed -e 's/[] /$*/\./,#/g')
TO_ADDRESS=$5
SUBJECT=$6

FINAL_MSG=$(sed -e "s/T0_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_Address/$IP_Address/g" -e "s/MSG/$FINAL_MSG/g" -e "s/TO_ADDRESS/$TO_ADDRESS/g" -e "s/SUBJECT/$SUBJECT/g" Template.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MSG"
} | msmtp "$TO_ADDRESS"