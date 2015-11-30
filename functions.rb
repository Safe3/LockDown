def bash(command)
  escaped_command = Shellwords.escape(command)
  system "bash -c #{escaped_command} > /dev/null 2>/dev/null"
end

#Messages

def ok_message()
	message="[ " + "OK".green + " ]"
end

def error_message()
	message="[ " + "ERROR".red + " ]"
end

#Gems

def require_gem()
	require 'shellwords'
	require 'docopt'
	require 'optparse'
end


#Scripts

def AccountsAndEnvironment()
	cmd = "includes/AccountsAndEnvironment.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "User Accounts and Environment".ljust(60) + ok_message
		else
		    puts "User Accounts and Environment".ljust(60) + error_message
		end 
sleep 1
end
def ConfigureSSH()
	cmd = "includes/ConfigureSSH.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Configure SSH".ljust(60) + ok_message
		else
		    puts "Configure SSH".ljust(60) + error_message
		end 
		sleep 1
end
def DisableIPV6()
	cmd = "includes/DisableIPV6.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Configure IPv6 ".ljust(60) + ok_message
		else
		    puts "Configure IPv6 ".ljust(60) + error_message
		end 
		sleep 1
end
def DisableServices()
	cmd = "includes/DisableServices.sh"
	bash(cmd)
		if bash(cmd) == true
	    puts "Disable services".ljust(60) + ok_message
	else
	    puts "Disable services".ljust(60) + error_message
	end 
	sleep 1
end
def KernelParameters()
	cmd = "includes/KernelParameters.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Kernel Parameters".ljust(60) + ok_message
		else
		    puts "Kernel Parameters".ljust(60) + error_message
		end 
		sleep 1
end
def Others()
	cmd = "includes/Others.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Additional Process Hardening".ljust(60) + ok_message
		else
		    puts "Additional Process Hardening".ljust(60) + error_message
		end 
		sleep 1
end
def LoggingAndAuditing()
	cmd = "includes/LoggingAndAuditing.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Logging and Auditing".ljust(60) + ok_message
		else
		    puts "Logging and Auditing".ljust(60) + error_message
		end 
		sleep 1
end
def Ntp()
	cmd = "includes/Ntpd.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Configure NTPD".ljust(60) + ok_message
		else
		    puts "Configure NTPD".ljust(60) + error_message
		end 
		sleep 1
end
def Pam()
	cmd = "includes/Pam.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Pam configuration".ljust(60) + ok_message
		else
		    puts "Pam configuration".ljust(60) + error_message
		end 
		sleep 1
end
def Password()
	cmd = "includes/Password.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Password configuration".ljust(60) + ok_message
		else
		    puts "Password configuration".ljust(60) + error_message
		end 
		sleep 1
end
def Permissions()
	cmd = "includes/Permissions.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Verifiy Permissions".ljust(60) + ok_message
		else
		    puts "Verifiy Permissions".ljust(60) + error_message
		end 
		sleep 1
end
def RemoveSoft()
	cmd = "includes/RemoveSoft.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Remove Unnecessary Software".ljust(60) + ok_message
		else
		    puts "Remove Unnecessary Software".ljust(60) + error_message
		end 
		sleep 1
end
def SecureBootAndServices()
	cmd = "includes/SecureBootAndServices.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Secure Boot Settings".ljust(60) + ok_message
		else
		    puts "Secure Boot Settings".ljust(60) + error_message
		end 
		sleep 1
end

#
# Aplly Configurations

def ApplyAll()
	#AccountsAndEnvironment
	cmd = "includes/AccountsAndEnvironment.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "User Accounts and Environment".ljust(60) + ok_message
		else
		    puts "User Accounts and Environment".ljust(60) + error_message
		end 
	sleep 1

	#ConfigureSSH
	cmd = "includes/ConfigureSSH.sh"
	bash(cmd)
		if bash(cmd) == true
			puts "Configure SSH".ljust(60) + ok_message
		else
	    	puts "Configure SSH".ljust(60) + error_message
		end 
	sleep 1

	#DisableIPV6
	cmd = "includes/DisableIPV6.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Configure IPv6 ".ljust(60) + ok_message
		else
		    puts "Configure IPv6 ".ljust(60) + error_message
		end 
	sleep 1

	#DisableServices
	cmd = "includes/DisableServices.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Disable services".ljust(60) + ok_message
		else
	    	puts "Disable services".ljust(60) + error_message
		end 
	sleep 1

	#KernelParameters
	cmd = "includes/KernelParameters.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Kernel Parameters".ljust(60) + ok_message
		else
		    puts "Kernel Parameters".ljust(60) + error_message
		end 
	sleep 1

	#Others
	cmd = "includes/Others.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Additional Process Hardening".ljust(60) + ok_message
		else
		    puts "Additional Process Hardening".ljust(60) + error_message
		end 
	sleep 1

	#LoggingAndAuditing
	cmd = "includes/LoggingAndAuditing.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Logging and Auditing".ljust(60) + ok_message
		else
		    puts "Logging and Auditing".ljust(60) + error_message
		end 
	sleep 1

	#Ntp
	cmd = "includes/Ntpd.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Configure NTPD".ljust(60) + ok_message
		else
		    puts "Configure NTPD".ljust(60) + error_message
		end 
	sleep 1

	#Pam
	cmd = "includes/Pam.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Pam configuration".ljust(60) + ok_message
		else
		    puts "Pam configuration".ljust(60) + error_message
		end 
	sleep 1

	#Password
	cmd = "includes/Password.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Password configuration".ljust(60) + ok_message
		else
		    puts "Password configuration".ljust(60) + error_message
		end 
	sleep 1

	#Permissions
	cmd = "includes/Permissions.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Verifiy Permissions".ljust(60) + ok_message
		else
		    puts "Verifiy Permissions".ljust(60) + error_message
		end 
	sleep 1

	#RemoveSoft
	cmd = "includes/RemoveSoft.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Remove Unnecessary Software".ljust(60) + ok_message
		else
		    puts "Remove Unnecessary Software".ljust(60) + error_message
		end 
	sleep 1

	#SecureBootAndServices
	cmd = "includes/SecureBootAndServices.sh"
	bash(cmd)
		if bash(cmd) == true
		    puts "Secure Boot Settings".ljust(60) + ok_message
		else
		    puts "Secure Boot Settings".ljust(60) + error_message
		end 
	sleep 1
end
