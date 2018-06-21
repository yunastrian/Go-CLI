#Main Program
parameter = ARGV

driver_position_X = Array.new
driver_position_Y = Array.new
if parameter.length == 0
    map = Array.new(20) {Array.new(20, 0)}
    5.times do
        loop do 
            x = Random.rand(20)
            y = Random.rand(20)
            if map[x][y] == 0
                driver_position_X.push(x)
		driver_position_Y.push(y)
                map[x][y] = 1
                break
            end
        end
    end
	
    loop do
        x = Random.rand(20)
        y = Random.rand(20)
        if map[x][y] != 1
            map[x][y] = 2
	    customer_position_X = x
            customer_position_Y = y
            break
        end
    end
elsif parameter.length == 3
    map = Array.new(parameter[0].to_i) {Array.new(parameter[0].to_i, 0)}
    map[parameter[1].to_i][parameter[2].to_i] = 2
    customer_position_X = parameter[1].to_i
    customer_position_Y = parameter[2].to_i
	5.times do
        loop do 
            x = Random.rand(parameter[0].to_i)
            y = Random.rand(parameter[0].to_i)
            if map[x][y] == 0
                map[x][y] = 1
                driver_position_X.push(x)
		driver_position_Y.push(y)
                break
            end
        end
    end
else 
    f = File.open(parameter[0], "r")
    line_num = 0
    f.each_line do |line|
        if line_num == 0
            map = Array.new(line.to_i) {Array.new(line.to_i, 0)}
        elsif line_num == 1
	    customer_position_X,customer_position_Y = line.split(",")
            customer_position_X = customer_position_X.to_i
            customer_position_Y = customer_position_Y.to_i
            map[customer_position_X][customer_position_Y] = 2
        else 
            X_temp,Y_temp = line.split(",")
	    driver_position_X.push(X_temp.to_i)
	    driver_position_Y.push(Y_temp.to_i)
	    map[X_temp.to_i][Y_temp.to_i] = 1
	end
	line_num += 1
    end
    f.close
end

puts "Welcome to Go-CLI Application"
puts "- Your Private Transport -"
puts ""
puts "Main Menu :"
puts "1. Show map"
puts "2. Order Go Ride"
puts "3. View trips history"
puts "4. Close the application"
puts ""

loop do
    puts "Input the number"
    print "> "
    input = STDIN.gets.chomp
    if input == "1"
        puts ""
        for i in 0..map.length-1
    	    for j in 0..map.length-1
                print map[i][j]
            end
            puts ""
        end
        puts "1 = Driver position"
        puts "2 = Your position"
    elsif input == "2"
    elsif input == "3"
    elsif input == "4"
        puts "Thank you for using our services..!"
        break
    else
        puts "Incorrect input.."
    end
    puts ""
end