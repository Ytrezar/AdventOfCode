def d1
	txt =  File.open("2025/Day1/input.txt", "r")
	lines = txt.read.split("\n")
	processlines(lines)
end

def processlines(lines)
	cursor = 50
	password = 0
	clicks = 0
	lines.each do |line|
		if line[0] == 'R'
			clicks += countingclicks(cursor,line[1..-1].to_i)
			cursor = turncursor(cursor,line[1..-1].to_i)
		else
			clicks += countingclicks(cursor,-1 * line[1..-1].to_i)
			cursor = turncursor(cursor,-1 * line[1..-1].to_i)
		end
		if cursor == 0
			password += 1
		end
	end
	p password
	p clicks
end

def turncursor(cursor,movement)
	# We need to turn the cursor based on the movement while keeping the value in the range [0,99]
	(cursor + movement) % 100
end

def countingclicks(cursor, movement)
	# We get the obvious turns first
	value = movement.abs / 100

	# We take the remaining movement
	remainder = movement.abs % 100

	if movement > 0
		if cursor + remainder >= 100
			value += 1
		end
	elsif movement < 0
		# The extra condition is here to prevent the case where the cursor is at 0 and we turn left from
		# counting a 0 twice
		if cursor > 0 && (cursor - remainder) <= 0
			value += 1
		end
	end
	value
end

d1