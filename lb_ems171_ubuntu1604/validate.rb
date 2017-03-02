#!/usr/bin/ruby
#
# EvoStream Media Server Extensions
# EvoStream, Inc.
# (c) 2017 by EvoStream, Inc. (support@evostream.com)
# Released under the MIT License
#

require 'colorize'

VERBOSE = false
BASEURL = "https://raw.githubusercontent.com/EvoStream/azure_deploy/master/lb_ems171_ubuntu1604/"
TEMPLATE = "#{BASEURL}templates/mainTemplate.json"
GROUP = "alblab"
USER = "user1234"
PASS = "Pa@@word1234"
VMSIZE = "Standard_F1"
SSHKEY = "ssh-rsa AAAAA3NzaC1yc2EBBBBDDQBBBBBBBQC+81000p5g/5nHGn2J7axOFbNj4P9EflcMyroyiTroCumukbV0CQp+S2aJDfmLpaUUU30L4U06Wb02wcWIecK9CVuiPFjng/FFFMUKC4ZSHQgfgwWxdvPPPpza+K+NqDgxBL6ssspB2Zx3y6niaOtEL2mGvcn2mmmSaa/0vhj/UUUnXsR46dE4NVw/cN1TVIpf+A+U/YYYidlAKFtHIBhxI3cthKYG/3tZLrKALr/Q+fEV99hbob2XBNI7GlEb4aUfe9BBB8xXjNRQGbh/3nleUav3RCy1y5cKx43lryQ+b7EdFFFlOrY5zpu8u8PLUJG965dVNjVq3wSDDDmr2OOt email@company.com"
LICENSE = "#{BASEURL}LICENSE.md"
PARAMS = "{
  \\\"adminUsername\\\":{\\\"value\\\":\\\"#{USER}\\\"},
  \\\"httpPassword\\\":{\\\"value\\\":\\\"#{PASS}\\\"},
  \\\"vmSize\\\":{\\\"value\\\":\\\"#{VMSIZE}\\\"},
  \\\"initialEdgeCount\\\":{\\\"value\\\":2},
  \\\"maxEdgeCount\\\":{\\\"value\\\":5},
  \\\"emsLicenseUrl\\\":{\\\"value\\\":\\\"#{LICENSE}\\\"},
  \\\"sshKey\\\":{\\\"value\\\":\\\"#{SSHKEY}\\\"}
}"

def validate
  cmd = "azure group template validate -f #{TEMPLATE} -g #{GROUP} -p \"#{PARAMS}\""
  cmd += " -vv" if VERBOSE
  puts "COMMAND:"
  puts "#{cmd}".colorize(:light_blue)
  result = `#{cmd}`
  puts "RESULT:"
  if $?.exitstatus == 0
    puts "#{result}".colorize(:light_green)
    return 0
  else
    puts "#{result}".colorize(:light_red)
    return 1
  end
end

puts `date`
puts "PARAMS:"
puts "#{PARAMS}".colorize(:light_yellow)
validate
