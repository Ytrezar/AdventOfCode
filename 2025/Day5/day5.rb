def d5
	txt =  File.open("2025/Day5/input.txt", "r")
	lines = txt.read.split("\n\n")
	processlines(lines)
end

def processlines(lines)
	result = 0
	range = []
	# Get all the ranges into an array
	lines[0].split("\n").each do |num|
		range.append(num.split("-").map(&:to_i))
	end
	# Count the number of numbers that are in at least one range
	lines[1].split("\n").each do |num|
		result += 1 if range.any? {|r| r[0] <= num.to_i && num.to_i <= r[1]}
	end

	p result
	p getRange(range)
end

def getRange(ranges)
	# Count the number of numbers that are in at least one range

	# Sort all ranges by their start number
	ranges.sort_by! { |s, _| s }

	return 0 if ranges.empty?

	uniqueCount = 0
	# Initialize the current active range
	current_start, current_end = ranges.shift

	ranges.each do |start_num, end_num|
		# If the beginning of the current range is after the end of the previous one,
		if start_num > current_end
			# There is no overlap, so we add the current range to the total count
			uniqueCount += (current_end - current_start + 1)
			# We set the new current range
			current_start, current_end = start_num, end_num
		else
			# Overlap detected, we update the end of the current range
			# Ex: [1-5] et [3-8] will become [1-8]
			current_end = [current_end, end_num].max
		end
	end

	# Add the last range
	uniqueCount += (current_end - current_start + 1)
end

d5