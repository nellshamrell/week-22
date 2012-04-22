require_relative '../lib/my_xml.rb'

describe MyXml do

  before(:all) do
    configuration_root_dir = File.join(File.dirname(__FILE__),"fixtures")
    @file_contents = File.read "#{configuration_root_dir}/test_xml.xml"

  end

  context 'getting the file' do
    it "should be able to load the xml file" do
      m = MyXml.new
      m.load_file(@file_contents)
    end

  end

  context 'parsing' do
    it "should be able to extract a list of subscription info"

    it "should be able to extract a list of email addresses"

  end
end
