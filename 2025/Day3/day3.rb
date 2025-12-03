def d3
	txt =  File.open("2025/Day3/input.txt", "r")
	lines = txt.read.split("\n")
	processlines(lines)
end
def processlines(lines)
	result = 0
	resultp2 = 0
	lines.each do |line|
		result += getvoltageP1(line)
		resultp2 += getvoltageP2(line)
	end
	p result
	p resultp2
end
def getvoltageP1(line)
	max = 0
	max = getmaxVoltage(line,max,2,2)
	max2 = getmaxVoltage(line,max,1,2)
	(line[max] + line[max2]).to_i
end
def getvoltageP2(line)
	digitRemaining = 12
	max = 0
	result = ''
	(1..digitRemaining).reverse_each do |i|
		max = getmaxVoltage(line,max,i,12)
		result += line[max]
	end
	result.to_i
end
def getmaxVoltage(line,max,digit,maxDigit)
	if digit == maxDigit
		(max..line.size-digit).each do |i|
			if line[i].to_i > line[max].to_i
				max = i
			end
		end
	else
		max = max + 1
		(max..line.size-digit).each do |i|
			if line[i].to_i > line[max].to_i
				max = i
			end
		end
	end
	max
end
d3