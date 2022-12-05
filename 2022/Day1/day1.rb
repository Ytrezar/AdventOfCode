def d1p1p2()
	txt =  File.open("2022/Day1/input.txt", "r")
	data = txt.read.split("\n\n")
	max = []
	data.each do |elfe|
		i = 0
		elfe.split("\n").each do |number|
			i = i + number.to_i
		end
		max.append(i)
	end
	max = max.sort.reverse
	p max[0]
	p max[0] + max[1] + max[2]
end
d1p1p2()