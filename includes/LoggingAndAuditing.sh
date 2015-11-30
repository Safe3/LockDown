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

file_audit="/etc/audit/audit.rules"

echo "##############################################"
echo "###         Logging and Auditing           ###"
echo "##############################################"

echo "Creating security copies of audit.rules"


	if [ -f $file_audit.original ]
		then
			echo "The file already exists"
		else
			cp $file_audit{,.original}
			echo "Created file"
	fi

echo "Enable Auditing for Processes That Start Prior to auditd"

ed /etc/grub.conf << END
g/audit=1/s///g
g/kernel/s/$/ audit=1/
w
q
END


echo "##############################################" >> $file_audit
echo "###       Security Changes          ###" >> $file_audit
echo "##############################################" >> $file_audit
echo ""
echo "Record Events That Modify Date and Time Information"

echo "#Record Events That Modify Date and Time Information" >> $file_audit
echo "-a always,exit -F arch=b64 -S adjtimex -S settimeofday -k time-change" >> $file_audit
echo "-a always,exit -F arch=b32 -S adjtimex -S settimeofday -S stime -k time-change" >> $file_audit
echo "-a always,exit -F arch=b64 -S clock_settime -k time-change" >> $file_audit
echo "-a always,exit -F arch=b32 -S clock_settime -k time-change" >> $file_audit
echo "-w /etc/localtime -p wa -k time-change" >> $file_audit
echo "" >> $file_audit

echo "Record Events That Modify User/Group Information"

echo "#Record Events That Modify User/Group Information" >> $file_audit
echo "-w /etc/group -p wa -k identity" >> $file_audit
echo "-w /etc/passwd -p wa -k identity" >> $file_audit
echo "-w /etc/gshadow -p wa -k identity" >> $file_audit
echo "-w /etc/shadow -p wa -k identity" >> $file_audit
echo "-w /etc/security/opasswd -p wa -k identity" >> $file_audit
echo "" >> $file_audit

echo "Record Events That Modify the System's Network Environment"

echo "#Record Events That Modify the System's Network Environment" >> $file_audit
echo "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale" >> $file_audit
echo "-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale" >> $file_audit
echo "-w /etc/issue -p wa -k system-locale" >> $file_audit
echo "-w /etc/issue.net -p wa -k system-locale" >> $file_audit
echo "-w /etc/hosts -p wa -k system-locale" >> $file_audit
echo "-w /etc/sysconfig/network -p wa -k system-locale " >> $file_audit
echo "" >> $file_audit

echo "Record Events That Modify the System's Mandatory Access Controls"

echo "#Record Events That Modify the System's Mandatory Access Controls" >> $file_audit
echo "-w /etc/selinux/ -p wa -k MAC-policy" >> $file_audit
echo "" >> $file_audit

echo "Collect Login and Logout Events"

echo "#Collect Login and Logout Events" >> $file_audit
echo "-w /var/log/faillog -p wa -k logins" >> $file_audit
echo "-w /var/log/lastlog -p wa -k logins" >> $file_audit
echo "-w /var/log/tallylog -p wa -k logins" >> $file_audit
echo "" >> $file_audit

echo "Collect Session Initiation Information"

echo "#Collect Session Initiation Information" >> $file_audit
echo "-w /var/run/utmp -p wa -k session"  >> $file_audit
echo "-w /var/log/wtmp -p wa -k " >> $file_audit
echo "-w /var/log/btmp -p wa -k session" >> $file_audit
echo "" >> $file_audit

echo "Collect Discretionary Access Control Permission Modification Events"

echo "#Collect Discretionary Access Control Permission Modification Events" >> $file_audit
echo "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod" >> $file_audit
echo "-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=500 -F auid!=4294967295 -k perm_mod" >> $file_audit
echo "-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod" >> $file_audit
echo "-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=500 -F auid!=4294967295 -k perm_mod" >> $file_audit
echo "-a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod" >> $file_audit
echo "-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=500 -F auid!=4294967295 -k perm_mod" >> $file_audit
echo "" >> $file_audit

echo "Collect Unsuccessful Unauthorized Access Attempts to Files"

echo "#Collect Unsuccessful Unauthorized Access Attempts to Files" >> $file_audit
echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access" >> $file_audit
echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access" >> $file_audit
echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access" >> $file_audit
echo "-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access" >> $file_audit
echo "" >> $file_audit

echo "Collect Use of Privileged Commands"

echo "#Collect Use of Privileged Commands" >> $file_audit
echo "find PART -xdev \( -perm -4000 -o -perm -2000 \) -type f | awk '{print \""-a always,exit -F path=\"" \$1 \"" -F perm=x -F "auid>=500" -F auid!=4294967295 -k privileged\"" }'" >> $file_audit
echo "" >> $file_audit

echo "Collect Successful File System Mounts"

