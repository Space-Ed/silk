module FileRule
  def express_nicely(indent='')
    elements
      .map {|e| e.top_level_declaration}
      .reduce("FILE: \n") {|acc, e| acc+e.express_nicely('  ')+"\n"}
  end

  def ast_hash
    {
      type: "file",
      defs: elements
        .map {|e| e.top_level_declaration.ast_hash}
    }
  end
end
