#!/bin/sh

counter=0;
while read line; do
	counter=$(($counter+1));
	row=$(cat adresser.csv | awk -v FS='\n' '{ print $1 }' | head -$counter | tail -n 1);
	name=$(echo $row | cut -f1 -d":");
	address=$(echo $row | cut -f2 -d":");

	mailbody=$(cat brev/brev.txt);
	mailbody=$(echo $mailbody | sed "s/=mottager=/$name/g");
	mailbody=$(echo $mailbody | sed "s/=meg=/Phishermann/g");

	echo $mailbody | mutt -s "oblig2" $address -a brev/vedlegg/bilde*;
done < adresser.csv
echo "E-post(er) har blitt sendt";
