#!/bin/bash

SWORD_URL=https://na01.alma.exlibrisgroup.com/sword/TR_INTEGRATION_INST/col/1762816100000561
SWORD_USER=sword
SWORD_PASS=
SWORD_OBO=joshw

curl -H 'Content-Type: multipart/related; boundary=---------------1605871705; type="application/atom+xml"' -H "On-behalf-of: $SWORD_OBO" --data-binary @curl.txt --user $SWORD_USER:$SWORD_PASS $SWORD_URL

