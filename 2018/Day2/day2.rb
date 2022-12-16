def d2
	txt =  File.open("input.txt", "r")
	data = txt.read.split("\n")
    deux = 0
    trois = 0

    data.each do |line1|
        data.each do |line2|
            diff_count = line1.chars.zip(line2.chars).count { |char1, char2| char1 != char2 }
            #I'm lazy, just do the substraction yourself
            if diff_count == 1
                p line1
                p line2
            end
        end
    end

    data.each do |line|
        check = {}
        stop2 = true
        stop3 = true
        line.split('').each do |letter|
            if check[letter]
                check[letter] += 1
            else
                check[letter] = 1
            end
        end
        check.each do |key, value|
            if value == 2 and stop2
                deux += 1
                stop2=false
            elsif value == 3 and stop3
                trois += 1
                stop3 = false
            end
        end
    end
    p deux * trois

end


d2

uwfmdjxyxlbgnrotcfpvswaqh