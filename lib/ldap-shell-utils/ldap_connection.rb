require 'rubygems'
require 'uri'
require 'net/ldap'


module LdapShellUtils
  class LdapConnection
      
    attr_reader :connection
      
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
      @connection                 = Net::LDAP.new( @configuration )
      
      self
    rescue Exception => e
      raise ArgumentError.new( e.message )
    end
    
    def search( filter, attributes=[] )
      
      @connection.search( :filter=>Net::LDAP::Filter.from_rfc2254( filter ), :attributes=>attributes, :result=>false )
    end
    
    def to_s
      "#{@configuration.uri}"
    end
  end
end