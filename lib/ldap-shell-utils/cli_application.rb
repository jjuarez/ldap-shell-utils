require 'rubygems'
require 'config_context'


module LdapShellUtils
  module CliApplication
    extend self
    
    def run( config, filter, attributes )

      ConfigContext.load( File.expand_path( config ) )
      results = LdapConnection.new( ConfigContext.url, ConfigContext.all ).search( filter, attributes )
      
      if( results )
        results.each do |entry|
      
          puts "dn: #{entry.dn}"
          entry.each { |a,v| puts " - #{a}: #{v.length == 1 ? v[0]:v.inspect}" unless a == :dn }
        end
      end      
    rescue Exception => e
      $stderr.puts( e.message )
    end
  end
end