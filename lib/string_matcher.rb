def naive_string_matcher(t, p, s)
  if t.length > p.length
    for i in 0..t.length-p.length
      count = 0
      for j in 0..p.length-1
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