require 'rubygems'
require 'uri'
require 'net/ldap'


module LdapShellUtils
  class LdapConnection
      
    OPERATIONAL_ATTRIBUTES = [
      :creatorsname, 
      :createtimestamp, 
      :modifiersname, 
      :modifytimestamp
    ]
      
    public
    def initialize( url, config )

      @uri           = URI.parse( url )
      @configuration = {
        :host => @uri.host,
        :port => @uri.port,
        :base => config[:base],
        :auth => {
          :method   => :simple,
          :username => config[:username],
          :password => config[:password]
        }
      }
      
      @configuration[:encryption] = { :method => :simple_tls } if( @uri.scheme.to_sym == :ldaps )

      @connection = Net::LDAP.new( @configuration )
      
      self
    rescue Exception => e
      raise ArgumentError.new( e.message )
    end
    
    
    def search( filter, attributes, audit=false )
      
      final_attributes = attributes ? attributes : []
      final_attributes += OPERATIONAL_ATTRIBUTES if audit
      final_filter     = Net::LDAP::Filter.construct( filter )
      
      @connection.search( :filter=>Net::LDAP::Filter.from_rfc2254( filter ), 
                          :attributes=>final_attributes, 
                          :return_result=>true )
    end    
  end
end