#!/bin/bash

DATA_BASE=~/nutshell
CNN_FILE=${DATA_BASE}/cnn.rss.titles

mkdir -p ~/nutshell
NOW=$(date +"%s")

curl -s "http://rss.cnn.com/rss/edition.rss" \
    | xmllint --xpath '//rss/channel/item/title' - \
    | sed -e 's/></>\n</g' \
    > ${CNN_FILE}


cnnNeg=$(egrep " flu| death| kill| war| rape| murder" ${CNN_FILE} | wc -l)
cnnPos=$(egrep " art| love| peace| fun" ${CNN_FILE} | wc -l)

echo ${NOW}, CNN, ${cnnNeg}, ${cnnPos} >> ${DATA_BASE}/all.data
