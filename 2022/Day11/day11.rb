class Monkey
	attr_accessor :startingitems, :name, :operation, :testvalue, :testtrue, :testfalse, :inspected, :lcm
	def initialize (data)
		@name = data[0]
		@startingitems = []
		@operation = []
		@test = []
		@inspected = 0
		@lcm = 1
		arrangestartingitems(data[1].sub("  Starting items: ",""))
		defineoperation(data[2].sub("  Operation: new =", ""))
		definetest(data[3], data[4], data[5])
	end

	def arrangestartingitems(data)
		data.split(', ') do |item|
			@startingitems.append(item.to_i)
		end
	end

	def defineoperation(data)
		data.split(' ') do |element|
			@operation.append(element)
		end
	end

	def definetest(data1,data2,data3)
		@testvalue = data1.sub("  Test: divisible by ", "").to_i
		@testtrue = data2.sub("    If true: throw to monkey ","").to_i
		@testfalse = data3.sub("    If false: throw to monkey ","").to_i
	end
end


def round(monkeys, part)
	monkey = 0
	while monkey < monkeys.length
		i = monkeys[monkey].startingitems.length - 1
		while i >= 0
			monkeys[monkey].startingitems[i] = inspection(monkeys[monkey], i, part)
			monkeys[targetmonkey(monkeys[monkey], i)].startingitems.append(monkeys[monkey].startingitems[i])
			monkeys[monkey].startingitems.delete_at(i)
			i -= 1
		end
		monkey += 1
	end
end

def targetmonkey(monkey, i)
	if monkey.startingitems[i] % monkey.testvalue == 0
		monkey.testtrue
	else
		monkey.testfalse
	end
end

def inspection(monkey,i, part)
	monkey.inspected += 1
	if part == 2
		if monkey.operation[1] == '+' and monkey.operation[2] != 'old'
			return ((monkey.startingitems[i] + monkey.operation[2].to_i) % monkey.lcm)
		end
		if monkey.operation[1] == '+' and monkey.operation[2] == 'old'
			(return (monkey.startingitems[i] + monkey.startingitems[i]) % monkey.lcm)
		end
		if monkey.operation[1] == '*' and monkey.operation[2] != 'old'
			return ((monkey.startingitems[i] * monkey.operation[2].to_i) % monkey.lcm)
		end
		if monkey.operation[1] == '*' and monkey.operation[2] == 'old'
			return ((monkey.startingitems[i] * monkey.startingitems[i]) % monkey.lcm)
		end
	else
		if monkey.operation[1] == '+' and monkey.operation[2] != 'old'
			return ((monkey.startingitems[i] + monkey.operation[2].to_i) / 3)
		end
		if monkey.operation[1] == '+' and monkey.operation[2] == 'old'
			(return (monkey.startingitems[i] + monkey.startingitems[i]) / 3)
		end
		if monkey.operation[1] == '*' and monkey.operation[2] != 'old'
			return ((monkey.startingitems[i] * monkey.operation[2].to_i) / 3)
		end
		if monkey.operation[1] == '*' and monkey.operation[2] == 'old'
			return ((monkey.startingitems[i] * monkey.startingitems[i]) % monkey.lcm / 3)
		end
	end
end



def d11
	txt =  File.open("2022/Day11/input.txt", "r")
	data = txt.read.split("\n\n")
	round = 0
	monkeys = []
	lcm = 1
	data.each do |monkey|
		monkeys.append(Monkey.new(monkey.split("\n")))
	end
	monkeys.each do |monkey|
		lcm = lcm * monkey.testvalue
	end
	monkeys.each do |monkey|
		monkey.lcm = lcm
	end
	#change the values here depending of part1 or 2
	while round < 10000
		round(monkeys,2)
		round += 1
	end
	max1 = 0
	max2 = 0
	monkeys.each do |monkey|
		if monkey.inspected > max1
			max2 = max1
			max1 = monkey.inspected
		elsif monkey.inspected > max2
			max2 = monkey.inspected
		end
	end
	p max1 * max2
end

d11