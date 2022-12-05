txt =  File.open("2020/Day8/input.txt", "r")
data = txt.read
instructions = data.split("\n")
position = 0
accumulator = 0
lastaccu = position
memory = []

def resolve(instructions, position,memory,accumulator)
	if memory.include?(position)
		return 0
	else
		if instructions[position].split(" ")[0] == "acc"
			if position == instructions.length - 1
				p accumulator
				return accumulator + instructions.split(" ")[position][1].to_s
			else
				return resolve(instructions,position + 1, memory.append(position),accumulator + instructions[position].split(" ")[1].to_i)
			end
		elsif instructions[position].split(" ")[0] == "jmp"
			if position == instructions.length - 1
				p accumulator
				return accumulator
			else
				test = resolve(instructions,position + instructions[position].split(" ")[1].to_i, memory.append(position),accumulator)
				if test == 0
					return resolve(instructions,position + 1, memory.append(position),accumulator)
				end
			end

		else
			if position == instructions.length - 1
				p accumulator
				return accumulator
			else
				test = resolve(instructions,position + 1, memory.append(position),accumulator)
				if test == "no"
					return resolve(instructions,position + instructions.split(" ")[1], memory.append(position),accumulator)
				end
			end
		end
	end

end


until memory.include?(position)
	lastaccu = accumulator
	memory.append(position)
	split = instructions[position].split(" ")
	if split[0] == "acc"
		accumulator += split[1].to_i
		position += 1
	elsif split[0] == "jmp"
		position += split[1].to_i
	else
		position += 1
	end
end
p lastaccu
resolve(instructions,0,Array.new,0)