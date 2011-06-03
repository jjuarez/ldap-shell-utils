require 'rubygems'
require 'bundler'

begin
  Bundler.setup( :default, :development )
rescue Bundler::BundlerError => e
  fail( "Run `bundle install` to install missing gems (#{e.message})" )
end


begin
  require File.join( File.dirname( __FILE__ ), %w[lib ldap-shell-utils version.rb] )
rescue LoadError => le
  fail( le.message )
end


desc "Clean all temporary stuff"
task :clean do
  
  begin
    require 'fileutils'
    
    FileUtils.remove_dir( File.join( File.dirname( __FILE__ ), 'pkg' ), true )
  rescue LoadError=>e
    fail( e.message )
  end
end


desc "Build the gem"
task :build =>[:clean] do
  
  require 'jeweler'
  
  Jeweler::Tasks.new do |gemspec|

    gemspec.name              = LdapShellUtils::Version::NAME
    gemspec.version           = LdapShellUtils::Version::VERSION
    gemspec.rubyforge_project = "http://github.com/jjuarez/#{LdapShellUtils::Version::NAME}"
    gemspec.license           = 'MIT License'
    gemspec.summary           = 'A minimal ldapsearch wrapper'
    gemspec.description       = 'This is a simple wrapper over ldapsearch util avoiding base64 dn and others gotchas'
    gemspec.email             = 'javier.juarez@gmail.com'
    gemspec.homepage          = "http://github.com/jjuarez/#{LdapShellUtils::Version::NAME}"
    gemspec.authors           = ['Javier Juarez']
    gemspec.files             = Dir[ 'lib/**/*.rb' ] + Dir[ 'test/**/*.rb' ]
    gemspec.executables       = ['lsu']

    gemspec.add_runtime_dependency( 'net-ldap' )
    gemspec.add_runtime_dependency( 'slop' )
    gemspec.add_runtime_dependency( 'config_context' )
  end
end


desc "Testing..."
task :test do
  
  require 'rake/testtask'
  require 'rake/runtest'
  
  Rake::TestTask.new(:test) do |test|
  
    test.libs << 'lib' << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = false
  end
end


desc "Test covertura"
task :rcov do

  require 'rcov/rcovtask'

  INCLUDE_DIRECTORIES = "lib:test"
  
  def run_coverage( files )

    fail( "No files were specified for testing" ) if files.length == 0
    sh "rcov --include #{INCLUDE_DIRECTORIES} --exclude gems/*,rubygems/* --sort coverage --aggregate coverage.data #{files.join( ' ' )}"
  end

  run_coverage Dir["test/**/test_*.rb"]
end


desc "Default task"
task :default=>[:build]
