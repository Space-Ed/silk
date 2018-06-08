require 'polyglot'
require 'treetop'
require 'yaml'

Treetop.load 'grammar'

describe SilkFileGrammarParser do
  context "loading files into the parser" do
    parser = SilkFileGrammarParser.new

    it "should parse a simple constant declaration" do
      result = parser.parse "hello<=value"
      expect(result).to_not be_nil
    end

    it "should parse to a serializable format" do
      result = parser.parse "hello<=value"
    end


  end


end
