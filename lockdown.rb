#!/usr/bin/ruby
#!/usr/bin/env ruby -wKU

#Load files
if RUBY_VERSION > "2.0"
    require_relative "classes.rb"
    require_relative "functions.rb"
else
    load "classes.rb"
    load "functions.rb"
end

require_gem()

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
# Web site: 
# mail: w.carreirojunior@protonmail.com
#
######################################################################################
# Program information
######################################################################################
    Name="Lockdown"
    Version="0.1 - Beta"
    Releasedate="8 October 2015"
    Author="Junior Carreiro aka _0x4a0x72"
    Contact="w.carreirojunior@protonmail.com"
    Website="-"
    Copyright="Copyright 2015 - ${Author}, ${Website}"
    License="${Name} comes with ABSOLUTELY NO WARRANTY. This is free software, and you are
 welcome to redistribute it under the terms of the GNU General Public License.
 See the LICENSE file for details about using this software."
    Info="Enterprise support available"
    # Enterprise or Free version
    releasetype="Free"
    # Version number of report files (when format changes in future)
    #REPORT_version_major="1"; REPORT_version_minor="0"
    #REPORT_version="${REPORT_version_major}.${REPORT_version_minor}"
#
######################################################################################
# Verify root user
######################################################################################
if isRoot = Process.uid.zero? == false
    puts "Do you need root for run this program"
    exit 
end
#
#Installing Pre-Req
#pbar = ProgressBar.new("Installing Pre Requirements", 100)
#100.times {sleep(0.01); pbar.inc}; pbar.finish

#Menu
# default options:
options = {accounts: false, boot: false, ssh: false, ipv6: false, services: false, kernel: false, other: false, audit: false, ntpd: false, pam: false, password: false, permission: false, removesoft: false, apllyall: false, version: false, message: true}
#options = { "accounts" => false, "boot" => false, "ssh" => false, "ipv6" => false, "services" => false, "kernel" => false, "other" => false, "audit" => false, "ntpd" => false, "pam" => false, "password" => false, "permission" => false, "removesoft" => false, "apllyall" => false, "version" => false, "message" => true }

begin
    
    OptionParser.new do |opts|
    # banner and separator are the usage description showed with '--help' or '-h'
    opts.banner = "Usage: lockdown.rb [options]"
    opts.separator "Does not run in a production environment without reading the code. There are settings that can affect directly your environment."
    opts.separator "Options:"
    # options (switch - true/false)
        opts.on("--accounts", "Apply config on Accounts and Environment") do |e|
            options[:accounts] = e 
        end
        opts.on("--boot", "Apply config on Boot Settings") do |b|
            options[:boot] = b
        end
        opts.on("--ssh", "Apply config on SSH Configuration") do |c|
            options[:ssh] = c
        end
        opts.on("--ipv6", "Disable IPv6") do |i|
            options[:ipv6] = i
        end
        opts.on("--services", "Disable Services") do |d|
            options[:services] = d
        end
        opts.on("--kernel", "Apply config on kernel Parameters") do |k|
            options[:kernel] = k
        end
        opts.on("--others", "Additional Process Hardening") do |o|
            options[:others] = o
        end
        opts.on("--audit", "Logging and Auditing") do |l|
            options[:audit] = l
        end
        opts.on("--ntpd", "Configure NTPD") do |n|
            options[:ntpd] = n
        end
        opts.on("--pam", "Pam configuration") do |p|
            options[:pam] = p
        end
        opts.on("--password", "Password configuration") do |w|
            options[:password] = w
        end
        opts.on("--permission", "Verifiy Permissions") do |f|
            options[:permission] = f
        end
        opts.on("--removesoft", "Remove Unnecessary Software - *Create a list of the software to be uninstalled within /tmp/soft.lst") do |r|
            options[:removesoft] = r
        end
        opts.on("-A", "--apllyall", "Apply all configurations") do |x|
            options[:apllyall] = x
        end
        opts.on("-v", "--version", "Show Version") do |v|
            options[:version] = v
        end
        opts.on("--message", "Show This Message") do |m|
            options[:message] = m
        end

    end.parse!

    if options[:accounts]
        puts "Applying config on Accounts and Environment..."
        AccountsAndEnvironment()
    end
    if options[:boot]
        puts "Applying config on Boot Settings..."
        SecureBootAndServices()
    end
    if options[:ssh]
        puts "Applying config on SSH Configuration..."
        ConfigureSSH()
    end
    if options[:ipv6]
        puts "Disabling IPv6..."
        DisableIPV6()
    end
    if options[:services]
        puts "Disabling Services..."
        DisableServices()
    end
    if options[:kernel]
        puts "Applying config on kernel Parameters..."
        KernelParameters()
    end
    if options[:others]
        puts "Applying Additional Process Hardening..."
        Others()
    end
    if options[:audit]
        puts "Applying Logging and Auditing..."
        LoggingAndAuditing()
    end
    if options[:ntpd]
        puts "Configuring NTPD..."
        Ntp()
    end
    if options[:pam]
        puts "Applying Pam configuration..."
        Pam()
    end
    if options[:password]
        puts "Applying Password configuration..."
        Password()
    end
    if options[:permission]
        puts "Verifiying Permissions..."
        Permissions()
    end
    if options[:removesoft]
        puts "Removing Unnecessary Software..."
        RemoveSoft()
    end
    if options[:apllyall]
        puts "Applying All Configuration..."
        ApplyAll()
    end
    if options[:version]
        puts "Beta Version - 0.1"
    end
    if options[:message]
        puts "Show Options: lockdown -h or --help"
    end

rescue Interrupt => e
    puts "execution stopped"
end