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

echo "##############################################"
echo "###     Kernel Parameters                  ###"
echo "##############################################"

if [ -f /etc/sysctl.conf.original ]
	then
		echo "The file already exists"
	else
		cp $file_sysctl{,.original}
		echo "Created file"
fi

echo ""
echo "##############################################" >> $file_sysctl
echo "###       Security Changes          		 ###" >> $file_sysctl
echo "##############################################" >> $file_sysctl
echo ""

echo ">> Configuring suid_dumpable"

valida_sysctl=`$sysctl fs.suid_dumpable | awk '{print $3}'`
par_sysctl="fs.suid_dumpable = 0"

    if test $valida_sysctl = 0
    	then
        	echo "- The parameter is already set"
        else
        	echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Configuring suid_dumpable" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo ""
	fi

echo ">> Configure ExecShield"

valida_sysctl=`$sysctl kernel.exec-shield | awk '{print $3}'`
par_sysctl="kernel.exec-shield = 1"

    if test $valida_sysctl = 1
        then
            echo "- The parameter is already set"
        else
            echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Configure ExecShield" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo ""
	fi

echo ">> Enable Randomized Virtual Memory Region Placement"

valida_sysctl=`$sysctl kernel.randomize_va_space | awk '{print $3}'`
par_sysctl="kernel.randomize_va_space = 2"

    if test $valida_sysctl = 2
        then
            echo "- The parameter is already set"
        else
            echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Enable Randomized Virtual Memory Region Placement" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo ""
	fi


echo ">> Disable IP Forwarding"

valida_sysctl=`$sysctl net.ipv4.ip_forward | awk '{print $3}'`
par_sysctl="net.ipv4.ip_forward = 0"
	if test $valida_sysctl = 0
		then
			echo "- IP Forwarding was Disabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Disable IP Forwarding" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi


echo ">> Disable Send Packet Redirects"

valida_sysctl=`$sysctl net.ipv4.conf.all.send_redirects | awk '{print $3}'`
par_sysctl="net.ipv4.conf.all.send_redirects = 0"
	if test $valida_sysctl = 0
		then
			echo "- Send Packet Redirects was Disabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Disable Send Packet Redirects" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Disable Source Routed Packet Acceptance"

valida_sysctl=`$sysctl net.ipv4.conf.all.accept_source_route | awk '{print $3}'`
valida_sysctl1=`$sysctl net.ipv4.conf.default.accept_source_route | awk '{print $3}'`
par_sysctl="net.ipv4.conf.all.accept_source_route = 0"
par_sysctl1="net.ipv4.conf.default.accept_source_route = 0"
	if test $valida_sysctl = 0
		then
			echo "- The '$par_sysctl' was Disabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Disable Source Routed Packet Acceptance" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

	if test $valida_sysctl = 0
		then
			echo "- The '$par_sysctl1' was Disabled"
		else
			echo "- The parameter '$par_sysctl1' configured in sysctl.conf"
			echo "#Disable Source Routed Packet Acceptance" >> $file_sysctl
			echo $par_sysctl1 >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Disable ICMP Redirect Acceptance"

valida_sysctl=`$sysctl net.ipv4.conf.all.accept_redirects | awk '{print $3}'`
valida_sysctl1=`$sysctl net.ipv4.conf.default.accept_redirects | awk '{print $3}'`
par_sysctl="net.ipv4.conf.all.accept_redirects = 0"
par_sysctl1="net.ipv4.conf.default.accept_redirects = 0"
	if test $valida_sysctl = 0
		then
			echo "- The '$par_sysctl' was Disabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Disable ICMP Redirect Acceptance" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

	if test $valida_sysctl1 = 0
		then
			echo "- The '$par_sysctl1' was Disabled"
		else
			echo "- The parameter '$par_sysctl1' configured in sysctl.conf"
			echo "#Disable ICMP Redirect Acceptance" >> $file_sysctl
			echo $par_sysctl1 >> $file_sysctl
			echo "" >> $file_sysctl
	fi


echo ">> Disable Secure ICMP Redirect Acceptance"