echo "#Collect Successful File System Mounts" >> $file_audit
echo "-a always,exit -F arch=b64 -S mount -F auid>=500 -F auid!=4294967295 -k mounts" >> $file_audit
echo "-a always,exit -F arch=b32 -S mount -F auid>=500 -F auid!=4294967295 -k mounts" >> $file_audit
echo "" >> $file_audit

echo "Collect File Deletion Events by User"

echo "#Collect File Deletion Events by User" >> $file_audit
echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete" >> $file_audit
echo "-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete" >> $file_audit
echo "" >> $file_audit

echo "Collect Changes to System Administration Scope"

echo "#Collect Changes to System Administration Scope" >> $file_audit
echo "-w /etc/sudoers -p wa -k scope" >> $file_audit
echo "" >> $file_audit

echo "Collect System Administrator Actions"

echo "#Collect System Administrator Actions" >> $file_audit
echo "-w /var/log/sudo.log -p wa -k actions" >> $file_audit
echo "" >> $file_audit

echo "Collect Kernel Module Loading and Unloading"

echo "#Collect Kernel Module Loading and Unloading" >> $file_audit
echo "-w /sbin/insmod -p x -k modules" >> $file_audit
echo "-w /sbin/rmmod -p x -k modules" >> $file_audit
echo "-w /sbin/modprobe -p x -k modules" >> $file_audit
echo "-a always,exit -F arch=b64 -S init_module -S delete_module -k modules" >> $file_audit
echo "" >> $file_audit

echo "#Audit the audit logs" >> $file_audit

echo "-w /var/log/audit/ -k auditlog" >> $file_audit
echo "" >> $file_audit

echo "# Modifications to audit configuration that occur while the audit (check your paths)" >> $file_audit

echo "-w /etc/audit/ -p wa -k auditconfig" >> $file_audit
echo "-w /etc/libaudit.conf -p wa -k auditconfig" >> $file_audit
echo "-w /etc/audisp/ -p wa -k audispconfig" >> $file_audit
echo "" >> $file_audit

echo "# Monitor for use of audit management tools" >> $file_audit

echo "# Check your paths" >> $file_audit
echo "-w /sbin/auditctl -p x -k audittools" >> $file_audit
echo "-w /sbin/auditd -p x -k audittools" >> $file_audit
echo "" >> $file_audit

echo "# Special files" >> $file_audit

echo "-a exit,always -F arch=b32 -S mknod -S mknodat -k specialfiles" >> $file_audit
echo "-a exit,always -F arch=b64 -S mknod -S mknodat -k specialfiles" >> $file_audit
echo "" >> $file_audit

echo "# Mount operations" >> $file_audit

echo "-a exit,always -F arch=b32 -S mount -S umount -S umount2 -k mount" >> $file_audit
echo "-a exit,always -F arch=b64 -S mount -S umount2 -k mount" >> $file_audit
echo "" >> $file_audit

echo "# Changes to the time" >> $file_audit

echo "-a exit,always -F arch=b32 -S adjtimex -S settimeofday -S stime -S clock_settime -k time" >> $file_audit
echo "-a exit,always -F arch=b64 -S adjtimex -S settimeofday -S clock_settime -k time" >> $file_audit
echo "-w /etc/localtime -p wa -k localtime" >> $file_audit
echo "" >> $file_audit

echo "# Use of stunnel" >> $file_audit

echo "-w /usr/sbin/stunnel -p x -k stunnel" >> $file_audit
echo "" >> $file_audit

echo "# Schedule jobs" >> $file_audit

echo "-w /etc/cron.allow -p wa -k cron" >> $file_audit
echo "-w /etc/cron.deny -p wa -k cron" >> $file_audit
echo "-w /etc/cron.d/ -p wa -k cron" >> $file_audit
echo "-w /etc/cron.daily/ -p wa -k cron" >> $file_audit
echo "-w /etc/cron.hourly/ -p wa -k cron" >> $file_audit
echo "-w /etc/cron.monthly/ -p wa -k cron" >> $file_audit
echo "-w /etc/cron.weekly/ -p wa -k cron" >> $file_audit
echo "-w /etc/crontab -p wa -k cron" >> $file_audit
echo "-w /var/spool/cron/crontabs/ -k cron" >> $file_audit
echo "" >> $file_audit

echo "## user, group, password databases" >> $file_audit

echo "-w /etc/group -p wa -k etcgroup" >> $file_audit
echo "-w /etc/passwd -p wa -k etcpasswd" >> $file_audit
echo "-w /etc/gshadow -k etcgroup" >> $file_audit
echo "-w /etc/shadow -k etcpasswd" >> $file_audit
echo "-w /etc/security/opasswd -k opasswd" >> $file_audit
echo "" >> $file_audit

echo "# Monitor usage of passwd command" >> $file_audit

echo "-w /usr/bin/passwd -p x -k passwd_modification" >> $file_audit
echo "" >> $file_audit

echo "# Monitor user/group tools" >> $file_audit

