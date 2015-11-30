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

nfs="nfs-utils"
cups="cups"
ip6tables="iptables-ipv6"
echo "################################################################"
echo "###         Disable services                              ######"
echo "################################################################"

yum info ${nfs} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 0
                then
                    echo "Disabling NFS"
                    chkconfig nfslock off 2> /dev/null
                    chkconfig rpcgssd off 2> /dev/null
                    chkconfig rpcbind off 2> /dev/null
                    chkconfig rpcidmapd off 2> /dev/null
                    chkconfig rpcsvcgssd off 2> /dev/null
            fi

yum info ${ip6tables} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 0
                then
                    echo "Disabling firewall IPv6"
                    chkconfig ip6tables off 2> /dev/null
            fi

yum info ${cups} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 0
                then
                   echo "Disabling CUPS"
                   chkconfig cups off 2> /dev/null
            fi

