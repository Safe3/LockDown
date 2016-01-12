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
echo "##############################################"
echo "###     User Accounts and Environment      ###"
echo "##############################################"
echo "Disable System Accounts"
for user in `awk -F: '($3 < 500) {print $1 }' /etc/passwd`; do
	if [ $user != "root" ]
		then
			/usr/sbin/usermod -L $user 2> /dev/null
			if [ $user != "sync" ] && [ $user != "shutdown" ] && [ $user != "halt" ]
				then
					/usr/sbin/usermod -s /sbin/nologin $user 2> /dev/null
			fi
	fi
done

echo "Ensure Password Fields are Not Empty"
for user in `/bin/cat /etc/shadow | /bin/awk -F: '($2 == "" ) { print $1 " does not have a password "}'`; do
	/usr/bin/passwd -l $user 2> /dev/null
done
	
echo "Set Default umask for Users"

grep "^umask 077" /etc/bashrc > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "The parameter correct"
		else
			sed -i 's/umask 022/umask 077/g' /etc/bashrc
			sed -i 's/umask 002/umask 077/g' /etc/bashrc
			echo "The parameter fixed"
	fi

grep "^umask 077" /etc/profile > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "The parameter correct"
		else
			sed -i 's/umask 022/umask 077/g' /etc/profile
            sed -i 's/umask 002/umask 077/g' /etc/profile
            echo "The parameter fixed"
	fi

echo "Set Default Group for root Account"

grep "^root:" /etc/passwd | cut -f4 -d: > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "The parameter correct"
		else
			usermod -g 0 root
            echo "The parameter fixed"
	fi

echo "Lock Inactive User Accounts"

useradd -D -f 35 > /dev/null

echo "Set Warning Banner for Standard Login Services"
echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue
echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net
echo "Authorized uses only. All activity may be monitored and reported." > /etc/motd
