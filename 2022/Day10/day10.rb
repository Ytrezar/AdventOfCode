def rendering(crtposition, x)
	if [x, x+1, x-1].include? crtposition
		'#'
	else
		'.'
	end
end

def d10p1
	x = 1
	cycle = 1
	sum = 0
	txt =  File.open("2022/Day10/input.txt", "r")
	data = txt.read.split("\n")
	data.each do |instruction|
		if instruction == "noop"
			cycle += 1
		else
			if [20,60,100,140,180,220].include?(cycle + 1)
				sum += x * (cycle+1)
			end
			cycle += 2
			x += instruction.split(' ')[1].to_i
		end
		if [20,60,100,140,180,220].include?(cycle)
			sum += x * cycle
		end
	end
	p sum
end

def d10p2
	x = 1
	cycle = 1
	crtposition = 0
	line = 0
	render = [[],[],[],[],[],[]]
	txt =  File.open("2022/Day10/input.txt", "r")
	data = txt.read.split("\n")
	data.each do |instruction|
		if instruction == "noop"
			cycle += 1
			render[line].append(rendering(crtposition,x))
			crtposition  += 1
		else
			render[line].append(rendering(crtposition,x))
			cycle += 2
			if crtposition+1 == 40
				crtposition = 0
				line += 1
			else
				crtposition += 1
			end
			render[line].append(rendering(crtposition,x))
			crtposition += 1
			x += instruction.split(' ')[1].to_i
		end
		if crtposition == 40
			crtposition = 0
			line += 1
		end
	end
	p render[0]
	p render[1]
	p render[2]
	p render[3]
	p render[4]
	p render[5]


end
d10p1
d10p2