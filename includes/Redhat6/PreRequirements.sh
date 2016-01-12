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
echo "###	Installing Pre Requirements	         ###"
echo "##############################################"

############################################
###             Variables                ###
############################################
rsyslog="rsyslog"
yumpluginsecurity="yum-plugin-security"
yumutils="yum-utils"
ed="ed"
sysstat="sysstat"
tcp_wrappers="tcp_wrappers"
ruby="ruby"
rubygems="rubygems"
gcc_c="gcc-c++"
patch="patch"
readline="readline"
readline_devel="readline-devel"
zlib="zlib"
zlib_devel="zlib-devel"
libyaml_devel="libyaml-devel"
libffi_devel="libffi-devel"
openssl_devel="openssl-devel"
make="make"
bzip2="bzip2"
autoconf="autoconf"
automake="automake"
libtool="libtool"
bison="bison"
iconv_devel="iconv-devel"


########################################
###             Arrays               ###
########################################
Soft=();


#
########################################

echo "Verify the ${rsyslog} package"

yum info ${rsyslog} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${rsyslog}")
                    echo "The ${rsyslog} will be installed"
                else
                    echo "The ${rsyslog} is installed"
            fi
echo ""
echo "Verify the ${yumpluginsecurity}"

yum info ${yumpluginsecurity} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${yumpluginsecurity}")
                    echo "${yumpluginsecurity} will be installed"
                else
                    echo "${yumpluginsecurity} is installed"
            fi
echo ""
echo "Verify the ${yumutils}"

yum info ${yumutils} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("$Soft[@]}" "${yumutils}")
                    echo "${yumutils} will be installed"
                else
                    echo "${yumutils} is installed"
            fi
echo ""
echo "Verify the ${ed}"

yum info ${ed} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${ed}")
                    echo "${ed} will be installed"
                else
                    echo "${ed} is installed"
            fi
echo ""
echo "Verify the ${sysstat}"

yum info ${sysstat} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${sysstat}")
                    echo "${sysstat} will be installed"
                else
                    echo "${sysstat} is installed"
            fi
echo ""

echo "Verify the ${tcp_wrappers}"

yum info ${tcp_wrappers} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${tcp_wrappers}")
                    echo "${tcp_wrappers} will be installed"
                else
                    echo "${tcp_wrappers} is installed"
            fi
echo ""

echo "Verify the ${ruby}"

yum info ${ruby} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${ruby}")
                    echo "${ruby} will be installed"
                else
                    echo "${ruby} is installed"
            fi
echo ""

echo "Verify the ${rubygems}"

yum info ${rubygems} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${rubygems}")
                    echo "${rubygems} will be installed"
                else
                    echo "${rubygems} is installed"
            fi
echo ""

echo "Verify the ${gcc_c}"

yum info ${gcc_c} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${gcc_c}")
                    echo "${gcc_c} will be installed"
                else
                    echo "${gcc_c} is installed"
            fi
echo ""

echo "Verify the ${patch}"

yum info ${patch} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${patch}")
                    echo "${patch} will be installed"
                else
                    echo "${patch} is installed"
            fi
echo ""

echo "Verify the ${readline}"

yum info ${readline} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${readline}")
                    echo "${readline} will be installed"
                else
                    echo "${readline} is installed"
            fi
echo ""

echo "Verify the ${readline_devel}"

yum info ${readline_devel} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${readline_devel}")
                    echo "${readline_devel} will be installed"
                else
                    echo "${readline_devel} is installed"
            fi
echo ""

echo "Verify the ${zlib}"

yum info ${zlib} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${zlib}")
                    echo "${zlib} will be installed"
                else
                    echo "${zlib} is installed"
            fi
echo ""

echo "Verify the ${zlib_devel}"

yum info ${zlib_devel} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${zlib_devel}")
                    echo "${zlib_devel} will be installed"
                else
                    echo "${zlib_devel} is installed"
            fi
echo ""

echo "Verify the ${libyaml_devel}"

yum info ${libyaml_devel} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${libyaml_devel}")
                    echo "${libyaml_devel} will be installed"
                else
                    echo "${libyaml_devel} is installed"
            fi
echo ""

echo "Verify the ${libffi_devel}"

yum info ${libffi_devel} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${libffi_devel}")
                    echo "${libffi_devel} will be installed"
                else
                    echo "${libffi_devel} is installed"
            fi
echo ""

echo "Verify the ${openssl_devel}"

yum info ${openssl_devel} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${openssl_devel}")
                    echo "${openssl_devel} will be installed"
                else
                    echo "${openssl_devel} is installed"
            fi
echo ""

echo "Verify the ${make}"

yum info ${make} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${make}")
                    echo "${make} will be installed"
                else
                    echo "${make} is installed"
            fi
echo ""

echo "Verify the ${bzip2}"

yum info ${bzip2} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${bzip2}")
                    echo "${bzip2} will be installed"
                else
                    echo "${bzip2} is installed"
            fi
echo ""

echo "Verify the ${autoconf}"

yum info ${autoconf} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${autoconf}")
                    echo "${autoconf} will be installed"
                else
                    echo "${autoconf} is installed"
            fi
echo ""

echo "Verify the ${automake}"

yum info ${automake} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${automake}")
                    echo "${automake} will be installed"
                else
                    echo "${automake} is installed"
            fi
echo ""

echo "Verify the ${libtool}"

yum info ${libtool} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${libtool}")
                    echo "${libtool} will be installed"
                else
                    echo "${libtool} is installed"
            fi
echo ""

echo "Verify the ${bison}"

yum info ${bison} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${bison}")
                    echo "${bison} will be installed"
                else
                    echo "${bison} is installed"
            fi
echo ""

echo "Verify the ${iconv_devel}"

yum info ${iconv_devel} | grep installed > /dev/null
        install=`echo $?`
            if test $install = 1
                then
                    Soft=("${Soft[@]}" "${iconv_devel}")
                    echo "${iconv_devel} will be installed"
                else
                    echo "${iconv_devel} is installed"
            fi
echo ""



if [ ${#Soft[@]} -eq 0 ]; then
    echo "No need install"
else
        yum install -y ${Soft[*]}
fi

echo "##############################################"
echo "###   Installing RVM                       ###"
echo "##############################################"

curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh
rvm reload

rvm requirements run

rvm install 2.2.2

rvm use 2.2.2 --default

echo "##############################################"
echo "###   Installing GEMS                      ###"
echo "##############################################"

gem install docopt scriptster progressbar
export RUBYOPT="rubygems"