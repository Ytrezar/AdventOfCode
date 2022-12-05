# Code inspired (and most of shamelessly copied) by https://github.com/petertseng code
# I rewrite some part and learned from it
txt =  File.open("2020/Day7/input.txt", "r")
data = txt.read
bags = data.split("\n")
contain = Hash.new { |h, k| h[k] = [] }
contained_by = Hash.new { |h, k| h[k] = [] }
bags.each do |line|
	# split line to separate container and containing
	l, r = line.split(' contain ')
	containing_bag = l.delete_suffix(' bags')
	# split all the containing until there is no other bags
	r.split(', ').each do |contained|
		next if contained == 'no other bags.'
		# get the amount of one type of containing bag
		words = contained.split
		raise "bad bag #{contained}" unless words[-1].start_with?('bag')

		quantity = Integer(words[0])
		# fuse the name of the bags
		contained = words[1..-2].join(' ')

		contain[containing_bag] << [quantity, contained]
		contained_by[contained] << containing_bag
	end
end
my_bag = 'shiny gold'

# BFS = https://en.wikipedia.org/wiki/Breadth-first_search
# tl;dr : start from the root and explore each childs, then all the childs of the childs...
def bfs(start, neighbours:, goal:)
	current_gen = [start]
	prev = {start => nil}
	goals = {}
	gen = -1

	until current_gen.empty?
		gen += 1
		next_gen = []
		while (cand = current_gen.shift)
			goals[cand] = gen if goal[cand]

			neighbours[cand].each { |neigh|
				next if prev.has_key?(neigh)
				prev[neigh] = cand
				next_gen << neigh
			}
		end
		current_gen = next_gen
	end

	{
		found: !goals.empty?,
		gen: gen,
		goals: goals,
		prev: prev,
	}
end

puts bfs(my_bag, neighbours: contained_by, goal: ->bag { bag != my_bag })[:goals].size

@rcb_cache = {}
def recursively_contained_by(contain, bag)
	@rcb_cache[bag] ||= contain[bag].sum { |qnt, contained_bag|
		qnt * (1 + recursively_contained_by(contain, contained_bag))
	}
end

puts recursively_contained_by(contain, my_bag)