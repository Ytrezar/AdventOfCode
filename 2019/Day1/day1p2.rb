def calculate(mass)
	a = ((mass.to_i / 3).floor - 2)
	if a > 0
		return a + calculate(a)
	else
		return 0
	end
end

r=0
File.foreach('input.txt'){|l|r+=calculate(l)}
puts r