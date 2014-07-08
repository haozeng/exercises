def detect_cycle(params)
  seen = {}

  params.each_with_index do |item, index|
    return params[seen[item]..index-1] if seen.has_key? item
    seen[item] = index
  end
  nil
end

File.open('intersection.txt').each_line do |line|
  params = line.split(' ').map(&:to_i)
  puts detect_cycle(params).join(' ')
end
