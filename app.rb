#!/usr/bin/env ruby

require 'yaml'
require 'rest-client'
require 'v1member'

if File.file?('v1config_IPW.yml')
  v1 = V1Connect.new()
  get_members=v1.get_memberlist
end
