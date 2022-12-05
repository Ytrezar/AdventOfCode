def d2p1()
	txt =  File.open("2021/Day2/input.txt", "r")
	data = txt.read.split("\n")
	x = 0
	y = 0
	data.each do |instruction|
		way = instruction.split(" ")[0]
		steps = instruction.split(" ")[1]
		if way == "forward"
			x += steps.to_i
		elsif way == "down"
			y += steps.to_i
		else
			y -= steps.to_i
		end
	end
	x * y
end


def d2p2()
	txt =  File.open("2021/Day2/input.txt", "r")
	data = txt.read.split("\n")
	x = 0
	y = 0
	aim = 0
	data.each do |instruction|
		way = instruction.split(" ")[0]
		steps = instruction.split(" ")[1]
		if way == "forward"
			x += steps.to_i
			y += steps.to_i * aim
		elsif way == "down"
			aim += steps.to_i
		else
			aim -= steps.to_i
		end
	end
	x * y
end

p d2p1()
p d2p2()