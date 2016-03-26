def finite_automation_matcher(t, p, s)
  q = 0
  charset = compute_charset(t)
  transition = compute_transition_function(p, charset)
  (0..t.length-1).each do |i|
    q = transition[q][t[i]]
    if q == p.length
      s.push(i+1-p.length)
    end
  end
end

def compute_charset(t)
  t.split('').uniq
end

def compute_transition_function(p, charset)
  transition = []
  (p.length+1).times do
    transition.push({})
  end
  (0..p.length).each do |i|
    charset.each do |j|
      transition[i][j] = suffix_function(p[0,i]+j,p)
    end
  end
  transition
end

def suffix_function(t, p)
  longest_suffix_length = t.length > p.length ? p.length : t.length
  longest_suffix_length.downto(1) do |k|
    # return k if p[k] is a suffix of t
    return k if is_suffix?(p[0,k],t)
  end
  0
end

def is_suffix?(p,t)
  (1..p.length).each do |i|
    return false unless p[p.length-i] == t[t.length-i]
  end
  true
end