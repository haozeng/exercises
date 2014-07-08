class Hash
  def string_keys!
    self.keys.each do |k|
      ks = k.to_sym
      self[ks] = self[k]
      self.delete(k)
      self[ks].string_keys! if self[ks].is_a?(Hash)
    end
    self
  end

  def string_keys
    result = {}
    self.keys.each do |k|
      ks = k.to_sym
      if self[k].is_a? Hash
        result[ks] = self[k].string_keys
      else
        result[ks] = self[k]
      end
    end
    result
  end

end


a = { 'a' => 'b', 'c' => { 'd' => { 'e' => 'f' }, 'g' => 'h' }}

puts a.string_keys!
puts a.string_keys
