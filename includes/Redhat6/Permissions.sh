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

issue_net="/etc/issue.net"
issue="/etc/issue"
motd="/etc/motd"



echo "##############################################"
echo "###     Verifiy Permissions                ###"
echo "##############################################"
##############################################
###     Configure cron and anacron          ##
##############################################

echo "Set User/Group Owner and Permission on /etc/anacrontab"

stat -L -c "%a %u %g" /etc/anacrontab | egrep ".00 0 0" > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root /etc/anacrontab
			chmod og-rwx /etc/anacrontab
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Owner and Permission on /etc/crontab"

stat -L -c "%a %u %g" /etc/crontab | egrep ".00 0 0" > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root /etc/crontab
			chmod og-rwx /etc/crontab
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Owner and Permission on /etc/cron.hourly"

stat -L -c "%a %u %g" /etc/cron.hourly | egrep ".00 0 0" > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root /etc/cron.hourly
			chmod og-rwx /etc/cron.hourly
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Owner and Permission on /etc/cron.daily"

stat -L -c "%a %u %g" /etc/cron.daily | egrep ".00 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root /etc/cron.daily
			chmod og-rwx /etc/cron.daily
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Owner and Permission on /etc/cron.weekly"

stat -L -c "%a %u %g" /etc/cron.weekly | egrep ".00 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root /etc/cron.weekly
			chmod og-rwx /etc/cron.weekly
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Owner and Permission on /etc/cron.monthly"

stat -L -c "%a %u %g" /etc/cron.monthly | egrep ".00 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root /etc/cron.monthly
			chmod og-rwx /etc/cron.monthly
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Owner and Permission on /etc/cron.d"

stat -L -c "%a %u %g" /etc/cron.d | egrep ".00 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root /etc/cron.d
			chmod og-rwx /etc/cron.d
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

##############################################
###     Configure password files            ##
##############################################

echo "Permissions on /etc/passwd"
dir="/etc/passwd"
/bin/chmod 644 $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


echo "Permissions on /etc/shadow"
dir="/etc/shadow"
/bin/chmod 000 $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


echo "Permissions on /etc/gshadow"
dir="/etc/gshadow"
/bin/chmod 000 $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


echo "Permissions on /etc/group"
dir="/etc/group"
/bin/chmod 644 $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


echo "Set User/Group Ownership on /etc/passwd"
dir="/etc/passwd"
/bin/chown root:root $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


echo "Set User/Group Ownership on /etc/shadow"
dir="/etc/shadow"
/bin/chown root:root $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


echo "Set User/Group Ownership on /etc/gshadow"
dir="/etc/gshadow"
/bin/chown root:root $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


echo "Set User/Group Ownership on /etc/group"
dir="/etc/group"
/bin/chown root:root $dir
ls -l $dir | awk '{print $1, $3, $4, $9}' > /dev/null


##############################################
###     Configure password files            ##
##############################################

echo "Set User/Group Ownership on $motd"

stat -L -c "%a %u %g" $motd | egrep ".44 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root $motd
			chmod 644 $motd
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Ownership on $issue"

stat -L -c "%a %u %g" $issue | egrep ".44 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root $issue
			chmod 644 $issue
			echo "Permissions wrong, but it was corrected"
	fi

echo ""

echo "Set User/Group Ownership on $issue_net"

stat -L -c "%a %u %g" $issue_net | egrep ".44 0 0"  > /dev/null
permission=`echo $?`
	if test $permission = 0
		then
			echo "Permissions OK"
		else
			chown root:root $issue_net
			chmod 644 $issue_net
			echo "Permissions wrong, but it was corrected"
	fi

echo ""