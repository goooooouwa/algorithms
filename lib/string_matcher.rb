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
  transition = compute_transition_function(p, charset)
  (0..t.length-1).each do |i|
    q = transition[q, t[i]]
    if q == p.length-1
      s.push i
    end
  end
end

def compute_transition_function(p, charset)
  transition = []
  p.length.times do
    transition.push({})
  end
  (0..p.length-1).each do |i|
    charset.each do |j|
      transition[i][j] = suffix_function(p[0,i+1]+j,p)
    end
  end
  transition
end

def suffix_function(t, p)
  (p.length).downto(0) do |k|
    # return k if p[k] is a suffix of t
    return k if is_suffix(p[0,k+1],t)
  end
end

def is_suffix(p,t)
  (p.length-1).downto(0) do |i|
    return false unless p[i] == t[i]
  end
  true
end