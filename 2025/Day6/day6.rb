def d6
	txt =  File.open("2025/Day6/input.txt", "r")
	lines = txt.read.split("\n")
	processlines(lines)
end

def processlines(lines)
	result = 0
	resultp2 = 0
	problems = getProblem(lines)
	problemsP2 = getproblemP2(lines)
	problems.each do |problem|
		result += solveProblem(problem)
	end
	problemsP2.each do |problem|
		resultp2 += solveProblem(problem)
	end
	p result
	p resultp2
end

def getProblem(lines)
	#Get problems out of the input.
	temp = []
	problems = []
	lines.each do |line|
		#Store the lines in an temporary array before transforming them into problems
		temp.append(line.split)
	end

	(0..temp[0].length-1).each do |i|
		problem = []
		temp.each do |line|
			problem.append(line[i])
		end
		problems.append(problem)
	end
	problems

end

def getproblemP2(lines)
	temp = []
	problems = []
	return problems if lines.empty?

	max_length = lines.map(&:length).max
	current_chunk = Array.new(lines.size, "")

	(0...max_length).each do |i|
		# Check characther at the index i for all the lines
		column_chars = lines.map { |line| line[i] }

		# if all characters are whitespaces(or nil or end of line)
		all_spaces = column_chars.all? { |c| c.nil? || c.strip.empty? }

		if all_spaces
			# If not empty store the actual chunk of string
			unless current_chunk.all?(&:empty?)
				temp << current_chunk
				current_chunk = Array.new(lines.size, "")
			end
		else
			# Else we add the characters we read into the chunk
			lines.each_with_index do |line, idx|
				# Just in case, if line too short we add a white space. But shouldn't be needed
				char = line[i] || " "
				current_chunk[idx] += char
			end
		end
	end

	# Add the last chunk to the array
	temp << current_chunk unless current_chunk.all?(&:empty?)
	temp.each do |problem|
		transposed = problem[0...-1].map(&:chars).transpose.map(&:join)
		transposed<< problem.last
		problems<< transposed
	end
	problems
end

def solveProblem(problem)

	if problem[problem.length-1].strip == "+"
		result = 0
		(0..problem.length-2).each do |i|
			result += problem[i].to_i
		end
	else
		result = 1
		(0..problem.length-2).each do |i|
			result *= problem[i].to_i
		end
	end
	result
end

def solveProblemp2(problem)

end

d6