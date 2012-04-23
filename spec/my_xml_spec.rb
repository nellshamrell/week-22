require_relative '../lib/my_xml.rb'

describe MyXml do

  before(:all) do
    configuration_root_dir = File.join(File.dirname(__FILE__),"fixtures")
    @file_contents = File.read "#{configuration_root_dir}/test_xml.xml"
    @m = MyXml.new
  end

  context 'getting the file' do
    it "should be able to load the xml file" do
      config_data = @m.load_config(@file_contents)
      config_data.should_not be_nil
    end
  end

  context 'parsing' do
    it "should be able to extract a list of emails and subscriptions" do
      email_list = @m.parse_my_xml(@file_contents)
      s = email_list.first
      s[:email].should == "test1@gmail.com"
      s[:subscribe].should == "false"
      s2 = email_list.last
      s2[:email].should == "test2@gmail.com"
      s2[:subscribe].should == "true"
    end
  end
end
