module ValueRule

  def hasRightValue
      right_value.class != NullNode
  end

  def express_nicely(indent='')
    begin
      if (hasRightValue)
        right_value.express_nicely(indent)
      else
        left_value.express_nicely(indent)
      end
    rescue Exception => e
      "Parsing error: #{e.message} \n left: #{left_value&.inspect} \n right: #{right_value&.inspect}"
    end
  end

  def ast_hash
    if (hasRightValue)
      right_value.ast_hash
    else
      left_value.ast_hash
    end
  end

end
