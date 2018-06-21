#Author : Kurniandha Sukma Yunastrian

#Main Program
parameter = ARGV

f = File.open("history.txt", "w")
f.close
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
	
	customer_position_X = 0
	customer_position_Y = 0
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

loop do
    puts "Main Menu :"
    puts "1. Show map"
    puts "2. Order Go Ride"
    puts "3. View trips history"
    puts "4. Close the application"
    puts ""	
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
        puts "Enter your coordinate destination"
        print "X : "
        destination_X = STDIN.gets.chomp.to_i
        print "Y : "
        destination_Y = STDIN.gets.chomp.to_i
        distance_min = -1
		driver_num = 0
        for i in 0..driver_position_X.length-1
            distance_temp = (driver_position_X[i]-customer_position_X).abs + (driver_position_Y[i]-customer_position_Y).abs
			if distance_min < 0
			    distance_min = distance_temp
				driver_num = i
			elsif distance_min > distance_temp
			    driver_num = i
				distance_min = distance_temp
			end
		end
		
		direction = Array.new
		customer_start_X = customer_position_X
		customer_start_Y = customer_position_Y
		check = 0
		price = 300*((destination_X-customer_position_X).abs + (destination_Y-customer_position_Y).abs)
		puts "Driver Name : Andy"
		puts "Price estimation : #{price}"
		puts "Route : "
        puts "- start at (#{customer_position_X},#{customer_position_Y})"
		direction.push("- start at (#{customer_position_X},#{customer_position_Y})")
        while customer_position_X < destination_X
		    customer_position_X += 1
		    puts "- go to (#{customer_position_X},#{customer_position_Y})"
			check = 1
			direction.push("- go to (#{customer_position_X},#{customer_position_Y})")
		end
		while customer_position_X > destination_X
		    customer_position_X -= 1
		    puts "- go to (#{customer_position_X},#{customer_position_Y})"
		    check = 2
			direction.push("- go to (#{customer_position_X},#{customer_position_Y})")
		end
		if check == 1
		    if customer_position_Y > destination_Y
			    puts "- turn right"
				direction.push("- turn right")
			elsif customer_position_Y < destination_Y
			    puts "- turn left"
				direction.push("- turn left")
			end
		elsif check == 2
		    if customer_position_Y < destination_Y
			    puts "- turn right"
				direction.push("- turn right")
			elsif customer_position_Y > destination_Y
			    puts "- turn left"
				direction.push("- turn left")
			end
		end
		while customer_position_Y < destination_Y
		    customer_position_Y += 1
		    puts "- go to (#{customer_position_X},#{customer_position_Y})"
			direction.push("- go to (#{customer_position_X},#{customer_position_Y})")
		end
		while customer_position_Y > destination_Y
		    customer_position_Y -= 1
		    puts "- go to (#{customer_position_X},#{customer_position_Y})"
			direction.push("- go to (#{customer_position_X},#{customer_position_Y})")
		end
		puts "- finish at (#{customer_position_X},#{customer_position_Y})"
		direction.push("- finish at (#{customer_position_X},#{customer_position_Y})")
		puts ""
		print "Confirm this reservation? (Y/N) : "
		confirm = STDIN.gets.chomp
		if (confirm == "Y" || confirm == "y")
		    map[customer_position_X][customer_position_Y] = 2
			map[customer_start_X][customer_start_Y] = 0
		    File.open("history.txt","a") do |line|
			    line.puts "Driver Name : Andy"
				line.puts "Price : #{price}"
				line.puts "Route :"
				for i in 0..direction.length-1
				    line.puts direction[i]
				end
				line.puts "--------------------------"
			end
		else 
		    customer_position_X = customer_start_X
			customer_position_Y = customer_start_Y
		end
    elsif input == "3"
	    puts "History : "
	    f = File.open("history.txt", "r")
		f.each_line do |line|
		    puts line
		end
		f.close
    elsif input == "4"
        puts "Thank you for using our services..!"
        break
    else
        puts "Incorrect input.."
    end
    puts ""
end