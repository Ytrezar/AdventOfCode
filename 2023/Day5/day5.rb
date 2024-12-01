def d5p1()
	txt =  File.open("2023/Day5/input.txt", "r")
	data = txt.read.split("\n\n")
	seeds = data[0].split(': ')[1].split(' ').map(&:to_i)
	min = -1
	#Go through all the maps
	(0...seeds.length).each do |cpt|
		check = checkSeed(data,seeds[cpt])
		if min == -1 or (min != -1 and min > check)
			min = check
		end
	end
	p min
end


def d5p2()
	txt =  File.open("2023/Day5/input.txt", "r")
	data = txt.read.split("\n\n")
	seeds = data[0].split(': ')[1].split(' ').map(&:to_i)
	i = 0
	min = -1
	while i < seeds.length
		elements = (seeds[i] + seeds[i+1] -1 - seeds[i])
		p
		p Time.now.strftime("%H:%M:%S ").to_s + " Starting check with " +  elements.to_s + " elements"
		(seeds[i]...seeds[i] + seeds[i+1] -1).each do |seed|
			check = checkSeed(data,seed)
			if  (seed - seeds[i]) % 100000 == 0
				p Time.now.strftime("%H:%M:%S ").to_s + (seed - seeds[i]).to_s + '/' + elements.to_s + ' done (' +(((seed - seeds[i])).to_f / elements * 100).round(2).to_s + '% done)'
			end
			if min == -1 or (min != -1 and min > check)
				min = check
			end
		end
		p min
		i += 2
	end
	p min
end

def checkSeed(data, seed)
	(1...data.length).each do |i|
		ranges = data[i].split("\n")
		test =  ranges.shift
		result = -1
		#check all elements in maps for the seed
		(0...ranges.length).each do |j|
			source = ranges[j].split(' ')[1].to_i
			target = ranges[j].split(' ')[0].to_i
			range = ranges[j].split(' ')[2].to_i
			#result -1 means that we have yet to find the appropriate map for the seed
			if result == - 1
				result = processing(seed, source, target, range)
			end
		end
		#if after all this the result is still -1 it means that we don't need to change the seed as it is the same
		if result != - 1
			seed = result
		end
	end
	return seed
end

def processing(seed, source,target, range)
	if source <= seed  and seed <= (source + range -1)
		return target + (seed - source)
	else
		return -1
	end
end

d5p1()
d5p2()