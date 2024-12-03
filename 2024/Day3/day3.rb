def d3
	txt =  File.open("2024/Day3/input.txt", "r")
	data = txt.read.split("\n")
	process(data)
end

def process(data)
	regex = /mul\((\d{1,3}),(\d{1,3})\)/
	regex2 = /(do\(\))|(don't\(\))|mul\((\d{1,3}),(\d{1,3})\)/
	result = 0
	result2 = 0
	ignore = false

	data.each do |line|
		values = line.scan(regex)
		values2 = line.scan(regex2)

		values.each do |value|
			result = result + value[0].to_i * value[1].to_i
		end
		values2.each do |value|
			#By the conception of my regex, each occurence of value will either have :
			# - do() nil nil nil
			# - nil don't() nil nil
			# - nil nil number number
			# we use this to set ignore the right value and wait for the next set of numbers
			if value[1] == "don't()"
				ignore = true
			elsif value[0] == "do()"
				ignore = false
			elsif !ignore
				result2 = result2 + value[2].to_i * value[3].to_i
			end
		end
	end

	p result
	p result2
end

d3