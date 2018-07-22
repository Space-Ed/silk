module DefinitionRule

  def express_nicely(indent='')
    mod = assignment.text_value == '|=' ? 'private' : 'public'
    name = if ref.text_value != '' then "<<#{ref.text_value}>>"else 'basedef' end

    object = obj.express_nicely(indent+'  ')

    "#{indent}#{mod} #{name}\n#{object}"
  end

  def ast_hash
    {
      type: "definition",
      name: ref.text_value,
      value: obj.ast_hash,
      public: assignment.text_value == '<='
    }
  end

end
