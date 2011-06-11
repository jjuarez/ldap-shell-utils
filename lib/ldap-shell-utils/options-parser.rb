require 'rubygems'
require 'choice'

Choice.options do
  
  header ''
  header ' options:'

  option :config, :required=>true do
    short '-c'
    long  '--config'
    desc  'The LDAP config file'
  end

  option :filter, :required=>false do
    short '-f'
    long  '--filter'
    desc  'LDAP query filter'
    default "(objectClass=*)"
  end

  option :attributes, :required=>false do
    short '-a'
    long  '--attributes *ATTRIBUTES'
    desc  'The attributes list'
    default [:dn]
  end

  option :audit, :required=>false do
    long  '--audit'
    desc  'Audit attributes'
    default false
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