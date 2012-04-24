require 'YAML'

class MyYml

  def load_config(file_contents)
    configuration_data = YAML::load file_contents
  end

  def parse_my_yml(file_contents)
    email_list = []

    configuration_data = YAML::load file_contents

    configuration_data.map do |k,v|
      email = v['email']
      subscribe = v['subscribe']

      email_list << {:email => email, :subscribe => subscribe}
    end

    return email_list
  end
end
