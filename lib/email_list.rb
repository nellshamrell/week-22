require_relative 'foo'

  files = ARGV
  puts "ARGV: #{ARGV}"

  subscribers = []
  f = Foo.new


  files.each do |file|
    f.load_my_file(file)
    parsed = f.parse_my_file(file)
    list = f.build_my_subscriber_list(parsed)
    subscribers << list
  end

  puts subscribers

