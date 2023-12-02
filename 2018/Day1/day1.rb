def d1()
	txt =  File.open("input.txt", "r")
	data = txt.read.split("\n")
	value = 0
    listvalue = [0]
    check = true
    p1 = true
    #Can take a lot of time depending on your input.
    #For me the list was almost to 150k values before finding
    #anything
    while check and listvalue.length < 200000
        data.each do |calc|
            value += calc.to_i
            if check and listvalue.include? value
                check = false
                p value
            end 
            listvalue.append(value)
        end
        if p1
            p value
            p1 = false
        end
    end
end

d1()