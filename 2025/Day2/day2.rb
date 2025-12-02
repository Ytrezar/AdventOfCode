def d2
	txt =  File.open("2025/Day2/input.txt", "r")
	lines = txt.read.split("\n")
	processlines(lines)
end

def processlines(lines)
	result = 0
	resultp2 = 0
	lines.each do |line|
		line.split(',').each do |sequence|
			(sequence.split('-')[0].to_i..sequence.split('-')[1].to_i).each do |num|
				result += checkValid(num.to_s).to_i
				resultp2 += checkValidp2(num.to_s).to_i
			end
		end
	end
	p result
	p resultp2
end

def checkValid(num)
	# if the number is odd it cannot be invalid. Then we check if first half and second half are equal
	if !num.length.even?
		0
	elsif num[0...num.length/2] == num[num.length/2..-1] || num[0] == 0
		num
	end
end

def checkValidp2(num)
	#That regex check if there is a repetitive patern on the string and returns true if it's the case
	if num.match?(/^(.+)\1+$/)
		num
	end
end

d2