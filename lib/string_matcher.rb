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

def finite_automation_matcher(t, p, s)
  q = 0
  charset = ('a'..'z')
  transition = compute_transition_function(p,charset)
  (0..t.length-1).each do |i|
    q = transition[q,t[i]]
    if q == p.length-1
      s.push i
    end
  end
end

def compute_transition_function(p,charset)
  transition = []
  p.length.times do
    transition.push({})
  end
  charset.each do |j|
    (p.length-1).downto(0) do |k|
      # transition[k][j] = k if p[k] is a suffix of p[q]+j
    end
  end
  transition
end