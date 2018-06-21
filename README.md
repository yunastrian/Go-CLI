# Go-CLI
**Go-CLI** is a simple version of **GO-JEK** application. It is CLI based. 

## Explanation
This program is **Second Stage Final Assignment** of **Software Engineering Academy** by **Compfest X - GO-JEK**.

## Design
I created this program only in one file in *main.rb* and wrote it only in main program.

## Program Feature
- Show Map
- Order Go Ride
- View History

## How to Run
There are **three ways** to execute this program :
**1. Run without any parameters** <br>
In this case, the app will generate a 20\*20 map, out 5 drivers at random coordinates, and put user at a random coordinate
```
ruby main.rb
```

**2. Run and passing three parameters** <br>
In this case, the first parameter (let say n) would be the size of the map (n\*n), the second and the third parameter (let say x and y) will be the coordinate of user (x,y). The app will generate 5 drivers and put them randomly on the map.
```
ruby main.rb n x y
```
Example :
```
ruby main.rb 5 1 2
```

**3. Run by passing a filename as parameter** <br>
In this case, the app will generate a map with size as specified in the file, put the user in the coordinate as specified in the line, and put the number of drivers and their position as specified in the file as well.
```
ruby main.rb {file name}
```
Example :
```
ruby main.rb sample.txt
```

## Note
This program save the trips history in the file named *history.txt*. <br>
If it will run by passing a filename as parameter, put that file in **one directory** with *main.rb*

## Author
[Kurniandha Sukma Yunastrian](https://github.com/yunastrian)