# Czy debugowac?
@debug = false

# Fukncja zwracajaca liste podzbiorow (po k elementow) ze zbioru setT (n elementowego)
def newton(n, k, setT)
	setT.take(n).combination(k).to_a
end

# Funkcja oblicza argumenty dla kolejnych x^k gdzie k nalezy do przedzialu <0,n)
def compute_result(f, t, n)
	wynik = Array.new(n)

	for i in Range.new(0, n-1)
		if i > 0
			print " + " if @debug == true
		end
		print "x^#{i}(" if @debug == true
		wynik[i] = 0
		for j in Range.new(i, n-1)
			x = newton(j, j-i, t)
			if x.count > 0
				for a in x
					tmp = f[j]
					if j != i
						if (((j-i) % 2) == 0)
							tmp = f[j]
							print " + " if @debug == true
						else
							tmp = -tmp
							print " -  " if @debug == true
						end
					end
					print "f[#{j}]" if @debug == true
					for b in a
						print "*" if @debug == true
						print b if @debug == true
						tmp *= b
					end
					wynik[i] += tmp
				end
			end
		end
		print ")" if @debug == true
	end
	return wynik
end

# Funkcja drugujaca wielomian interpolacyjny dla zadanej tablicy argumentow x^k
def print_result(w)
puts "\n" if @debug == true
puts "\n" if @debug == true
	n = w.count
	for i in Range.new(0, n-1)
		print "+" if i > 0 && w[i] > 0 && w[i-1] != 0
		print "#{w[i]}*" unless w[i] == 0 || w[i] == 1 || w[i] == -1
		print "-" if w[i] == -1
		print "x^#{i}" unless w[i] == 0
	end
end

# Dane generowane testowo
n = 6
f = Range.new(1, n).to_a
t = Range.new(1, n).to_a

# Przykladowe dane z wykladu str 10
f = [0,2,1,0]
t = [1,2,4,5]
n = f.count

# Przykladowe dane z wykladu str 16
f = [0,1,0,-1,3,-2]
t = [0,0,1,1,1,2,2]
n = f.count

# Przykladowe wywolanie z drukowaniem
print_result(compute_result(f, t, n))
