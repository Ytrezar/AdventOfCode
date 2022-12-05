txt =  File.open("2020/Day9/input.txt", "r")
data = txt.read
numbers = data.split("\n")

#calculate all the additions possible between the 25 previous numbers
def previouslines(numbers,pos)
	#isolate the 25 previous numbers in an array
	range = numbers[pos-25..pos-1]
	adds = []
	range.each do |a|
		range.each do |b|
			adds.append(a.to_i + b.to_i)
		end
	end
	return adds
end

def p1(numbers, cursor)
	#loop until the end of file OR if you get the right value
	while cursor < numbers.length
		prev = previouslines(numbers,cursor)
		if prev.include?(numbers[cursor].to_i)
			cursor +=1
		else
			return numbers[cursor].to_i

		end
	end
end

#check if starting from the cursor the next values lead to what we need
def part2(numbers,adds,cursor, value)
	total = 0
	#calculate the value of all the previous numbers and add the number from this iteration
	adds.each do |a|
		total = total + a.to_i
	end
	#unless we find the right sequence of at least 2 numbers, continue calling the same function
	if total + numbers[cursor].to_i == value and total != 0
		return adds.append(numbers[cursor].to_i)
	elsif total + numbers[cursor].to_i > value
		return 0
	else
		tosend = adds.append(numbers[cursor].to_i)
		test = part2(numbers,tosend,cursor + 1, value)
		if test == 0
			return 0
		else
			return test
		end
	end
end

part1 = p1(numbers,25)
p part1


cursor = 0
p2 = 0
#loop all the file until we get the good sequence
while p2 == 0 and cursor < numbers.length
	p2 = part2(numbers,[],cursor, part1)
	cursor += 1
end
p p2.max + p2.min