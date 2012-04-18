require 'nokogiri'

def parse_my_xml
  configuration_data = Nokogiri::XML(@file_contents).root
  configuration_data.xpath('environment').each do |environment|
    puts environment.xpath('@name')
    puts environment.xpath('email').text
    puts environment.xpath('subscribe').text
    email = environment.xpath('email').text
    subscribe = environment.xpath('subscribe').text
    build_my_lists(subscribe,email)
  end
end
