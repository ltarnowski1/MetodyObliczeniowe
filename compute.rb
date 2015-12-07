require hermite

# Dane do obliczeń: n, x, y, z
# Przygotowanie danych do obliczeń 
t = []
t.push([])
for x0 in x
  t[0].push(x0)
  t[0].push(x0)
end

# Pętla obliczeniowa
while t[t.length-1].length >1
  lt = t[t.length-1]
  nt = []
  for i in Range.new(1, lt.length-1)
    xn = x[i]-x[i-1]
    tn = (lt[i-1]*lt[i])/xn unless xn == 0
    tn = pochodna
    nt.push(tn)
  end
  t.push(nt)
end

# Przygotowanie danych do wydruku
f = []
for n in t
  f.push(n[0])
end
t = t[0]

require printer
