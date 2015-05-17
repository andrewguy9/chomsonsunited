#!/bin/bash

pushd ../site
s3cmd -f -P -F --cf-invalidate --cf-invalidate-default-index sync * s3://chomsonsunited
popd
repeat --until-success --period 30 -- ./cfdone.sh
