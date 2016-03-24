def naive_string_matcher(t, p, s)
  if t.length > p.length
    (0..t.length-p.length).each do |i|
      count = 0
      (0..p.length-1).each do |j|
        if t[i+j] == p[j]
          count += 1
        else
          break
        end
      end
      s.push(i) if count == p.length
    end
  end
end