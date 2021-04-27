class Array
  def rebuild!
    return to_enum :rebuild! unless block_given?
    each_with_index do |elm, idx|
      elm.is_a?(Array) ? elm.map! { |e| yield(e, elm.size) } : self[idx] = yield(elm, size)
    end
  end
end
