def d1p1()
	txt =  File.open("2021/Day1/input.txt", "r")
	data = txt.read.split("\n")
	i = 1
	cpt = 0
	while i < data.length
		if data[i].to_i > data[i-1].to_i
			cpt+=1
		end
		i+=1
	end
	cpt
end

def d1p2()
	txt =  File.open("2021/Day1/input.txt", "r")
	data = txt.read.split("\n")
	i = 0
	cpt = 0
	while i+2 < data.length
		if data[i+1].to_i+data[i+2].to_i+data[i].to_i > data[i+1].to_i+data[i-1].to_i+data[i].to_i
			cpt+=1
		end
		i+=1
	end
	cpt
end

p d1p1()
p d1p2()