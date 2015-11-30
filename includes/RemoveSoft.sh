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
echo "###    Remove Unnecessary Software         ###"
echo "##############################################"

##############################################
###    Create a list of the software       ###
###    to be uninstalled within            ###
###	 /tmp/soft.lst         		           ###
##############################################

for soft in $(cat /tmp/soft.lst);
    do
        yum info $soft | grep installed > /dev/null
        install=`echo $?`
            if test $install = 0
                then
                    yum remove $soft -y > /dev/null
                        echo "'$soft' removed"
                else
                    echo "'$soft' not installed"
            fi
done
