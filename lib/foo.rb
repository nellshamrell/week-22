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
      y = MyYml.new
      y.parse_my_yml(@file_contents)
    end
  end

  def build_my_subscriber_list(email_list)
    true_subscribe = []
    false_subscribe = []

    subscribers = []

    # Seperate emails lists into true and false
    email_list.each do |e|
      e[:subscribe] == "true" || e[:subscribe] == true ? true_subscribe << e[:email] : false_subscribe << e[:email]
    end

    # Subtract false array from true array to weed out duplicate emails with different subscription values
     subscribers = true_subscribe - false_subscribe

    return subscribers
  end
end

