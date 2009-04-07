require File.join(File.dirname(__FILE__), "helper")

describe "random" do
  before { @hello = Hello.random }

  it "should not be blank" do
    @hello.should_not be_blank
  end

  it "should be a hello from agnostic" do
    File.hello_data("agnostic").include? @random
  end
end
