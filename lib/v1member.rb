#!/usr/bin/env ruby
require 'rest-client'
require 'yaml'

class V1Connect
  $V1HOST = YAML::load(File.open("./config/v1config_IPW.yml"))
  def get_memberlist
    @get_member = (RestClient::Request.execute(
      :method => :get,
      :url => "#{$V1HOST['base_url']}#{$V1HOST['base_uri']}#{$V1HOST['rest_uri']}",
      :payload => '{" "}',
      :headers => {'Authorization' => "Bearer #{$V1HOST['token_id']}", :content_type => 'application/xml'}
    ))
    p @get_member
  end
end
