require_relative 'foo'

  files = ARGV
  puts "ARGV: #{ARGV}"
  f = Foo.new

  subscribers = []

  files.each do |file|
    f.load_my_file(file)
    parsed = f.parse_my_file(file)
    subscribers << f.build_my_subscriber_list(parsed)
  end
  puts subscribers

