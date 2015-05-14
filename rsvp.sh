mkdir -p rsvp
s3cmd sync s3://chomsonforms/rsvp rsvp
find rsvp/ -type f | xargs jq -r 'select(.attending=="true")|.names[]' | sort > attending.txt
find rsvp/ -type f | xargs jq -r 'select(.attending=="false")|.names[]' | sort > notattending.txt
find rsvp/ -type f | xargs jq -r 'select(.attending=="true"and.diet_restrictions!="")|{"names":.names,"diet":.diet_restrictions}' > diet.txt
