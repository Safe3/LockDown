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

file_limits="/etc/security/limits.conf"
file_init_reboot="/etc/init/control-alt-delete.conf"

echo "##############################################"
echo "###     Additional Process Hardening       ###"
echo "##############################################"

echo "Create a copy of file"

	if [ -f $file_limits.original ]
		then
			echo "The file already exists"
		else
			cp $file_limits{,.original}
			echo "Created file"
	fi

	if [ -f $file_init_reboot.original ]
		then
			echo "The file already exists"
		else
			cp $file_init_reboot{,.original}
			echo "Created file"
	fi


echo "##############################################" >> $file_limits
echo "###      Security Changes           ###" >> $file_limits
echo "##############################################" >> $file_limits
echo ""


echo "Restrict Core Dumps"

grep "hard core" $file_limits > /dev/null
valida_limits=`echo $?`
par_limits="hard core 0"

	if test $valida_limits = 0
		then
			echo "The parameter is already set"
		else
			echo "The parameter '$par_limits' configured in limits.conf"
			echo $par_limits >> $file_limits
	fi

echo "Disable Reboot Using ctrl-alt-del-keys"

sed -i 's#/sbin/shutdown -r now#/usr/bin/logger -p authpriv.notice -t init#g' $file_init_reboot

 