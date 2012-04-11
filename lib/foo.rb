@true = []
@false = []

### XML ###
require 'nokogiri'

configuration_root_dir = File.join(File.dirname(__FILE__),"..","fixtures")

file_contents = File.read "#{configuration_root_dir}/foo.xml"

configuration_data = Nokogiri::XML(file_contents).root

configuration_data.xpath('environment').each do |environment|
  
  puts environment.xpath('@name')
  puts environment.xpath('email').text
  puts environment.xpath('subscribe').text

  email = environment.xpath('email').text
  subscribe = environment.xpath('subscribe').text
  if subscribe == true
    @true << email
  else # subscribe == false
    @false << email
  end  

end

### YAML ###

require 'YAML'

configuration_root_dir = File.join(File.dirname(__FILE__),"..","fixtures")

file_contents = File.read "#{configuration_root_dir}/foo.yml"

configuration_data = YAML::load file_contents

puts configuration_data

configuration_data.map do |k,v|
  email = v['email']
  subscribe = v['subscribe']
  if subscribe == true
    @true << email
  else # subscribe == false
    @false << email
  end
end

### MERGE & SUBTRACT FALSE FROM TRUE ###

@true = @true.sort.uniq.compact
puts "@true: #{@true}"
@false = @false.sort.uniq.compact
puts "@false: #{@false}"
@emails = @true - @false
puts "@emails: #{@emails}"
