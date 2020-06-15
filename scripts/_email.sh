#########################################
#!/bin/bash
# script /etc/bacula/script/_email.sh
#!/bin/bash

# Configurção das variáveis
USERNAME="olucasrabello@gmail.com" # <= coloque seu usuário do gmail
USERPWD="luanamuitolinda1" # <= coloque sua senha do gmail
MAILFROM="Bacula <$USERNAME>"
SMTPADDRESS="smtp.gmail.com:587"
TLSOPTIONS="tls=auto"
VERBOSE=0 # altere para 1 p/ habilitar o debug
SUBJECT=$1
MAILTO=`echo $2 | sed -e 's/ / -t /g'`
MESSAGEBODY=$3

if [ $VERBOSE -eq 0 ]; then
   VERBOSE="-q"
else
   VERBOSE="-v"
fi

#Envia o email
/usr/local/bin/sendEmail.pl -f "$MAILFROM" -t $MAILTO -u $SUBJECT -m $MESSAGEBODY -xu $USERNAME -xp $USERPWD -s $SMTPADDRESS -o $TLSOPTIONS $VERBOSE
#########################################
