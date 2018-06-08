require 'polyglot'
require 'treetop'
require 'yaml'

Treetop.load 'grammar'

parser = SilkFileGrammarParser.new

if parser.parse('hello<=value')
  puts YAML::dump(parser)
else
  puts parser.failure_reason
  puts parser.failure_line
  puts parser.failure_column
end
