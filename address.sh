s3cmd sync s3://chomsonforms/address .
find address/ -type f | xargs jq [.name,.plusname,.addressline1,.addressline2,.city,.state,.zip] | jq @csv
