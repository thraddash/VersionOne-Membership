# VersionOne-Membership
Get VersionOne Memberlist using Token Access in Ruby

##Usage
````ruby
require 'yaml'
require 'rest-client'
````
Execute app.rb 

##Example (RestClient GET)
````ruby
token = "token_access"

get_member = (RestClient::Request.execute(
  :method => :get,
  :url => "https://your_VersionOne_site/rest-1.v1/Data/Member?sel=Name,Email&where=Nickname='some_name'",
  :payload => '{" "}',
  :headers => {'Authorization' => "Bearer #{token}", :content_type => 'application/xml'}
  ))
end
p "#{get_member}"
````
## Example (RestClient POST)
###### static example, update member id "53166" to a relevant user
````ruby
token = "token_access"

post_member = (RestClient::Request.execute(
  :method => :post,
  :url => "your_VersionOne_site/rest-1.v1/Data/Member/53166",
  :payload => "<Asset><Attribute name='Email' act='set'>working@test.com</Attribute></Asset>",
  :headers => {'Authorization' => "Bearer #{token}", :content_type => 'application/xml'}
  ))
end
p "#{post_member}"
````
## v1config.yml
````yaml
token_id: your_token_access
base_url: https://your_VersionOne_url
base_uri: /your_VersionOne_uri
rest_uri: /rest-1.v1/Data/Member?
````
## v1member.rb
````ruby
#!/usr/bin/env ruby
require 'rest-client'
require 'yaml'

class V1Connect
  $V1HOST = YAML::load(File.open("./config/v1config.yml"))
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
````
