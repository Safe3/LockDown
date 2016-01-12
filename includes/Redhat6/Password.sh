#################################################################################
#
#   Lockdown
# ------------------
# 
#
# Lockdown is a system for applied security baseline controls.
# In Free version, the system apply security baseline on S.O.
# In Enterprise version, the system apply security baselise on S.O and Applicationss
#
# Copyright 2015 Junior Carreiro
# mail: w.carreirojunior@protonmail.com
#
#################################################################################
echo "################################################################"
echo "###         Password configuration		        ######"
echo "################################################################"
echo ""

echo "Upgrade Password Hashing Algorithm to SHA-512s"

authconfig --test | grep hashing | grep sha512 > /dev/null

parameter=`echo $?`
	if test $parameter = 0
		then
			echo "The parameter correct"
		else
			authconfig --passalgo=sha512 --update
			echo "The parameter fixed"
	fi

	echo ""

	echo "##############################################" >> /etc/pam.d/system-auth
	echo "###       Security Changes          ###" >> /etc/pam.d/system-auth
	echo "##############################################" >> /etc/pam.d/system-auth
	

	echo "Limit Password Reuse"
	
	grep "remember" /etc/pam.d/system-auth > /dev/null

	parameter=`echo $?`
		if test $parameter = 0
			then
				echo "The parameter correct"
			else
				echo "#Limit Password Reuse" >> /etc/pam.d/system-auth
				echo "password    sufficient    pam_unix.so remember=5" >> /etc/pam.d/system-auth
				echo "The parameter fixed"
		fi


