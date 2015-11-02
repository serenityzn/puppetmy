#! /bin/bash

function err_check {
 if [ "$1" == 0 ]
 then
	echo -e "\e[34m"$2" -  \e[32mOK\e[0m"
 else
	echo -e "\e[1m\e[31m"$2" FAIL\e[0m"
	exit 1
 fi
}

function clean {
	c_dir="/etc/openvpn/easy-rsa/keys"
	rm -rf $c_dir/*.pem
}


function main {
 name=$1
 certdir="/etc/openvpn/"

 openssl req -new -nodes -config openssl.cnf -keyout $name.key -out $name.csr  -subj "/C=UA/ST=UA/L=Kyiv/O=Kyiv/OU=UkraineVPN/CN=$name/emailAddress=zn@example.com" > /dev/null 2>&1
 err_check $? "Generating cert for $name"
 openssl rand -hex 12 >serial
 openssl ca -batch -config openssl.cnf -out $name.crt -in $name.csr > /dev/null 2>&1
 err_check $? "Signing $name cert"

 mkdir $certdir$name
 err_check $? "Creating dir for $name"
 cp -r $name.* $certdir$name
 err_check $? "Copying certs for $name into $certdir$name"
 cp ca.crt $certdir$name
 err_check $? "Copying ca cert to $certdir$name"
 cp template.conf $certdir$name"/"$name".conf"
 sed -i 's/{name}/'$name'/g' $certdir$name"/"$name".conf"
 err_check $? "Creating openvpn config for $name"
 tar cfvz $certdir$name".tar.gz" $certdir$name > /dev/null 2>&1
 err_check $? "Creating tar gz file for  $name"
 rm -rf $certdir$name
 echo -e "\e[34m\e[1mCerts location is: \e[36m$certdir$name.tar.gz\e[0m"
 clean
}


if [ -n "$1" ]
then
 LOCK="/tmp/gencrt.lock"
 if [ -f $LOCK ]
 then
	echo -e "\e[1m\e[31mScript already in progress. (Lock file exist)\e[0m"
	exit 1
 else
	touch $LOCK
 	main $1
	rm -f $LOCK
 fi
else
 echo  -e "\e[1m\e[31m\e[5mERROR!\e[0m"
 echo -e "\e[34m You need to specify cert name. \e[0m\e[95m[ EXAMPLE: ./generate_client_cert.sh exampleclient ]\e[0m"
 exit 1
fi
