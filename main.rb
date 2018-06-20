parameter = ARGV

if parameter.length == 0
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
elsif parameter.length == 3
    map = Array.new(parameter[0].to_i) {Array.new(parameter[0].to_i, 0)}
	map[parameter[1].to_i][parameter[2].to_i] = 2
	5.times do
        loop do 
            x = Random.rand(parameter[0].to_i)
            y = Random.rand(parameter[0].to_i)
            if map[x][y] == 0
                map[x][y] = 1
                break
            end
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