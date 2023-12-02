def d1p1()
	txt =  File.open("2023/Day1/input.txt", "r")
	data = txt.read.split("\n")
	p processlines(data)
end
def d1p2()
	txt =  File.open("2023/Day1/input.txt", "r")
	data = getNumbers(txt.read).split("\n")
	p processlines(data)
end
def is_number?(char)
	Integer(char) rescue false
end
def getNumbers(input_string)

	result = ""
	while input_string.length >0
		result = result + replaceLetter(input_string)
		input_string = input_string[1..-1]
	end
	return result
end

def replaceLetter(input_string)
	replacements = {
		'one' => '1',
		'two' => '2',
		'three' => '3',
		'four' => '4',
		'five' => '5',
		'six' => '6',
		'seven' => '7',
		'eight' => '8',
		'nine' => '9'
	}
	continue = true
	replacements.each do |letters,number|
		if input_string.start_with?(letters)
			return number
		end
	end
	return input_string[0]

end
def processlines(data)
	max = 0
	data.each do |line|
		dizaine = ""
		unite = ""
		line.split("").each do |char|
			if (is_number?(char))
				if dizaine == ""
					dizaine = char
					unite = char
				else
					unite = char
				end
			end
		end
		max = max + (dizaine + unite).to_i
	end
	return max
end

d1p1()
d1p2()