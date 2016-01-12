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

sysctl="/sbin/sysctl"
file_sysctl="/etc/sysctl.conf"
file_network="/etc/sysconfig/network"
file_ipv6="/etc/modprobe.d/ipv6.conf"

echo "Creating security copies of $file_network"

if [ -f $file_network.original ]
		then
			echo "The file already exists"
		else
			cp $file_network{,.original}
			echo "Created file"
	fi

echo "##############################################"
echo "###         Configure IPv6                 ###"
echo "##############################################"
echo "" >> $file_sysctl
echo "##############################################" >> $file_sysctl
echo "###         Configure IPv6                 ###" >> $file_sysctl
echo "##############################################" >> $file_sysctl

echo ">> Disable IPv6 Router Advertisements"

valida_sysctl1=`$sysctl net.ipv6.conf.all.accept_ra | awk '{print $3}'`
valida_sysctl2=`$sysctl net.ipv6.conf.default.accept_ra | awk '{print $3}'`
par_sysctl1="net.ipv6.conf.all.accept_ra = 0"
par_sysctl2="net.ipv6.conf.default.accept_ra = 0"
	if test $valida_sysctl1 = 0
		then
			echo "- The '$par_sysctl1' was enabled"
		else
			echo "- The parameter '$par_sysctl1' configured in sysctl.conf"
			echo "#Disable IPv6 Router Advertisements" >> $file_sysctl
			echo $par_sysctl1 >> $file_sysctl
	fi

	if test $valida_sysctl2 = 0
		then
			echo "- The '$par_sysctl2' was enabled"
		else
			echo "- The parameter '$par_sysctl2' configured in sysctl.conf"
			echo $par_sysctl2 >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Disable IPv6 Redirect Acceptance"

valida_sysctl1=`$sysctl net.ipv6.conf.all.accept_redirects | awk '{print $3}'`
valida_sysctl2=`$sysctl net.ipv6.conf.default.accept_redirects | awk '{print $3}'`
par_sysctl1="net.ipv6.conf.all.accept_redirects = 0"
par_sysctl2="net.ipv6.conf.default.accept_redirects = 0"
	if test $valida_sysctl1 = 0
		then
			echo "- The '$par_sysctl1' was enabled"
		else
			echo "- The parameter '$par_sysctl1' configured in sysctl.conf"
			echo "#Disable IPv6 Redirect Acceptance" >> $file_sysctl
			echo $par_sysctl1 >> $file_sysctl
	fi

	if test $valida_sysctl2 = 0
		then
			echo "- The '$par_sysctl2' was enabled"
		else
			echo "- The parameter '$par_sysctl2' configured in sysctl.conf"
			echo $par_sysctl2 >> $file_sysctl
			echo "" >> $file_sysctl
	fi

$sysctl -w net.ipv6.route.flush=1 > /dev/null
$sysctl -p > /dev/null

echo "##############################################"
echo "###         Disable IPv6                   ###"
echo "##############################################"
echo "" >> $file_network
echo "##############################################" >> $file_network
echo "###         Disable IPv6                   ###" >> $file_network
echo "##############################################" >> $file_network

grep NETWORKING_IPV6 $file_network >> /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			echo "NETWORKING_IPV6=no" >> $file_network
			echo "- The parameter fixed"
	fi

grep IPV6INIT $file_network >> /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			echo "IPV6INIT=no" >> $file_network
			echo "- The parameter fixed"
	fi
echo "##############################################" >> $file_ipv6
echo "###         Disable IPv6                   ###" >> $file_ipv6
echo "##############################################" >> $file_ipv6
grep ipv6 $file_ipv6 >> /dev/null
parameter=`echo $?`
	if test $parameter = 0
		then
			echo "- The parameter correct"
		else
			echo "options ipv6 disable=1" >> $file_ipv6
			echo "- The parameter fixed"
	fi
