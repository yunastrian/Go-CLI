input_parameter = ARGV

if input_parameter.length == 0
	map = Array.new(20) {Array.new(20, 0)}
	
	5.times do
		loop do 
			x = Random.rand(20)
			y = Random.rand(20)
			if map[x][y] == 0
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
			break
		end
	end
else
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
	input = gets.chomp
	if input == "1"
		puts ""
		for i in 0..19
			for j in 0..19
				print map[i][j]
			end
			puts ""
		end
	elsif input == "2"
	elsif input == "3"
	elsif input == "4"
		puts "Thank you for using our service"
		break
	else
		puts "Incorrect input.."
	end
	puts ""
end