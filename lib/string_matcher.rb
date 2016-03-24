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

def automachine_string_matcher(t, p, s)
  q = 0
  transition = build_automachine(p)
  (0..t.length-1).each do |i|
    q = transition[q,t[i]]
    if q == p.length-1
      s.push i
    end
  end
end

def build_automachine(p)
  transition = []
  (0..p.length-1).each do |i|
    transition.push({})
    ('a'..'z').each do |j|
      if i == p[j]
        transition[i]['a'] = j + 1
      end
    end
  end
  transition
end