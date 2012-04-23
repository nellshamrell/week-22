require_relative 'my_xml'
require_relative 'my_yml'

class Foo

  def load_my_file(filename)
    configuration_root_dir = File.join(File.dirname(__FILE__),"..","fixtures")
    begin
      @file_contents = File.read "#{configuration_root_dir}/#{filename}"
    rescue Errno::ENOENT => error
      warn "WARNING: #{error.class} - #{error}"
      @file_contents = nil
    end
  end

  def parse_my_file(file)
    if file =~ /.*\.xml$/
      x = MyXml.new
      x.parse_my_xml(@file_contents)
    elsif file =~ /.*\.yml$/
      parse_my_yml
    end
  end

  def build_my_subscriber_list(email_list)
    subscribers = []

    email_list.each do |e|
      if e[:subscribe] == "true"
        subscribers << e[:email]
      end
    end

    return subscribers
  end

  # Pass files through command line e.g. "ruby foo.xml foo.yml foo.doc"
=begin
  files = ARGV
  puts "ARGV: #{ARGV}"
  files.each do |file|
    puts "file: #{file}"
    load_my_file(file)
    parse_my_file(file)
  end
  merge_lists
=end

  file = ARGV
  puts "ARGV: #{ARGV}"
  f = Foo.new
  f.load_my_file(file)
  parsed = f.parse_my_file(file)
  puts parsed
  f.build_my_subscriber_list(parsed)
end
