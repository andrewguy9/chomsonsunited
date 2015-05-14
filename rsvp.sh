mkdir -p rsvp
s3cmd sync s3://chomsonforms/rsvp rsvp
find rsvp/ -type f | xargs jq -r '.'
