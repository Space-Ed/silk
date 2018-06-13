require 'polyglot'
require 'treetop'
require 'yaml'

Treetop.load 'grammar'

parser = SilkParser.new

if parser.parse('hello<=**')
  puts YAML::dump(parser)
else
  puts parser.failure_reason
end
