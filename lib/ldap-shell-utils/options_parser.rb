require 'rubygems'
require 'choice'


Choice.options do
  
  header ''
  header ' options:'

  option :config, :required=>true do
    short '-c'
    long  '--config'
    desc  'The Yaml config file'
  end
  
  option :filter, :required=>true do
    short '-f'
    long  '--filter'
    desc  'The LDAP query'
  end

  option :attributes, :required=>false do
    short '-a'
    long  '--attributes *ATTRIBUTES'
    desc  'The attributes list'
  end

  separator ''
  separator ' help:'

  option :help do
    short '-h'
    long  '--help'
    desc  'Show this help screen'
  end

  separator ''
end