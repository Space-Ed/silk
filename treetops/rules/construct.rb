module ConstructRule
  def express_nicely(indent='')
    elems = (sequence.elements||[])
      .map {|e| e.value.express_nicely(indent+'| ')}
      .reduce("") {|acc, e| acc + e + "\n"}[0...-1]

    inputs = "inlets: " + left.express_nicely if !left.empty?
    outputs = "outlets: " + right.express_nicely if !right.empty?
"#{indent}construct #{inputs}
#{elems}
#{indent}|_________#{outputs}"
  end

  def ast_hash
    inputs = left.ast_hash if !left.empty?
    outputs = right.ast_hash if !right.empty?
    elems = (sequence.elements||[])
      .map {|e| e.value.ast_hash}

    {
      type: "construct",
      input_gates: inputs,
      output_gates: outputs,
      contents: elems
    }.compact
  end

end
