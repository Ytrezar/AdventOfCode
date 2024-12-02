def d2
	txt =  File.open("2024/Day2/input.txt", "r")
	data = txt.read.split("\n")
	getItDonePls(data)
end

def getItDonePls(data)
	safep1 = 0
	safep2 = 0
	data.each do |line|
		# Takes all the elements in the line
		# and put it in the array as integer
		row = line.split(" ").map(&:to_i)

		# Test if the line is safe. Returns -1 if safe
		# return index of faulty number if not
		test = isLineSafe(row)
		if test == -1
			safep1 += 1
			safep2 += 1
		else
			# We delete the potential faulty index and see if
			# it's safe for the part 2
			# We need to delete up to 3 numbers to check all possibilities
			row1 = row.dup
			row2 = row.dup
			row3 = row.dup
			row1.delete_at(test)
			row2.delete_at(test - 1)
			row3.delete_at(test - 2)
			test1 = isLineSafe(row1)
			test2 = isLineSafe(row2)
			test3 = isLineSafe(row3)
			# If any of this is valid then the line is safe for part 2
			if test1 == -1 or test2 == -1 or test3 == -1
				safep2 += 1
			end
		end
	end
	p safep1
	p safep2
end

def isLineSafe(row)
	diff = 0
	firsttry = true

	(1..row.size-1).each do |i|
		# If it's the first occurence the checks are differents
		if firsttry
			if checksafe(diff,row[i-1],row[i], firsttry)
				firsttry = false
				diff = row[i-1] - row[i]
			else
				return i
			end
		else
			if checksafe(diff,row[i-1],row[i], firsttry)
				diff = row[i-1] - row[i]
			else
				return i
			end
		end
	end
	-1
end
def checksafe(previousdiff, num1, num2, firsttry)
	diff = num1 - num2
	if firsttry
		if diff == 0 or diff.abs > 3
			false
		else
			true
		end
	else
		if diff == 0
			false
		elsif (diff > 0 and previousdiff < 0) or (diff < 0 and previousdiff > 0)
			false
		elsif diff.abs > 3
			false
		else
			true
		end
	end
end

d2