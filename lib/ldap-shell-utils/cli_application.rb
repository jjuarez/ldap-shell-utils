require 'rubygems'
require 'config_context'


module LdapShellUtils
  module CliApplication
    extend self
    
    def print_entry( entry )

      puts "dn: #{entry.dn}"
      entry.each { |a,v| puts "#{a}: #{(v.size == 1) ? v[0]:v.inspect}" unless a == :dn }
    end
    
    def run( options )

      ConfigContext.configure( File.expand_path( options[:config] ) )

      results = LdapConnection.new( ConfigContext.url, ConfigContext.to_hash ).search( options[:filter], options[:attributes], options[:audit] )
      results.each { |e| print_entry( e ) } if results
    rescue Exception => e
      $stderr.puts( e.message )
    end
  end
end