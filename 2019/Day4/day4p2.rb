min = 245318
max = 765747
cpt =0
(min...max).each do |i|
	s = i.to_s.split ""
	double = false
	incr = true
	if !(s.sort == s)
		incr = false
	end
	if ((s[0] == s[1] && s[1] != s[2]) || (s[1] == s[2] && s[1] != s[0] && s[1] != s[3]) || (s[2] == s[3] && s[2] != s[1] && s[2] != s[4]) || (s[3] == s[4] && s[3] != s[2] && s[3] != s[5]) || (s[4] == s[5] && s[4] != s[3]))
		double = true
	end
	if incr == true && double == true
		cpt += 1
	end
end

puts cpt.to_s