module GateRule

  def express_nicely(indent='')
      "#{ast_hash[:outer]} as #{ast_hash[:inner]}"
  end

  def ast_hash
    inner = gate.inner.inner
    inner = gate.outer if inner.text_value == ''
    {
      inner: inner.text_value,
      outer: gate.outer.text_value,
      type: gate.inner&.op
     }
  end

end
