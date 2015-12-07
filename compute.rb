require hermite

; Dane do obliczeń: n, x, y, z
t = []
t.pusb([])
for x0 in x
  t[0].push(x0)
  t[0].push(x0)
end for

while last(t).length >1
  lt = last(t)
  nt = []
  for i in range(1, lt.length-1)
    xn = x[i]-x[i-1]
    tn = (lt[i-1]*lt[i])/xn unless xn == 0
    tn = pochodna
    nt.push(tn)
  end for
  t.push(nt)
end while

require printer
