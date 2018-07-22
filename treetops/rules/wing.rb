module WingRule

  def lr_gates
    (gates&.elements||[]).map do |e|
      begin
        e.left_gate
      rescue
        begin
          e.right_gate
        rescue
          nil
        end
      end
    end .compact
  end

  def express_nicely(indent='')
    lr_gates.reduce(""){|acc, e| acc + e.express_nicely('') + ', '}[0...-2]
  end

  def ast_hash
    lr_gates.map{|e| e.ast_hash}
  end
end
