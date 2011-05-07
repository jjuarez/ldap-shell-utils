$:.unshift( File.join( File.dirname( __FILE__ ), 'lib' ) )

begin
  require 'version'
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
  
  begin
    require 'jeweler'
  rescue LoadError => e
    fail( "Jeweler not available. Install it with: gem install jeweler" )
  end

  Jeweler::Tasks.new do |gemspec|

    gemspec.name              = Version::NAME
    gemspec.version           = Version::VERSION
    gemspec.rubyforge_project = "http://github.com/jjuarez/#{Version::NAME}"
    gemspec.license           = 'MIT License'
    gemspec.summary           = 'A minimal ldapsearch wrapper'
    gemspec.description       = 'This is a simple wrapper over ldapsearch util avoiding base64 dn and others gotchas'
    gemspec.email             = 'javier.juarez@gmail.com'
    gemspec.homepage          = "http://github.com/jjuarez/#{Version::NAME}"
    gemspec.authors           = ['Javier Juarez']
    gemspec.files             = Dir[ 'lib/**/*.rb' ] + Dir[ 'test/**/*.rb' ]
    gemspec.executables       = ['lsu']

    gemspec.add_dependency( 'net-ldap' )
    gemspec.add_dependency( 'choice' )
    gemspec.add_dependency( 'config_context' )
  end
end

desc "Testing..."
task :test =>[:build] do
  
  require 'rake/runtest'
  
  Rake.run_tests 'test/unit/test_*.rb'
end

desc "Default task"
task :default=>[:build]

