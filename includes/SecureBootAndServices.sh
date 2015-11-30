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

file_grub="/etc/grub.conf"
file_init="/etc/sysconfig/init"

echo "Creating security copies of $file_init"

if [ -f $file_init.original ]
		then
			echo "The file already exists"
		else
			cp $file_init{,.original}
			echo "Created file"
	fi

echo ""

echo "##############################################"
echo "###         Secure Boot Settings           ###"
echo "##############################################"

echo "Set User/Group Owner on /etc/grub.conf"
stat -L -c "%u %g" /etc/grub.conf | egrep "0 0" > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permission OK"
		else
			chown root:root /etc/grub.conf
			echo "Permissions wrong, but it was corrected"
	fi

echo ""
echo "Set Permissions on /etc/grub.conf"
stat -L -c "%a" /etc/grub.conf | egrep ".00" > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permission OK"
		else
			chmod og-rwx /etc/grub.conf
			echo "Permissions wrong, but it was corrected"
	fi

echo "" >> $file_init
echo "##############################################" >> $file_init
echo "###       Security Changes                 ###" >> $file_init
echo "##############################################" >> $file_init
echo ""
echo ">> Require Authentication for Single-User Mode"

grep "SINGLE=/sbin/sulogin" $file_init > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i 's\SINGLE=/sbin/sushell\#SINGLE=/sbin/sushell\g' $file_init
			echo "#Require Authentication for Single-User Mode" >> $file_init 
			echo "SINGLE=/sbin/sulogin" >> $file_init
			echo "- The parameter fixed"
	fi

echo ">> Disable Interactive Boot"

grep "PROMPT=no" $file_init > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i 's/PROMPT=yes/#PROMPT=yes/g' $file_init
			echo "#Disable Interactive Boot" >> $file_init 
			echo "PROMPT=no" >> $file_init
			echo "- The parameter fixed"
	fi

echo ">> Set Daemon umask"

grep "umask 027" $file_init > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			echo "#Set Daemon umask" >> $file_init 
			echo "umask 027" >> $file_init
			echo "- The parameter fixed"
	fi
