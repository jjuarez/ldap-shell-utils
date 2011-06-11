require 'rubygems'
require 'config_context'


module LdapShellUtils
  module CliApplication
    extend self
    
    def self.run(options)

      ConfigContext.configure(File.expand_path(options[:config]))
      
      options = { :audit=>false }.merge(options)
      results = LdapConnection.new(ConfigContext.to_hash).search(options)
      
      results.each do |entry|
        puts "#{entry.dn}"
        entry.each do |attr,values| 
          puts "#{attr}: #{(values.size == 1) ? values[0] : values.inspect}" unless attr == :dn 
        end
      end if results
    rescue Exception=>e
      $stderr.puts(e.message)
    end
  end
end