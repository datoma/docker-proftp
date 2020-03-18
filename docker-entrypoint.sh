#!/bin/bash
# Attention: dont use ":" or ";" in password or username

if [ -n "$FTP_LIST" ]; then
	IFS=';' read -r -a parsed_ftp_list <<< "$FTP_LIST" ; unset IFS
	for ftp_account in ${parsed_ftp_list[@]}
	do
		IFS=':' read -r -a tab <<< "$ftp_account" ; unset IFS
		ftp_login=${tab[0]}
		ftp_pass=${tab[1]}
		mkdir /home/$ftp_login
                addgroup -S $ftp_login
                adduser -S $ftp_login -G $ftp_login -h /home/$ftp_login -s /bin/sh
		echo $ftp_login:$ftp_pass | chpasswd
		chown -R $ftp_login:$ftp_login /home/$ftp_login
	done
fi

exec "$@"
