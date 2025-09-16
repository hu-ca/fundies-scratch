use context starter2024
include image
#1. T-Shirt Shop
#Calculating Cost
#cost of 5 identical t-shirts
(12 * 5) + 3
#cost of 7 identical t-shirts
(12 * 7) + 3
#Rectangular Poster
#Perimeter of a rectangle size 420 by 594 mm
perimeter = (420 + 594) * 2
perimeter
#Cost of poster 
perimeter * 0.1
#if you forget parentheses around width and height, you will get an error
#2. String Surprises
#Saving a Tagline
"Designs for Everyone!"
#Colour Inventory
"red"
"blue"
"red" + "blue"
#if you do 1 + "blue" you will get an error
#3. Making a Traffic Light
traffic_light = overlay-align("center", "top", above(above(circle(18, "solid", "red"), circle(18, "solid", "yellow")), (circle(18, "solid", "green"))), (rectangle(40, 100, "solid", "black")))
above(traffic_light, rectangle(10, 50, "solid", "black"))
#4. Broken Code Hunt
# Goal: A rectangle with width 50 and height 20, solid black
rectangle(50, 20, "solid", "black")
circle(30, "solid", "red")
#5. Create a flag or shield
shape_shield = rotate(45, square(100, "solid", "white"))
emblem = rotate(30, radial-star(8, 28, 16, "solid", "purple"))
my_shield = overlay(overlay(emblem, circle(30, "solid", "blue")), shape_shield)
overlay(text("Go!", 20, "black"), my_shield)


