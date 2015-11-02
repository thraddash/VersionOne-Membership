#!/usr/bin/env ruby
require 'rest-client'
require 'yaml'
require 'nokogiri'

class V1Connect
  $V1HOST = YAML::load(File.open("./config/v1config.yml"))
  def get_memberlist
    @get_member = (RestClient::Request.execute(
      :method => :get,
      :url => "#{$V1HOST['base_url']}#{$V1HOST['base_uri']}#{$V1HOST['rest_uri']}#{$V1HOST['theSelection']}",
      :payload => '{" "}',
      :headers => {'Authorization' => "Bearer #{$V1HOST['token_id']}", :content_type => 'application/xml'}
    ))
    p @get_member
  end

  def read_xml
    f = File.open("member.xml")
    doc = Nokogiri::XML(f)
    doc.xpath('//Assets/Asset[@id]').each do |member|
      p member['id']
      h = {}
      member.elements.each do |b|
        p "#{h[b.text.strip] = b['name']}" "=" "#{b.text}"
      end
    end
  end
end
