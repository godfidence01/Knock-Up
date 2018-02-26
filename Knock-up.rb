#!/usr/bin/env ruby

#    This file is part of Intrusion Detection System By - Ramneek aka Godfidence.
#
#    Intrusion Detection System By - Ramneek aka Godfidence is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Intrusion Detection System By - Ramneek aka Godfidence is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>

###########################
##  BASIC CONFIGURATION  ##
###########################


# Default -> false
$pb_log_enabled = false
$pb_log_file = File.dirname(__FILE__) + "/other/log/Knock-up_log_" + ENV['USER'] + ".log"

# $protected_mode variable defines if protected mode is activated or not.
#
# Protected mode protects you against "script kiddies" and "lammers". They
# can't run dangerous modules without root privileges.
#
# Recommended for public computers!!
#
# Default -> true
$protected_mode = true

# $text_color variable.
# When true, titles and warnings will be colorful,
# else it will be with default colors.
#
# Default -> true
$text_color = true

###########################

##### Loading time
dir = File.dirname(__FILE__)
require dir + "/lib/pb_proced_lib.rb" # Common procedures and functions.

version = "1.8"
Signal.trap("INT") do
	puts ""
	puts "[*] EXITING ..."
	puts ""
	pb_write_log("exiting", "Core")
	exit
end
#####

pb_write_log("Knock-up loaded", "Core")

srand(Time.now.to_i)
banner = 0

puts ""


# Thanks to Cowsay for the ASCII Art ;-)
case banner
	when 0
		# This banner is thanks to figlet.
		puts "  .___        __                      .__                ________          __                 __  .__                  _________               __                  "
                puts " |   | _____/  |________ __ __  _____|__| ____   ____   l______ l   _____/  |_  ____   _____/  |_|__| ____   ____    /   _____/__.__. _______/  |_  ____   _____   "
                puts " |   |/    l   __l_  __ l  |  l/  ___/  |/  _ l /    l   |    |  l_/ __ l   __l/ __ l_/ ___l   __l  |/  _ l /    l   l_____  <   |  |/  ___/l   __l/ __ l /     l  "
                puts " |   |   |  l  |  |  | l/  |  /l___ l|  (  <_> )   |  l  |    `   l  ___/|  | l  ___/l  l___|  | |  (  <_> )   |  l  /        l___  |l___ l  |  | l  ___/|  Y Y  l "
                puts " |___|___|  /__|  |__|  |____//____  >__|l____/|___|  / /_______  /l___  >__|  l___  >l___  >__| |__|l____/|___|  / /_______  / ____/____  > |__|  l___  >__|_|  / "
                puts "          l/                       l/               l/          l/     l/          l/     l/                    l/          l/l/         l/            l/      l/  "
sleep(0.25)
option1 = ""

while option1 !="5"
	module_exec = true
	puts ""
	puts "--------- Menu" + " "*10 + "ruby#{RUBY_VERSION} @ #{RUBY_PLATFORM}"
	puts ""
	puts "1- Network tools"
	option1 = gets_pb.chomp
	case option1
	     when "1"
			puts "1- Knock-Up"
			puts ""
			puts "0- Back"
			puts ""
			print "   -> "
			option1 = gets_pb.chomp
			case option1
				when "0"
					module_exec = false
				
					
				when "1"
					require "#{dir}/tools/network/honeypot.rb"
					Network_pb::Honeypot_pb.new()
				
				else
					module_exec = false
					puts ""
					puts "Invalid option."
					puts ""
			end
end
end
end
