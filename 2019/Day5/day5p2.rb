txt =  File.open("input.txt", "r")
data = txt.read.split(",").map &:to_i
i = 0
inc = 0
aput = ""
while data[i].to_i != 99
	instruction = data[i].to_s.split("")
	while instruction.length < 5
		instruction.unshift(0)
	end
	opcode = (instruction[3].to_s + instruction[4].to_s).to_i
	op1 = instruction[2].to_i == 0 ? data[data[i+1]] : data[i + 1]
	op2 = instruction[1].to_i == 0 ? data[data[i+2]] : data[i + 2]
	result = instruction[0].to_i == 0 ? data[i+3] : i + 3
	case opcode
	when 1 then data[result] = op1 + op2; i += 4
	when 2 then data[result] = op1 * op2; i += 4
	when 3 then data[data[i+1]] = 5; i += 2;
	when 4 then puts op1; i += 2
	when 5 then op1 != 0 ? i = op2 : i += 3
	when 6 then op1 == 0 ? i = op2 : i += 3
	when 7 then data[result] = op1 <  op2 ? 1 : 0; i += 4
	when 8 then data[result] = op1 == op2 ? 1 : 0; i += 4
	else p "Erreur";break
	end
end