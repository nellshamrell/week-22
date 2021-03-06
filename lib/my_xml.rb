require 'nokogiri'
class MyXml

  def load_config(file_contents)
    configuration_data = Nokogiri::XML(file_contents).root
  end

  def parse_my_xml(file_contents)
    email_list = []
    configuration_data = load_config(file_contents)
    configuration_data.xpath('environment').each do |environment|
=begin
      puts environment.xpath('@name')
      puts environment.xpath('email').text
      puts environment.xpath('subscribe').text
=end
      email = environment.xpath('email').text
      subscribe = environment.xpath('subscribe').text
      email_list << {:email => email, :subscribe => subscribe}

    end
    return email_list
  end
end
