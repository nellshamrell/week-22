require_relative 'my_xml'
require_relative 'my_yml'

class Foo

  def self.load_my_file(filename)
    configuration_root_dir = File.join(File.dirname(__FILE__),"..","fixtures")
    begin
      @file_contents = File.read "#{configuration_root_dir}/#{filename}"
    rescue Errno::ENOENT => error
      warn "WARNING: #{error.class} - #{error}"
      @file_contents = nil
    end
  end

  def self.parse_my_file(file)
    if file =~ /.*\.xml$/
      x = MyXml.new
      x.parse_my_xml(@file_contents)
    elsif file =~ /.*\.yml$/
      parse_my_yml
    end
  end

  def build_my_lists(subscribe,email)

    @true = []
    @false = []

    subscribe == true ? @true << email : @false << email
  end

  def self.merge_lists
    @true = @true.sort.uniq.compact
    puts "@true: #{@true}"
    @false = @false.sort.uniq.compact
    puts "@false: #{@false}"
    @emails = @true - @false  # Subtract false array from true array
    puts "@emails: #{@emails}"
  end

  # Pass files through command line e.g. "ruby foo.xml foo.yml foo.doc"
  files = ARGV
  puts "ARGV: #{ARGV}"
  files.each do |file|
    puts "file: #{file}"
    load_my_file(file)
    parse_my_file(file)
  end
  merge_lists
end
