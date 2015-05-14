mkdir -p address
s3cmd sync s3://chomsonforms/address address
find address/ -type f | xargs jq -r '[.name,.plusname,.addressline1,.addressline2,.city,.state,.zip] | @csv'
