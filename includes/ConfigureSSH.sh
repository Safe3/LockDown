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

file_sshd="/etc/ssh/sshd_config"

echo "##############################################"
echo "###            Configure SSH               ###"
echo "##############################################"
echo "Creating security copies of sshd_config"

if [ -f $file_sshd.original ]
		then
			echo "The file already exists"
		else
			cp $file_sshd{,.original}
			echo "Created file"
	fi

echo ""
echo "##############################################" >> $file_sshd
echo "###       Security Changes                 ###" >> $file_sshd
echo "##############################################" >> $file_sshd
echo ""
echo ">> Set LogLevel to INFO"

grep "^LogLevel" $file_sshd > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			echo "#Set LogLevel to INFO" >> $file_sshd
			echo "LogLevel INFO" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ""
echo ">> Disable SSH X11 Forwarding"

grep "^X11Forwarding yes" $file_sshd > /dev/null
parameter=`echo $?`
	if test $parameter = 1
		then
			echo "- The parameter correct"
		else
			sed -i 's/X11Forwarding yes/#X11Forwarding yes/g' $file_sshd
			echo "#Disable SSH X11 Forwarding" >> $file_sshd
			echo "X11Forwarding no" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ""
echo ">> Disable SSH Password authentication"

grep "^PasswordAuthentication yes" $file_sshd > /dev/null
parameter=`echo $?`
	if test $parameter = 1
		then
			echo "- The parameter correct"
		else
			sed -i 's/PasswordAuthentication yes/#PasswordAuthentication yes/g' $file_sshd
			echo "#Disable SSH Password authentication" >> $file_sshd
			echo "PasswordAuthentication no" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ""
echo ">> Disable SSH Root Login"

grep "^PermitRootLogin yes" $file_sshd > /dev/null
parameter=`echo $?`
	if test $parameter = 1
		then
			echo "- The parameter correct"
		else
			sed -i 's/PermitRootLogin yes/#PermitRootLogin yes/g' $file_sshd
			echo "#Disable SSH Root Login" >> $file_sshd 
			echo "PermitRootLogin no" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ">> Disable rhosts"

grep "^IgnoreRhosts yes" $file_sshd > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i 's/IgnoreRhosts no/#PermitRootLogin no/g' $file_sshd
			echo "#Disable rhosts" >> $file_sshd 
			echo "IgnoreRhosts yes" >> $file_sshd
			echo "- The parameter fixed"
fi

echo ""
echo ">> Prevent the use of insecure home directory and key file permissions"

grep "^StrictModes yes" $file_sshd > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i 's/StrictModes no/#StrictModes no/g' $file_sshd
			echo "#Prevent the use of insecure home directory and key file permissions" >> $file_sshd 
			echo "StrictModes yes" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ""
echo ">> Turn on privilege separation"

grep "^UsePrivilegeSeparation yes" $file_sshd > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i 's/UsePrivilegeSeparation no/#UsePrivilegeSeparation no/g' $file_sshd
			echo "#Turn on privilege separation" >> $file_sshd 
			echo "UsePrivilegeSeparation yes" >> $file_sshd
			echo "- The parameter fixed"
	fi
				
echo ""
echo ">> Disable Empty Passwords"

grep "^PermitEmptyPasswords no" $file_sshd > /dev/null
parameter=`echo $?`
if test $parameter = 0
	then
		echo "- The parameter correct"
	else
		sed -i 's/PermitEmptyPasswords yes/#PermitEmptyPasswords yes/g' $file_sshd
		echo "#Disable Empty Passwords" >> $file_sshd 
		echo "PermitEmptyPasswords no" >> $file_sshd
		echo "- The parameter fixed"
	fi
			
echo ""
echo "#Configure Idle Log Out Timeout Interval"

grep "^ClientAliveInterval" $file_sshd > /dev/null
parameter=`echo $?`
if test $parameter = 1
	then
		echo "- The parameter correct"
	else
		echo "#Configure Idle Log Out Timeout Interval" >> $file_sshd 
		echo "ClientAliveInterval 300" >> $file_sshd
		echo "ClientAliveCountMax 0" >> $file_sshd
		echo "- The parameter fixed"
fi

echo ""
echo ">> Set SSH MaxAuthTries to 4 or Less"

grep "^MaxAuthTries 4" $file_sshd > /dev/null

parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			echo "#Set SSH MaxAuthTries to 4 or Less" >> $file_sshd
			echo "MaxAuthTries 4" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ""
echo ">> Set SSH HostbasedAuthentication to No"

grep "^HostbasedAuthentication no" $file_sshd > /dev/null

parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i 's/HostbasedAuthentication yes/#HostbasedAuthentication yes/g' $file_sshd
			echo "#Set SSH HostbasedAuthentication to No" >> $file_sshd
			echo "HostbasedAuthentication no" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ""
echo ">> Do Not Allow Users to Set Environment Options"

grep "^PermitUserEnvironment no" $file_sshd > /dev/null

parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			sed -i 's/PermitUserEnvironment yes/#PermitUserEnvironmen tyes/g' $file_sshd
			echo "#Do Not Allow Users to Set Environment Options" >> $file_sshd
			echo "PermitUserEnvironment no" >> $file_sshd
			echo "- The parameter fixed"
	fi

echo ">> Set Permissions on '$file_sshd'"

stat -L -c "%a %u %g" $file_sshd | egrep ".00 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "- Permissions OK"
		else
			chown root:root $file_sshd
			chmod 600 $file_sshd
			echo "- Permissions wrong, but it was corrected"
	fi

echo ""

echo "Reload service SSH"
/etc/init.d/sshd reload