def d5
	txt =  File.open("2024/Day5/input.txt", "r")
	data = txt.read.split("\n\n")
	rules = data[0].split("\n").map{|line| line.split("|")}
	updates = data[1].split("\n").map{|line| line.split(",")}
	rules
	process(rules, updates)
end


def process(rules, updates)
	result = 0
	resultp2 = 0
	# We go through all the updates
	updates.each do |update|
		if isUpdateGood(update, rules)
			result += getMiddlePage(update)
		else
			resultp2 += fixBrokenUpdate(update, rules)
		end
	end
	p result
	p resultp2
end

def isUpdateGood(update, rules)
	isFine = true
	# We only check the rules if both number of the rule is in the update
	rules.each do |rule|
		if (rule & update).size == 2 and !isFineWithRule(rule,update)
			isFine = false
		end
	end
	isFine
end

def isFineWithRule(rule,update)
	# We already know that the rule is relevant. So we just need to find
	# the first page that comes related to the rule
	# If it's the 2nd page, then the rule is not validated
	update.each do |page|
		if rule.include?(page) and rule[1]==page
			return false
		elsif rule.include?(page) and rule[0]==page
			return true
		end
	end
end
def getMiddlePage(pages)
	pages[pages.size/2].to_i
end

def fixBrokenUpdate(update, rules)
	# Everytime we see a rule not valid we swap numbers
	rules.each do |rule|
		if (rule & update).size == 2 and !isFineWithRule(rule,update)
			update = swapRuleNumbers(rule, update)
		end
	end
	# We check if the swap have not broken any other rules. If it's still broken
	# we call back the same function until it's done.
	if isUpdateGood(update, rules)
		return getMiddlePage(update)
	else
		fixBrokenUpdate(update, rules)
	end
end

def swapRuleNumbers(rule, update)
	index1 = update.index(rule[0])
	index2 = update.index(rule[1])
	update[index1], update[index2] = update[index2], update[index1]
	update
end

d5