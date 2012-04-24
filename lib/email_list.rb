require_relative 'foo'

  file = ARGV.first
  puts "ARGV: #{ARGV}"
  f = Foo.new
  f.load_my_file(file)
  parsed = f.parse_my_file(file)
  subscribers = f.build_my_subscriber_list(parsed)
  puts subscribers

