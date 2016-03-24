def naive_string_matcher(t,p,s)
  if t.length > p.length
    i = 0
    j = 0
    while i <= t.length-p.length
      if t[i+j] == p[j]
        if j == p.length-1
          s.push i
          j = 0
          i += 1
        else
          j += 1
        end
      else
        j = 0
        i += 1
      end
    end
  end
end