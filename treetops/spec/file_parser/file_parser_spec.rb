require 'polyglot'
require 'treetop'
require 'rspec/expectations'

Treetop.load 'grammar'
parser = SilkParser.new

RSpec::Matchers.define :be_silk do
  match do |code|
    parser.parse(code)
  end
  failure_message do |code|
    parser.failure_reason
  end
end

describe SilkParser do
  context "loading strings into the parser" do

    it "index expressions parse" do
      expect('<= *').to be_silk
      expect('root |= /').to be_silk
      expect('alias <= /bling').to be_silk
      expect('|= //').to_not be_silk
      expect('|= primary').to be_silk
    end

    it "should parse constructs" do
      expect('|=<{x:0}>').to be_silk
      expect('|={x:"hello \"world \" a" y:2}').to be_silk


    end

    it "should parse visors" do
      expect('|=<id:"Hello">').to be_silk
    end

    it "should parse everything" do
      expect("
|=<
  visor:{
    number: 0
    derived: (~ < 3)
  }
>").to be_silk
    end

  end


end
