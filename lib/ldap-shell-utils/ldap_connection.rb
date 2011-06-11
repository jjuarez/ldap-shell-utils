require 'rubygems'
require 'uri'
require 'net/ldap'


module LdapShellUtils
  class LdapConnection
      
    public
    def initialize(config)

      uri           = URI.parse( config[:url] )
      auth_config   = {
        :method   =>:simple,
        :username =>config[:username],
        :password =>config[:password]
      }
      
      configuration = {
        :host=>uri.host,
        :port=>uri.port,
        :base=>config[:base],
        :auth=>auth_config
      }
      
      configuration[:encryption] = { :method => :simple_tls } if(uri.scheme == 'ldaps')
      @connection                = Net::LDAP.new(configuration)
      
      self
    rescue StandardError=>e
      raise ArgumentError.new(e.message)
    end
     
    def search(options)
      
      ldap_filter = ""
      
      begin
        ldap_filter = Net::LDAP::Filter.from_rfc2254(options[:filter])
      rescue StandardError=>e
        raise ArgumentError.new(e.message)
      end
      
      options[:attributes] += [:creatorsname, :createtimestamp, :modifiersname, :modifytimestamp] if options[:audit]
      @connection.search( :filter=>ldap_filter, :attributes=>options[:attributes], :return_result=>true )
    end    
  end
end