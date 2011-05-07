begin
  Dir.glob( File.join( File.dirname( __FILE__ ), "**", "*.rb" ) ).each { |library| require library }
rescue LoadError => e
  $sdterr.puts( e.message )
end
