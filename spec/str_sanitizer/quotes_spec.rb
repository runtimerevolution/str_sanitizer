require "spec_helper"
require "str_sanitizer/quotes"
require "str_sanitizer/quotes"

RSpec.describe StrSanitizer::Quotes do
  before(:each) do
    @class_methods = ExampleClass.new
  end

  it "has a method named 'double_quote'" do
    expect(@class_methods.respond_to? :double_quote).to eq(true)
  end

  it "has a method named 'single_quote'" do
    expect(@class_methods.respond_to? :single_quote).to eq(true)
  end

  it "returns string with double quotes escaped" do
    test_string = 'The nerd said, "Look!"'
    escaped_string = @class_methods.double_quote(test_string)

    expect(escaped_string).to eq('The nerd said, \"Look!\"')
  end

  it "return string with single quotes escaped" do
    test_string = "They said, 'hello world!'"
    escaped_string = @class_methods.single_quote(test_string)

    expect(escaped_string).to eq("They said, \'hello world!\'")
  end
end

class ExampleClass
  include StrSanitizer::Quotes::ClassMethods
end