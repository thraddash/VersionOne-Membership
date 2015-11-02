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
## member.xml
```xml
<?xml version="1.0" encoding="UTF-8"?>
<Assets total="2426" pageSize="2147483647" pageStart="0">
<Asset href="/your_versionOne/rest-1.v1/Data/Member/911" id="Member:911">
    <Attribute name="AssetType">Member</Attribute>
    <Attribute name="IsCollaborator">false</Attribute>
    <Relation name="Avatar"/>
    <Attribute name="SendConversationEmails">true</Attribute>
    <Attribute name="UsesLicense">true</Attribute>
    <Attribute name="NotifyViaEmail">true</Attribute>
    <Relation name="SecurityScope"/>
    <Relation name="DefaultRole">
      <Asset href="/your_versionOne/rest-1.v1/Data/Role/4" idref="Role:4"/>
    </Relation>
    <Attribute name="Username">team_lead</Attribute>
    <Attribute name="IsLoginDisabled">false</Attribute>
    <Attribute name="Phone"/>
    <Attribute name="Email">hello@email.com</Attribute>
    <Attribute name="Nickname">Team L</Attribute>
    <Attribute name="Description"><p>Marketing</p></Attribute>
    <Attribute name="Name">Team Lead</Attribute>
    <Attribute name="AssetState">64</Attribute>
    <Attribute name="SecurityScope.Name"/>
    <Attribute name="DefaultRole.Name">Role.Name'Team Lead</Attribute>
    <Relation name="Followers"/>
    <Attribute name="Followers.Name"/>
    <Attribute name="Followers.Nickname"/>
    <Attribute name="Ideas"/>
  </Asset>
  </Assets>
  ````
