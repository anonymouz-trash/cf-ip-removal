#!/bin/bash

# Put your credentials here, provied values are examples
cf_zone_id=example4ptwdqalnnygz16m121ki8gji
cf_mail=foo@bar.net
cf_global_api=example4ptwdqalnnygz16m121ki8gji

# Start of script
cf_ip_list=$(curl -s -X GET "https://api.cloudflare.com/client/v4/accounts/${cf_zone_id}/firewall/access_rules/rules?page=1&per_page=1000" -H "X-Auth-Email: ${cf_mail}" -H "X-Auth-Key: ${cf_global_api}" -H "Content-Type: application/json" | jq -r '.result[] | .id')
arr=($cf_ip_list)
length=${#arr[@]}
for (( i=0; i<${length};i++ ));
do
  echo "item: $i/$length, value: ${arr[$i]}, deleted..."
  curl -s -X DELETE "https://api.cloudflare.com/client/v4/accounts/${cf_zone_id}/firewall/access_rules/rules/${arr[$i]}" -H "X-Auth-Email: ${cf_mail}" -H "X-Auth-Key: ${cf_global_api}" -H "Content-Type: application/json" >> /dev/null
done
