module ConditionalRule
  def express_nicely(indent='')

"#{indent}if
#{parent.left_value.express_nicely(indent+"  ")}
#{indent}then
#{true_path.express_nicely(indent+"  ")}
#{indent}else
#{false_path.express_nicely(indent+"  ")}"
  end

  def ast_hash
    {
      type: "conditional",
      condition_value: parent.left_value.ast_hash,
      true_path_value: true_path.ast_hash,
      false_path_value: false_path.ast_hash
    }
  end

end
