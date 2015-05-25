#!/bin/bash

eval "$(docopts -V - -h - : "$@" <<EOF
remove

Find and remove a set of keys from S3.

usage:
  remove.sh [options] --search=<token>
  remove.sh [options] --remove=<token>

Options:
  -h --help      Show this screen.
  --version      Show version.
  --sync         Perform a sync before running.
----
ismerged 0.1.0
Copyright (C) 2015 Andrew Thomson
License MIT
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
EOF
)"

if "$sync"
then
  echo "Syncing database..."
  rm -rf rsvp
  mkdir -p rsvp
  s3cmd sync s3://chomsonforms/rsvp rsvp > /dev/null
  echo "done"
fi

if [ ! -z "$search" ]
then
  grep -ril "$search" rsvp/rsvp |  xargs -n1 -I {} -- jq . {}
elif [ ! -z "$remove" ]
then
  grep -ril "$remove" rsvp/rsvp | perl -pe 's/^rsvp\/rsvp\//rsvp\//' |  xargs -n1 -I {} -- s3cmd del s3://chomsonforms/{}
fi
