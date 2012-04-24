require_relative '../lib/foo.rb'

describe Foo do

  before(:all) do
    @f = Foo.new
    @email_list = [{:email=>"test1@gmail.com", :subscribe=>"false"},{:email=>"test3@gmail.com", :subscribe=>"true"}]
  end

  it "should build the xml subscriber list" do
    @f.build_my_subscriber_list(@email_list).should_not include ("test1@gmail.com")
    @f.build_my_subscriber_list(@email_list).should include ("test3@gmail.com")
  end

  it "should merge YAML and XML"

end
