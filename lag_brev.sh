#!/bin/sh

mkdir -p brev/vedlegg;
unzip -p brev.docx word/document.xml | grep -oP '<w:t>\K[^<>]*(?=</w:t>)' > brev/brev.txt;

mkdir tmpFolder;
unzip -d tmpFolder brev.docx;
count=0;
for FILENAME in tmpFolder/word/media/*.png; do
	count=$((count+1));
	mv $FILENAME brev/vedlegg/bilde$count; 
done;
rm -rf tmpFolder;
