#Inspired by tckmn code https://github.com/tckmn/polyaoc-2019
#I had a lot of trouble with this one and his code helped me to understand how it works!
#Thanks!

require 'set'

def moving(wire)
	x = 0
	y = 0
	positions = Set.new
	wire.each do |move|
		number = move[1..-1].to_i
		px, py = 0
		type = move[0]
		number = move[1..-1].to_i
		if type == "R"
			px = 1
			py = 0
		elsif type == "L"
			px = -1
			py = 0
		elsif type == "U"
			px = 0
			py = 1
		else
			px =0
			py = -1
		end
		(0..number).each do |i|
			point = [x+px*i,y+py*i]
			positions.add point
		end
		x += px * number
		y += py * number
	end
	return positions.delete([0,0])
end


wire1, wire2 = File.readlines 'input.txt'
wire1 = wire1.split(",")
wire2 = wire2.split(",")
chemin1 = moving(wire1)
chemin2 = moving(wire2)
puts (chemin1 & chemin2).map{|x| x.map(&:abs).sum}.min