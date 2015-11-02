#!/usr/bin/env ruby

require 'yaml'
require 'rest-client'
require './lib/v1member'

if File.file?('./config/v1config.yml')
  v1 = V1Connect.new()
  get_members=v1.get_memberlist
end
