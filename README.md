# VersionOne-Membership
Get VersionOne Memberlist using Token Access in Ruby

Usage
=====

require 'yaml'

require 'rest-client'

 
Execute app.rb 

Example (GET)
=====
token = "access_token"

get_member = (RestClient::Request.execute(
  :method => :get,
  #:url => "https://your_VersionOne_site/rest-1.v1/Data/Member?sel=Name,Email&where=Nickname='some_name'",
  :url => "https://www14.v1host.com/MacysIncIPWSandbox/rest-1.v1/Data/Member?",
  :payload => '{" "}',
  :headers => {'Authorization' => "Bearer #{token}", :content_type => 'application/xml'}
))
p "#{get_member}"

Example (POST) 
Note: static example, update member id "53166" to a relevant user

=====
token = "access_token"

post_member = (RestClient::Request.execute(
  :method => :post,
  :url => "your_VersionOne_site/rest-1.v1/Data/Member/53166",
  :payload => "<Asset><Attribute name='Email' act='set'>working@test.com</Attribute></Asset>",
  :headers => {'Authorization' => "Bearer #{token}", :content_type => 'application/xml'}
))
end
p "#{post_member}"
