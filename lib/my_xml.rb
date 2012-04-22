require 'nokogiri'

class MyXml

  def load_file(file)
    config_data = Nokogiri::XML(file).root
  end

  def parse_my_xml(file)
    configuration_data = Nokogiri::XML(file).root
    configuration_data.xpath('environment').each do |environment|
=begin
      puts environment.xpath('@name')
      puts environment.xpath('email').text
      puts environment.xpath('subscribe').text
=end
      email = environment.xpath('email').text
      subscribe = environment.xpath('subscribe').text
      puts "one"
      puts email
      puts subscribe
      build_my_lists(subscribe,email)
      puts "two"
    end
  end
end
