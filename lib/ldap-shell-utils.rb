begin
  Dir.glob( File.join( File.dirname( __FILE__ ), "**", "*.rb" ) ).each { |l| require l }
rescue LoadError => e
  $sdterr.puts( e.message )
end