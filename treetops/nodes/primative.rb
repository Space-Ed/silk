class PrimativeNode < Treetop::Runtime::SyntaxNode
  def ast_hash
    return {
      type: self.class.name,
      value: text_value
    }
  end

  def inspect(indent="")
    indent+"#{ast_hash[:type]}:#{ast_hash[:value]}"
  end

  def express_nicely(indent="")
      indent+"#{ast_hash[:type]}:#{ast_hash[:value]}"
  end
end


class SymbolNode < PrimativeNode
end

class NumberNode < PrimativeNode
end

class StringNode < PrimativeNode

end
