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
########################################
###				Variables			 ###
########################################

file_pam_passwd="/etc/pam.d/password-auth"
file_pam_system="/etc/pam.d/system-auth"
file_pam_su="/etc/pam.d/su"
verify_auth=`grep "^auth" /etc/pam.d/password-auth | tail -1`
verify_auth1=`grep "auth" /etc/pam.d/su | tail -1`
verify_auth3=`grep "^auth" /etc/pam.d/system-auth | tail -1`
verify_passwd=`grep "^password" /etc/pam.d/system-auth | tail -1`


echo "################################################################"
echo "###         Pam configuration		        ######"
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

echo ">> Limit Password Reuse"

grep "remember" $file_pam_system > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i "/${verify_passwd}/a password    sufficient    pam_unix.so remember=5" $file_pam_system
			echo "The parameter fixed"
	fi

echo ">> Set Password Creation Requirement Parameters"

grep "pam_cracklib.so" $file_pam_system > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i "/${verify_passwd}/a password required pam_cracklib.so try_first_pass retry=3 minlen=14 dcredit=-1 ucredit=-1 ocredit=-1 lcredit=-1" $file_pam_system
			echo "The parameter fixed"
	fi


echo ">> Set Lockout for Failed Password Attempts"

grep "pam_faillock" $file_pam_passwd > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i "/${verify_auth}/a auth        required       pam_faillock.so preauth audit silent deny=5 unlock_time=900" $file_pam_passwd
			sed -i "/${verify_auth}/a auth        [default=die]  pam_faillock.so authfail audit deny=5 unlock_time=900" $file_pam_passwd
			sed -i "/${verify_auth}/a auth        sufficient     pam_faillock.so authsucc audit deny=5 unlock_time=900" $file_pam_passwd
			echo "- The parameter fixed"
	fi
grep "pam_unix.so" $file_pam_passwd | grep success=1 > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i "/${verify_auth}/a auth        [success=1     default=bad] pam_unix.so" $file_pam_passwd
			echo "- The parameter fixed"
	fi

grep "pam_faillock" $file_pam_system > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i "/${verify_auth3}/a auth        required      pam_faillock.so preauth audit silent deny=5 unlock_time=900" $file_pam_system
			sed -i "/${verify_auth3}/a auth        [default=die] pam_faillock.so authfail audit deny=5 unlock_time=900" $file_pam_system
			sed -i "/${verify_auth3}/a auth        sufficient    pam_faillock.so authsucc audit deny=5 unlock_time=900" $file_pam_system
			echo "- The parameter fixed"
	fi
grep "pam_unix.so" $file_pam_system | grep success=1 > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i "/${verify_auth}/a auth        [success=1    default=bad] pam_unix.so" $file_pam_system
			echo "- The parameter fixed"
	fi

echo ""
echo ">> Restrict Access to the su Command"

grep -E pam_wheel.so $file_pam_su | grep -E "^auth" > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i "/${verify_auth1}/a auth            required        pam_wheel.so use_uid" $file_pam_su
			echo "- The parameter fixed"
	fi