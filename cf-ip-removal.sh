#!/bin/bash
cf_ip_list=$(curl -s -X GET "https://api.cloudflare.com/client/v4/accounts/23632b407d6ad92b9540760fd47b7722/firewall/access_rules/rules?page=1&per_page=1000" -H "X-Auth-Email: thomasharnisch@tutanota.com" -H "X-Auth-Key: 6c3475330dcaa5495e1b4136ccd525409905b" -H "Content-Type: application/json" | jq -r '.result[] | .id')

arr=($cf_ip_list)
length=${#arr[@]}

for (( i=0; i<${length};i++ ));
do
  echo "item: $i/$length, value: ${arr[$i]}, deleted..."
  curl -s -X DELETE "https://api.cloudflare.com/client/v4/accounts/23632b407d6ad92b9540760fd47b7722/firewall/access_rules/rules/${arr[$i]}" -H "X-Auth-Email: thomasharnisch@tutanota.com" -H "X-Auth-Key: 6c3475330dcaa5495e1b4136ccd525409905b" -H "Content-Type: application/json" >> /dev/null
done