echo "-w /usr/sbin/groupadd -p x -k group_modification" >> $file_audit
echo "-w /usr/sbin/groupmod -p x -k group_modification" >> $file_audit
echo "-w /usr/sbin/addgroup -p x -k group_modification" >> $file_audit
echo "-w /usr/sbin/useradd -p x -k user_modification" >> $file_audit
echo "-w /usr/sbin/usermod -p x -k user_modification" >> $file_audit
echo "-w /usr/sbin/adduser -p x -k user_modification" >> $file_audit
echo "" >> $file_audit

echo "# Login configuration and stored info" >> $file_audit

echo "-w /etc/login.defs -p wa -k login" >> $file_audit
echo "-w /etc/securetty -p wa -k login" >> $file_audit
echo "-w /var/log/faillog -p wa -k login" >> $file_audit
echo "-w /var/log/lastlog -p wa -k login" >> $file_audit
echo "-w /var/log/tallylog -p wa -k login" >> $file_audit
echo "" >> $file_audit

echo "# Network configuration" >> $file_audit

echo "-w /etc/hosts -p wa -k hosts" >> $file_audit
echo "-w /etc/network/ -p wa -k network" >> $file_audit
echo "" >> $file_audit

echo "## system startup scripts" >> $file_audit

echo "-w /etc/inittab -p wa -k init" >> $file_audit
echo "-w /etc/init.d/ -p wa -k init" >> $file_audit
echo "-w /etc/init/ -p wa -k init" >> $file_audit
echo "" >> $file_audit

echo "# Library search paths" >> $file_audit

echo "-w /etc/ld.so.conf -p wa -k libpath" >> $file_audit
echo "" >> $file_audit

echo "# Kernel parameters and modules" >> $file_audit

echo "-w /etc/sysctl.conf -p wa -k sysctl" >> $file_audit
echo "-w /etc/modprobe.conf -p wa -k modprobe" >> $file_audit
echo "" >> $file_audit


echo "# PAM configuration" >> $file_audit

echo "-w /etc/pam.d/ -p wa -k pam" >> $file_audit
echo "-w /etc/security/limits.conf -p wa  -k pam" >> $file_audit
echo "-w /etc/security/pam_env.conf -p wa -k pam" >> $file_audit
echo "-w /etc/security/namespace.conf -p wa -k pam" >> $file_audit
echo "-w /etc/security/namespace.init -p wa -k pam" >> $file_audit
echo "" >> $file_audit


echo "# Postfix configuration" >> $file_audit

echo "-w /etc/aliases -p wa -k mail" >> $file_audit
echo "-w /etc/postfix/ -p wa -k mail" >> $file_audit
echo "" >> $file_audit


echo "# SSH configuration" >> $file_audit

echo "-w /etc/ssh/sshd_config -k sshd" >> $file_audit
echo "" >> $file_audit

echo "# Hostname" >> $file_audit

echo "-a exit,always -F arch=b32 -S sethostname -k hostname" >> $file_audit
echo "-a exit,always -F arch=b64 -S sethostname -k hostname" >> $file_audit
echo "" >> $file_audit

echo "# Changes to issue" >> $file_audit

echo "-w /etc/issue -p wa -k etcissue" >> $file_audit
echo "-w /etc/issue.net -p wa -k etcissue" >> $file_audit
echo "" >> $file_audit

echo "# Log all commands executed by root" >> $file_audit

echo "-a exit,always -F arch=b64 -F euid=0 -S execve -k rootcmd" >> $file_audit
echo "-a exit,always -F arch=b32 -F euid=0 -S execve -k rootcmd" >> $file_audit
echo "" >> $file_audit

echo "## Capture all failures to access on critical elements" >> $file_audit

echo "-a exit,always -F arch=b64 -S open -F dir=/etc -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/bin -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/home -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/sbin -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/srv -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/usr/bin -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/usr/local/bin -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/usr/sbin -F success=0 -k unauthedfileacess" >> $file_audit
echo "-a exit,always -F arch=b64 -S open -F dir=/var -F success=0 -k unauthedfileacess" >> $file_audit
echo "" >> $file_audit

echo "## su/sudo" >> $file_audit

echo "-w /bin/su -p x -k priv_esc" >> $file_audit
echo "-w /usr/bin/sudo -p x -k priv_esc" >> $file_audit
echo "-w /etc/sudoers -p rw -k priv_esc" >> $file_audit
echo "" >> $file_audit

echo "# Poweroff/reboot tools" >> $file_audit

echo "-w /sbin/halt -p x -k power" >> $file_audit
echo "-w /sbin/poweroff -p x -k power" >> $file_audit
echo "-w /sbin/reboot -p x -k power" >> $file_audit
echo "-w /sbin/shutdown -p x -k power" >> $file_audit
echo "" >> $file_audit

echo "# Make the configuration immutable" >> $file_audit

echo "-e 2" >> $file_audit
echo "" >> $file_audit

pkill -HUP -P 1 auditd
