brev:lag_brev.sh brev.docx
	./lag_brev.sh

adresser:hent_adresser.sh adresser.xlsx
	./hent_adresser.sh

zip:makefile deltagere.csv typescript tidsfil lag_brev.sh hent_adresser.sh send_e-post.sh adresser.xlsx brev.docx
	mkdir oblig2
	cp deltagere.csv typescript tidsfil lag_brev.sh hent_adresser.sh send_e-post.sh adresser.xlsx brev.docx makefile oblig2/
	tar czvf oblig2-237109.tar.gz oblig2
	rm -rf oblig2

sign:zip
	gpg --output oblig2-237109.tar.gz.gpg --sign oblig2-237109.tar.gz

send:brev adresser send_e-post.sh
	./send_e-post.sh

innlevering:sign

clean:
	rm -rf brev adresser.csv oblig2 oblig2-237109.tar.gz oblig2-237109.tar.gz.gpg

