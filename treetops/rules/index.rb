module IndexRule

  def express_nicely(indent='')
      indent + 'import ' + text_value
  end

  def ast_hash
    {
      type: 'import',
      value: text_value
    }
  end

end
