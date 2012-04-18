require 'YAML'

def parse_my_yml
  configuration_data = YAML::load @file_contents
  puts configuration_data
  configuration_data.map do |k,v|
    email = v['email']
    subscribe = v['subscribe']
    build_my_lists(subscribe,email)
  end
end