valida_sysctl=`$sysctl net.ipv4.conf.all.secure_redirects | awk '{print $3}'`
valida_sysctl1=`$sysctl net.ipv4.conf.all.secure_redirects | awk '{print $3}'`
par_sysctl="net.ipv4.conf.all.secure_redirects = 0"
par_sysctl1="net.ipv4.conf.default.secure_redirects = 0"
	if test $valida_sysctl = 0
		then
			echo "- The '$par_sysctl' was Disabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Disable Secure ICMP Redirect Acceptance" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

	if test $valida_sysctl1 = 0
		then
			echo "- The '$par_sysctl1' was Disabled"
		else
			echo "- The parameter '$par_sysctl1' configured in sysctl.conf"
			echo "#Disable Secure ICMP Redirect Acceptance" >> $file_sysctl
			echo $par_sysctl1 >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Log Suspicious Packets"

valida_sysctl=`$sysctl net.ipv4.conf.all.log_martians | awk '{print $3}'`
valida_sysctl1=`$sysctl net.ipv4.conf.all.log_martians | awk '{print $3}'`
par_sysctl="net.ipv4.conf.all.log_martians = 1"
par_sysctl1="net.ipv4.conf.default.log_martians = 1"
	if test $valida_sysctl = 1
		then
			echo "- The '$par_sysctl' was Disabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Log Suspicious Packets" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

	if test $valida_sysctl1 = 1
		then
			echo "- The '$par_sysctl1' was Disabled"
		else
			echo "- The parameter '$par_sysctl1' configured in sysctl.conf"
			echo "#Log Suspicious Packets" >> $file_sysctl
			echo $par_sysctl1 >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Enable Ignore Broadcast Requests"

valida_sysctl=`$sysctl net.ipv4.icmp_echo_ignore_broadcasts | awk '{print $3}'`
par_sysctl="net.ipv4.icmp_echo_ignore_broadcasts = 1"
	if test $valida_sysctl = 1
		then
			echo "- Ignore Broadcast Requests was Enabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Enable Ignore Broadcast Requests" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Enable Bad Error Message Protection"

valida_sysctl=`$sysctl net.ipv4.icmp_ignore_bogus_error_responses | awk '{print $3}'`
par_sysctl="net.ipv4.icmp_ignore_bogus_error_responses = 1"
	if test $valida_sysctl = 1
		then
			echo "- Bad Error Message Protection was Enabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Enable Bad Error Message Protection" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Enable RFC-recommended Source Route Validation"

valida_sysctl=`$sysctl net.ipv4.conf.all.rp_filter | awk '{print $3}'`
par_sysctl="net.ipv4.conf.all.rp_filter = 1"
par_sysctl1="net.ipv4.conf.default.rp_filter = 1"
	if test $valida_sysctl = 1
		then
			echo "- RFC-recommended Source Route Validation was Enabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "- The parameter '$par_sysctl1' configured in sysctl.conf"
			echo "#Enable RFC-recommended Source Route Validation" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo $par_sysctl1 >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo ">> Enable TCP SYN Cookies"

valida_sysctl=`$sysctl net.ipv4.tcp_syncookies | awk '{print $3}'`
par_sysctl="net.ipv4.tcp_syncookies = 1"
	if test $valida_sysctl = 1
		then
			echo "- Enable TCP SYN Cookies was Enabled"
		else
			echo "- The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Enable TCP SYN Cookies" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
			echo "" >> $file_sysctl
	fi

echo "- Others"

valida_sysctl=`$sysctl net.ipv4.tcp_timestamps | awk '{print $3}'`
par_sysctl="net.ipv4.tcp_timestamps = 0"
	if test $valida_sysctl = 0
		then
			echo "The '$par_sysctl' was enabled"
		else
			echo "The parameter '$par_sysctl' configured in sysctl.conf"
			echo "#Others" >> $file_sysctl
			echo $par_sysctl >> $file_sysctl
	fi

$sysctl -w net.ipv4.route.flush=1 > /dev/null
$sysctl -p > /dev/null
