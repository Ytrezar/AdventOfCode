txt =  File.open("2020/Day4/input.txt", "r")
data = txt.read
passport = data.split("\n\n")
good1 = 0
good2 = 0
check = %w[amb blu brn gry grn hzl oth]
passport.each do |ligne|
	ok1 = 0
	ok2 = 0
	ligne.split(/[\n, ]/).each do |element|
		if element.match(/^byr|^iyr|^eyr|^hgt|^hcl|^ecl|^pid/)
			ok1 += 1
			splitelement = element.split(":")
			if element.start_with?("byr") and splitelement[1].to_i >= 1920 and splitelement[1].to_i <= 2002
				ok2 += 1
			elsif element.start_with?("iyr") and splitelement[1].to_i >= 2010 and splitelement[1].to_i <= 2020
				ok2 += 1
			elsif element.start_with?("eyr") and splitelement[1].to_i >= 2020 and splitelement[1].to_i <= 2030
				ok2 += 1
			elsif element.start_with?("hgt")
				test = splitelement[1][0..-2].to_i
				if splitelement[1].end_with?("cm")
					if test >= 150 and test <= 193
						ok2+=1
					end
				elsif splitelement[1].end_with?("in")
					if test >= 59 and test <= 76
						ok2 += 1
					end
				end
			elsif element.start_with?("hcl") and splitelement[1].match(/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/i)
				ok2 += 1
			elsif element.start_with?("ecl") and check.include?(splitelement[1])
				ok2 += 1
			elsif element.start_with?("pid") and splitelement[1].match(/^[0-9]{9}$/)
				ok2 +=1
			end
		end
	end
	if ok1 == 7
		good1 += 1
	end
	if ok2 == 7
		good2 += 1
	end
end
p good1
p good2