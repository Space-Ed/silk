require 'polyglot'
require 'treetop'
require 'yaml'
require_relative '../nodes/nodes.rb'
require_relative '../rules/rules.rb'
require 'pp'

def  clean_tree(root_node)
  return if(root_node.elements.nil?)
  root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
  root_node.elements.each {|node| clean_tree(node) }
end

Treetop.load 'grammarSimple'
parser = SilkParser.new

File.open("../examples/#{ARGV[0]}.silk") do |file|
  parse_result = parser.parse(file.read)

  if parse_result
    # clean_tree(parse_result)
    puts "-----------INSPECTION---------\n"
    puts parse_result.inspect
    
    puts "\n\n-----------FORMAT-------------\n"
    puts parse_result.express_nicely

    puts "\n\n-----------AST-------------\n"
    PP.pp(parse_result.ast_hash)
  else
    puts parser.failure_reason
  end

end
