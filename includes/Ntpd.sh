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
echo "###       Configure NTPD                   ###"
echo "##############################################"
echo ""

file_ntpd="/etc/cron.d/ntpdate"

grep "/usr/sbin/ntpdate a.ntp.br 1" $file_ntpd > /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			echo "*/5 * * * * root /usr/sbin/ntpdate a.ntp.br 1> /dev/null 2> /dev/null" > $file_ntpd
			echo "The parameter fixed"
	fi
  